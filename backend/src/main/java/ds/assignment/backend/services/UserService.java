package ds.assignment.backend.services;

import ds.assignment.backend.controllers.handlers.exceptions.model.CustomException;
import ds.assignment.backend.controllers.handlers.exceptions.model.ResourceNotFoundException;
import ds.assignment.backend.dtos.UserDTO;
import ds.assignment.backend.dtos.mappers.UserMapper;
import ds.assignment.backend.dtos.validators.UserValidator;
import ds.assignment.backend.entities.Device;
import ds.assignment.backend.entities.User;
import ds.assignment.backend.repositories.DeviceRepository;
import ds.assignment.backend.repositories.UserRepository;
import ds.assignment.backend.security.CustomUserDetails;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * This Service deals with methods specific to the `user` entity
 */
@Slf4j
@Service("userService")
public class UserService {
    /**
     * The user repository deals with running sql commands specific to the `user` table
     */
    @Autowired
    private UserRepository userRepository;

    /**
     * The user repository deals with running sql commands specific to the `device` table
     */
    @Autowired
    private DeviceRepository deviceRepository;

    /**
     * This the password encoder used to encode the user password in the DB
     */
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserValidator userValidator;

    @Autowired
    SessionRegistry sessionRegistry;

    /**
     * Used for logging the steps taken.
     */
    private final Logger LOGGER = LoggerFactory.getLogger(UserService.class);

    /**
     * Create a new user with the given details
     * @param userDTO the details of the new user
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public void createUser(UserDTO userDTO) throws Exception {
        LOGGER.info("Validating the user details");
        userValidator.validateNewUser(userDTO);

        User newUser = UserMapper.toEntity(userDTO);
        newUser.setPassword(passwordEncoder.encode(userDTO.getPassword()));

        LOGGER.info("Saving the user details");
        userRepository.save(newUser);
    }

    /**
     * Find all users registered
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public List<UserDTO> findAllUsers() throws Exception {
        LOGGER.info("Retrieving the user details");
        List<User> users = userRepository.findAll();

        List<UserDTO> userDTOS = users.stream()
                .map(UserMapper::toDTO)
                .toList();

        LOGGER.info("Sending the user details");
        return userDTOS;
    }

    public UserDTO findByUsername(String username) throws Exception {
        LOGGER.info("Retrieving the user details");
        User user = userRepository.findByUsername(username);

        UserDTO userDTO = UserMapper.toDTO(user);

        LOGGER.info("Sending the user details");
        return userDTO;
    }

    /**
     * Change the details of a given user
     * @param userDTO the user whose details have to be changed
     * @return the user with details
     * @throws Exception if the user details are invalid or the DB couldn't be accessed
     */
    public UserDTO updateUser(UserDTO userDTO) throws Exception {
        LOGGER.info("Validating user details");
        userValidator.validateUpdateUser(userDTO);
        Optional<User> user = userRepository.findById(userDTO.getId());
        if (user.isEmpty()) {
            LOGGER.error("User " + userDTO.getId() + " was not found");
            throw new ResourceNotFoundException("User was not found.");
        }

        LOGGER.info("Updating the user");
        User updatedUser = user.get();

        updatedUser.setUsername(userDTO.getUsername());
        updatedUser.setEmail(userDTO.getEmail());
        updatedUser.setPassword(userDTO.getPassword());
        updatedUser.setPhoneNumber(userDTO.getPhoneNumber());
        updatedUser.setFirstName(userDTO.getFirstName());
        updatedUser.setLastName(userDTO.getLastName());
        updatedUser.setRole(userDTO.getRole());

        LOGGER.info("Saving the new user");
        userRepository.save(updatedUser);

        return UserMapper.toDTO(updatedUser);
    }

    /**
     * Delete a user by a given id
     * @param userId the id of the user to be deleted
     * @throws Exception if the user details are invalid or the DB couldn't be accessed
     */
    public void deleteUserById(UUID userId) throws Exception {
        try {
            LOGGER.info("Validating user details");
            Optional<User> user = userRepository.findById(userId);
            if (user.isEmpty()) {
                LOGGER.error("User " + userId + " was not found");
                throw new ResourceNotFoundException("User was not found.");
            }

            for (Device device : user.get().getDevices())
                deviceRepository.deleteById(device.getId());

            userRepository.deleteById(userId);
        } catch (Exception ex) {
            throw new Exception("Couldn't delete the user.");
        }
    }

    public List<CustomUserDetails> getUsersFromSessionRegistry() {
        return sessionRegistry.getAllPrincipals().stream()
                .filter(u -> !sessionRegistry.getAllSessions(u, false).isEmpty())
                .map(ses -> (CustomUserDetails)ses)
                .toList();
    }
}
