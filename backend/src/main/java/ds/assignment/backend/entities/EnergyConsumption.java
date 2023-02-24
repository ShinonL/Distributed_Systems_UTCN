package ds.assignment.backend.entities;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.UUID;


@Entity
@Table(name = "energy_consumption")
@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class EnergyConsumption {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Type(type = "org.hibernate.type.UUIDCharType")
    private UUID id;

    @ManyToOne()
    @JoinColumn(name = "associatedDevice")
    private Device device;

    @Column
    private Timestamp timestamp;

    @Column
    private double energyConsumption;

    public EnergyConsumption(UUID id, Timestamp timestamp, double energyConsumption) {
        this.id = id;
        this.timestamp = timestamp;
        this.energyConsumption = energyConsumption;
    }
}
