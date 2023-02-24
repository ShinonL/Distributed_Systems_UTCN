package ds.assignment.backend.services;

import ds.assignment.backend.controllers.handlers.exceptions.model.ResourceNotFoundException;
import ds.assignment.backend.dtos.AddressDTO;
import ds.assignment.backend.dtos.DeviceDTO;
import ds.assignment.backend.dtos.mappers.AddressMapper;
import ds.assignment.backend.dtos.mappers.DeviceMapper;
import ds.assignment.backend.dtos.mappers.UserMapper;
import ds.assignment.backend.entities.Device;
import ds.assignment.backend.entities.EnergyConsumption;
import ds.assignment.backend.entities.User;
import ds.assignment.backend.repositories.DeviceRepository;
import ds.assignment.backend.repositories.EnergyConsumptionRepository;
import ds.assignment.backend.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * This Service deals with methods specific to the `device` entity
 */
@Slf4j
@Service("deviceService")
public class DeviceService {
    /**
     * Service specific for the address operations
     */
    @Autowired
    private AddressService addressService;

    /**
     * The device repository deals with running sql commands specific to the `device` table
     */
    @Autowired
    private DeviceRepository deviceRepository;

    /**
     * The user repository deals with running sql commands specific to the `user` table
     */
    @Autowired
    private UserRepository userRepository;

    /**
     * The energy consumption repository deals with running sql commands specific to the `energy_consumption` table
     */
    @Autowired
    private EnergyConsumptionRepository energyConsumptionRepository;

    /**
     * Used for logging the steps taken.
     */
    private final Logger LOGGER = LoggerFactory.getLogger(DeviceService.class);

    /**
     * Create a new device with the given details
     * @param deviceDTO the details of the new device
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    @Transactional
    public DeviceDTO createDevice(DeviceDTO deviceDTO) throws Exception {
        LOGGER.info("Validating username");
        User user = userRepository.findByUsername(deviceDTO.getUser().getUsername());
        if (user == null) {
            throw new ResourceNotFoundException("User not found");
        }
        deviceDTO.setUser(UserMapper.toDTO(user));

        LOGGER.info("Creating the address if necessary");
        AddressDTO addressDTO = addressService.createAddress(deviceDTO.getAddress());
        deviceDTO.setAddress(addressDTO);

        LOGGER.info("Validating the device details");
        Device device = DeviceMapper.toEntity(deviceDTO);

        LOGGER.info("Saving the device details");
        deviceRepository.save(device);

        return DeviceMapper.toDTO(device);
    }

    /**
     * Find all devices registered
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public List<DeviceDTO> findAllDevices() throws Exception {
        LOGGER.info("Retrieving the devices' details");
        List<Device> devices = deviceRepository.findAll();

        List<DeviceDTO> deviceDTOS = devices.stream()
                .map(DeviceMapper::toDTO)
                .toList();

        LOGGER.info("Sending the devices' details");
        return deviceDTOS;
    }

    public DeviceDTO findById(UUID id) throws Exception {
        LOGGER.info("Retrieving the devices' details");
        Optional<Device> device = deviceRepository.findById(id);
        if (device.isEmpty()) {
            throw new ResourceNotFoundException("Device not found");
        }

        LOGGER.info("Sending the device' details");
        return DeviceMapper.toDTO(device.get());
    }

    /**
     * Find all devices registered for an user
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public List<DeviceDTO> findAllByUsername(String username) throws Exception {
        LOGGER.info("Validating username");
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new ResourceNotFoundException("User not found");
        }

        LOGGER.info("Retrieving the devices' details");
        List<Device> devices = deviceRepository.findByUsername(username);

        List<DeviceDTO> deviceDTOS = devices.stream()
                .map(DeviceMapper::toDTO)
                .toList();

        LOGGER.info("Sending the devices' details");
        return deviceDTOS;
    }

    /**
     * Change the details of a given device
     * @param deviceDTO the user whose details have to be changed
     * @return the user with details
     * @throws Exception if the user details are invalid or the DB couldn't be accessed
     */
    public DeviceDTO updateDevice(DeviceDTO deviceDTO) throws Exception {
        LOGGER.info("Validating device details");
        Optional<Device> device = deviceRepository.findById(deviceDTO.getId());
        if (device.isEmpty()) {
            LOGGER.error("Device " + deviceDTO.getId() + " was not found");
            throw new ResourceNotFoundException("Device was not found.");
        }

        LOGGER.info("Validating user details");
        User user = userRepository.findByUsername(deviceDTO.getUser().getUsername());
        if (user == null) {
            LOGGER.error("User " + deviceDTO.getUser().getUsername() + " was not found");
            throw new ResourceNotFoundException("User was not found.");
        }

        LOGGER.info("Updating the device");
        Device updatedDevice = device.get();

        AddressDTO addressDTO = addressService.createAddress(deviceDTO.getAddress());
        updatedDevice.setAddress(AddressMapper.toEntity(addressDTO));

        updatedDevice.setDescription(deviceDTO.getDescription());
        updatedDevice.setMaximumHourlyConsumption(deviceDTO.getMaximumHourlyConsumption());
        updatedDevice.setUser(user);

        LOGGER.info("Saving the new device");
        deviceRepository.save(updatedDevice);

        return DeviceMapper.toDTO(updatedDevice);
    }

    /**
     * Delete a device by a given id
     * @param deviceId the id of the device to be deleted
     * @throws Exception if the device details are invalid or the DB couldn't be accessed
     */
    public void deleteDeviceById(UUID deviceId) throws Exception {
        try {
            LOGGER.info("Validating device details");
            Optional<Device> device = deviceRepository.findById(deviceId);
            if (device.isEmpty()) {
                LOGGER.error("Device " + deviceId + " was not found");
                throw new ResourceNotFoundException("Device was not found.");
            }

            User user = userRepository.findByUsername(device.get().getUser().getUsername());
            if (!user.removeDevice(device.get())) {
                LOGGER.error("Device " + deviceId + " was not removed from user");
                throw new ResourceNotFoundException("Device was not removed from user.");
            }

            for (EnergyConsumption energyConsumption : device.get().getEnergyConsumptions())
                energyConsumptionRepository.deleteById(energyConsumption.getId());

            deviceRepository.deleteById(deviceId);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception("Couldn't delete the device.");
        }
    }
}
