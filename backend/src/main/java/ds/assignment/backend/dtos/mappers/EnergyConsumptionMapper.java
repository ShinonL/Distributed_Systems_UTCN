package ds.assignment.backend.dtos.mappers;

import ds.assignment.backend.dtos.EnergyConsumptionDTO;
import ds.assignment.backend.entities.Device;
import ds.assignment.backend.entities.EnergyConsumption;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class EnergyConsumptionMapper {
    public static EnergyConsumptionDTO toDTO(EnergyConsumption energyConsumption) {
        EnergyConsumptionDTO energyConsumptionDTO = new EnergyConsumptionDTO();

        energyConsumptionDTO.setId(energyConsumption.getId());
        energyConsumptionDTO.setEnergyConsumption(energyConsumption.getEnergyConsumption());
        energyConsumptionDTO.setTimestamp(energyConsumption.getTimestamp());

        return energyConsumptionDTO;
    }

    public static EnergyConsumption toEntity(EnergyConsumptionDTO energyConsumptionDTO, Device device) {
        EnergyConsumption energyConsumption = new EnergyConsumption();

        energyConsumption.setId(energyConsumptionDTO.getId());
        energyConsumption.setEnergyConsumption(energyConsumptionDTO.getEnergyConsumption());
        energyConsumption.setTimestamp(energyConsumptionDTO.getTimestamp());
        energyConsumption.setDevice(device);

        return energyConsumption;
    }
}
