package ds.assignment.backend.repositories;

import ds.assignment.backend.entities.EnergyConsumption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Repository
public interface EnergyConsumptionRepository extends JpaRepository<EnergyConsumption, UUID> {
    @Query(
        "SELECT ec FROM EnergyConsumption ec " +
            "WHERE cast(ec.timestamp AS LocalDate) = :date AND ec.device.id = :deviceId"
    )
    List<EnergyConsumption> findByDateAndDeviceId(LocalDate date, String deviceId);
}
