package ds.assignment.backend.services;

import ds.assignment.backend.broker.Producer;
import ds.assignment.backend.broker.RabbitMqConfig;
import ds.assignment.backend.dtos.DeviceDTO;
import ds.assignment.backend.dtos.EnergyConsumptionDTO;
import ds.assignment.backend.security.CustomUserDetails;
import ds.assignment.backend.websocket.WebSocketListener;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.*;

@Slf4j
@Service("schedulerService")
public class SchedulerService {
    @Autowired
    UserService userService;
    @Autowired
    DeviceService deviceService;
    @Autowired
    Environment environment;
    @Autowired
    Producer rabbitProducer;
    @Autowired
    RabbitMqConfig rabbitMqConfig;
    @Autowired
    WebSocketListener webSocketListener;

    @Value("csv.location")
    String CSV_FILE_LOCVATION;

    private final Logger LOGGER = LoggerFactory.getLogger(DeviceService.class);

    @Scheduled(cron = "0/10 * * * * *")
    @Transactional
    public void readDeviceEnergyConsumption() throws IOException, Exception {
        if(!userService.getUsersFromSessionRegistry().isEmpty()) {
            userService.getUsersFromSessionRegistry().forEach(customUserDetails -> {
                if(customUserDetails.isCustomer()) {
                    String filePath = Paths.get(Objects.requireNonNull(environment.getProperty(CSV_FILE_LOCVATION)))
                            .toAbsolutePath()
                            .toString();
                    File file = new File(filePath);

                    Scanner scanner = null;

                    try {
                        scanner = new Scanner(file);
                    } catch (FileNotFoundException e) {
                        LOGGER.error(e.getMessage());
                        e.printStackTrace();
                    }

                    scanner.useDelimiter(",");
                    List<Double> sensorValues = new ArrayList<>();
                    while(scanner.hasNextLine()) {
                        sensorValues.add(Double.parseDouble(scanner.nextLine()));
                    }
                    Random random = new Random();

                    LOGGER.info("User: " + customUserDetails.getUsername());

                    List<DeviceDTO> devices = null;

                    try {
                        devices = deviceService.findAllByUsername(customUserDetails.getUsername());
                    } catch (Exception e) {
                        LOGGER.error(e.getMessage());
                        e.printStackTrace();
                    }

                    devices.forEach(device -> {
                        int randomSensorValueIndex = random.nextInt(sensorValues.size() + 1);
                        EnergyConsumptionDTO energyConsumptionDTO = new EnergyConsumptionDTO();
                        energyConsumptionDTO.setDeviceId(device.getId());
                        energyConsumptionDTO.setEnergyConsumption(sensorValues.get(randomSensorValueIndex));
                        energyConsumptionDTO.setTimestamp(Timestamp.from(Instant.now()));

                        rabbitProducer.publish(energyConsumptionDTO, rabbitMqConfig.getExchange(), rabbitMqConfig.getRoutingKey());
                    });
                }
            });
        }
    }

    @Scheduled(cron = "0/23 * * * * * ")
    @Transactional
    public void notifyHighConsumption() throws Exception {
        if(!userService.getUsersFromSessionRegistry().isEmpty()) {
            CustomUserDetails customUserDetails = userService.getUsersFromSessionRegistry().get(0);
            if(customUserDetails.isCustomer()) {
                List<DeviceDTO> devices = deviceService.findAllByUsername(customUserDetails.getUsername());

                Timestamp startHour = Timestamp.from(Instant.now().truncatedTo(ChronoUnit.HOURS));
                Timestamp endHour = new Timestamp(startHour.getTime() + 3600000);

                devices.forEach(device -> {
                    List<EnergyConsumptionDTO> energyConsumptionDTOS = device.getEnergyConsumptions();
                    if (energyConsumptionDTOS != null && !energyConsumptionDTOS.isEmpty()) {
                        energyConsumptionDTOS = energyConsumptionDTOS.stream()
                                .filter(energyConsumption ->
                                        isInHourlyRange(startHour, endHour, energyConsumption.getTimestamp()))
                                .toList();
                        double average = energyConsumptionDTOS.stream()
                                .mapToDouble(EnergyConsumptionDTO::getEnergyConsumption)
                                .sum() / energyConsumptionDTOS.size();

                        LOGGER.info("Hourly average: " + average);
                        if (average > device.getMaximumHourlyConsumption()) {
                            webSocketListener.pushSystemStatusToWebSocket(device);
                        }
                    }
                });
            }
        }
    }

    private boolean isInHourlyRange(Timestamp startHour, Timestamp endHour, Timestamp energyConsumption) {
        return (energyConsumption.getTime() >= startHour.getTime()) && (energyConsumption.getTime() < endHour.getTime());
    }
}
