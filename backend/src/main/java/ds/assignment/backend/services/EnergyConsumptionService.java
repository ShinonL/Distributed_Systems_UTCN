package ds.assignment.backend.services;

import ds.assignment.backend.controllers.handlers.exceptions.model.ResourceNotFoundException;
import ds.assignment.backend.dtos.EnergyConsumptionDTO;
import ds.assignment.backend.dtos.mappers.EnergyConsumptionMapper;
import ds.assignment.backend.entities.Device;
import ds.assignment.backend.entities.EnergyConsumption;
import ds.assignment.backend.entities.User;
import ds.assignment.backend.repositories.DeviceRepository;
import ds.assignment.backend.repositories.EnergyConsumptionRepository;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * This Service deals with methods specific to the `energy_consumption` entity
 */
@Slf4j
@Service("energyConsumptionService")
public class EnergyConsumptionService {
    /**
     * The energy consumption repository deals with running sql commands specific to the `energy_consumption` table
     */
    @Autowired
    private EnergyConsumptionRepository energyConsumptionRepository;

    /**
     * The device repository deals with running sql commands specific to the `device` table
     */
    @Autowired
    private DeviceRepository deviceRepository;

    /**
     * Used for logging the steps taken.
     */
    private final Logger LOGGER = LoggerFactory.getLogger(DeviceService.class);

    /**
     * Create a new address with the given details
     * @param date The date we are looking for
     * @param deviceId Identifier of the device
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public List<EnergyConsumptionDTO> findEnergyConsumptionByDeviceAndDate(Timestamp date, String deviceId) throws Exception {
        LOGGER.info("Retrieving the consumption details by date and device id");
        List<EnergyConsumption> energyConsumptions =
                energyConsumptionRepository.findByDateAndDeviceId(date.toLocalDateTime().toLocalDate(), deviceId);

        List<EnergyConsumptionDTO> energyConsumptionDTOS = energyConsumptions.stream()
                .map(EnergyConsumptionMapper::toDTO)
                .toList();

        LOGGER.info("Sending the consumption data");
        return energyConsumptionDTOS;
    }

    /**
     * Create a new energy consumption with the given details for a given device
     * @param energyConsumptionDTO the details of the new energy consumption
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    @Transactional
    public EnergyConsumptionDTO createEnergyConsumption(EnergyConsumptionDTO energyConsumptionDTO) throws Exception {
        Optional<Device> device = deviceRepository.findById(energyConsumptionDTO.getDeviceId());
        if (device.isEmpty()) {
            LOGGER.error("Device " + energyConsumptionDTO.getDeviceId() + " was not found");
            throw new ResourceNotFoundException("Device was not found.");
        }

        EnergyConsumption energyConsumption;
        if (energyConsumptionDTO.getId() != null) {
            energyConsumption = energyConsumptionRepository.findById(energyConsumptionDTO.getId()).get();
        } else {
            LOGGER.info("Validating the address details");
            energyConsumption = EnergyConsumptionMapper.toEntity(energyConsumptionDTO, device.get());

            LOGGER.info("Saving the energy Consumption details");
            energyConsumptionRepository.save(energyConsumption);
        }

        return EnergyConsumptionMapper.toDTO(energyConsumption);
    }

    /**
     * Delete an energy consumption
     * @param energyConsumptionId the identifier of the given energy consumption
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    @Transactional
    public void deleteEnergyConsumption(UUID energyConsumptionId) throws Exception {
        Optional<EnergyConsumption> energyConsumption = energyConsumptionRepository.findById(energyConsumptionId);
        if (energyConsumption.isEmpty()) {
            LOGGER.error("Energy Consumption " + energyConsumption + " was not found");
            throw new ResourceNotFoundException("Energy Consumption was not found.");
        }

        Device device = deviceRepository.findByEnergyConsumptionId(energyConsumptionId);
        if (!device.removeEnergyConsumption(energyConsumption.get())) {
            LOGGER.error("EnergyConsumption " + energyConsumptionId + " was not removed from device");
            throw new ResourceNotFoundException("EnergyConsumption was not removed from device.");
        }

        energyConsumptionRepository.delete(energyConsumption.get());
    }
}
