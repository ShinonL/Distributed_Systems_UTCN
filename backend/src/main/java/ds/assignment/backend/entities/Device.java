package ds.assignment.backend.entities;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "device")
@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class Device {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Type(type = "org.hibernate.type.UUIDCharType")
    private UUID id;

    @Column
    private String description;

    @ManyToOne
    @JoinColumn(name="address_id")
    private Address address;

    @Column
    private Double maximumHourlyConsumption;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @OneToMany(mappedBy = "device", cascade = CascadeType.ALL)
    private List<EnergyConsumption> energyConsumptions;

    public boolean removeEnergyConsumption(EnergyConsumption energyConsumption) {
        return energyConsumptions.remove(energyConsumption);
    }
}