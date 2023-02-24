package ds.assignment.backend.dtos;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.UUID;

@Data
@NoArgsConstructor
public class EnergyConsumptionDTO {
    private UUID id;
    private UUID deviceId;
    private Timestamp timestamp;
    private double energyConsumption;
}
