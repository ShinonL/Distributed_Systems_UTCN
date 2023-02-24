package ds.assignment.backend.broker;

import ds.assignment.backend.dtos.EnergyConsumptionDTO;
import ds.assignment.backend.services.DeviceService;
import ds.assignment.backend.services.EnergyConsumptionService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class Consumer {
    private final Logger LOGGER = LoggerFactory.getLogger(Consumer.class);

    private final EnergyConsumptionService energyConsumptionService;

    public Consumer(EnergyConsumptionService energyConsumptionService) {
        this.energyConsumptionService = energyConsumptionService;
    }

    @RabbitListener(queues = "${rabbitmq.queue}")
    public void consumer(EnergyConsumptionDTO energyConsumptionDTO) throws Exception {
        LOGGER.info(String.valueOf(energyConsumptionDTO));
        energyConsumptionService.createEnergyConsumption(energyConsumptionDTO);
    }
}