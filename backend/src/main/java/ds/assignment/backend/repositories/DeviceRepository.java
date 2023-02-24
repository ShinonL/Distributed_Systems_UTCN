package ds.assignment.backend.repositories;

import ds.assignment.backend.entities.Device;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DeviceRepository extends JpaRepository<Device, UUID> {
    @Query("SELECT d FROM Device d WHERE d.user.username = :username")
    List<Device> findByUsername(String username);

    @Query("SELECT d FROM Device d " +
            "JOIN EnergyConsumption ec ON ec.device.id = d.id " +
            "WHERE ec.id = :energyConsumptionId")
    Device findByEnergyConsumptionId(UUID energyConsumptionId);
}
