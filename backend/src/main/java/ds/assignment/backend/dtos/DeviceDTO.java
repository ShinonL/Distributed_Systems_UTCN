package ds.assignment.backend.dtos;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.util.List;
import java.util.UUID;

@Data
@NoArgsConstructor
public class DeviceDTO extends RepresentationModel<DeviceDTO> {
    private UUID id;
    private String description;
    private AddressDTO address;
    private Double maximumHourlyConsumption;
    private UserDTO user;
    private List<EnergyConsumptionDTO> energyConsumptions;
}
