package ds.assignment.backend.dtos.mappers;

import ds.assignment.backend.dtos.DeviceDTO;
import ds.assignment.backend.entities.Device;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;

import java.util.stream.Collectors;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class DeviceMapper {
    public static DeviceDTO toDTO(Device device) {
        DeviceDTO deviceDTO = new DeviceDTO();

        deviceDTO.setId(device.getId());
        deviceDTO.setDescription(device.getDescription());
        deviceDTO.setAddress(AddressMapper.toDTO(device.getAddress()));
        deviceDTO.setMaximumHourlyConsumption(device.getMaximumHourlyConsumption());
        deviceDTO.setUser(UserMapper.toDTO(device.getUser()));
        deviceDTO.setEnergyConsumptions(
                CollectionUtils.emptyIfNull(device.getEnergyConsumptions()).stream()
                .map(EnergyConsumptionMapper::toDTO)
                .collect(Collectors.toList())
        );

        return deviceDTO;
    }

    public static Device toEntity(DeviceDTO deviceDTO) {
        Device device = new Device();

        device.setId(deviceDTO.getId());
        device.setDescription(deviceDTO.getDescription());
        device.setAddress(AddressMapper.toEntity(deviceDTO.getAddress()));
        device.setMaximumHourlyConsumption(deviceDTO.getMaximumHourlyConsumption());
        device.setUser(UserMapper.toEntity(deviceDTO.getUser()));
        device.setEnergyConsumptions(
                CollectionUtils.emptyIfNull(deviceDTO.getEnergyConsumptions()).stream()
                        .map(ec -> EnergyConsumptionMapper.toEntity(ec, device))
                        .collect(Collectors.toList())
        );

        return device;
    }
}
