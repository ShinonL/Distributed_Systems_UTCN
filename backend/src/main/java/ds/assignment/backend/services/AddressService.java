package ds.assignment.backend.services;

import ds.assignment.backend.dtos.AddressDTO;
import ds.assignment.backend.dtos.mappers.AddressMapper;
import ds.assignment.backend.entities.Address;
import ds.assignment.backend.repositories.AddressRepository;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * This Service deals with methods specific to the `address` entity
 */
@Slf4j
@Service("addressService")
public class AddressService {
    /**
     * The address repository deals with running sql commands specific to the `address` table
     */
    @Autowired
    private AddressRepository addressRepository;

    /**
     * Used for logging the steps taken.
     */
    private final Logger LOGGER = LoggerFactory.getLogger(DeviceService.class);

    /**
     * Create a new address with the given details
     * @param addressDTO the details of the new address
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    @Transactional
    public AddressDTO createAddress(AddressDTO addressDTO) throws Exception {
        Address address;
        if (addressDTO.getId() != null) {
            address = addressRepository.findById(addressDTO.getId()).get();
        } else {
            LOGGER.info("Validating the address details");
            address = AddressMapper.toEntity(addressDTO);

            LOGGER.info("Saving the address details");
            addressRepository.save(address);
        }

        return AddressMapper.toDTO(address);
    }

    /**
     * Find all addresses registered
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public List<AddressDTO> findByUsername(String username) throws Exception {
        LOGGER.info("Retrieving the address details by username and device id");
        List<Address> addresses = addressRepository.findByUsername(username);

        List<AddressDTO> addressDTOS = addresses.stream()
                .map(AddressMapper::toDTO)
                .toList();

        LOGGER.info("Sending the addresses");
        return addressDTOS;
    }
}
