package ds.assignment.backend.repositories;

import ds.assignment.backend.entities.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AddressRepository extends JpaRepository<Address, UUID> {
    @Query(
        "SELECT a FROM Address a " +
            "JOIN Device d ON d.address.id = a.id " +
            "JOIN User u ON d.user.username = u.username " +
            "WHERE u.username = :username"
    )
    List<Address> findByUsername(String username);
}
