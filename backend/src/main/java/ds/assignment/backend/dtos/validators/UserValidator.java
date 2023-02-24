package ds.assignment.backend.dtos.validators;

import ds.assignment.backend.controllers.handlers.exceptions.model.DuplicateResourceException;
import ds.assignment.backend.controllers.handlers.exceptions.model.ParameterValidationException;
import ds.assignment.backend.dtos.UserDTO;
import ds.assignment.backend.repositories.UserRepository;
import lombok.SneakyThrows;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.naming.InvalidNameException;
import java.util.Collections;

@Component
public class UserValidator {
    @Autowired
    private UserRepository userRepository;

    @SneakyThrows
    public void validateNewUser(UserDTO userDTO) {
        if(StringUtils.isBlank(userDTO.getUsername()) || userDTO.getUsername().length() < 3) {
            throw new ParameterValidationException("User", Collections.singletonList("Username error"));
        }

        if(userRepository.findByUsername(userDTO.getUsername()) != null) {
            throw new DuplicateResourceException("User with username " + userDTO.getUsername() + " already exists.");
        }

        if (userRepository.findByEmail(userDTO.getEmail()) != null)
            throw new DuplicateResourceException("Email already used.");
    }

    @SneakyThrows
    public void validateUpdateUser(UserDTO userDTO) {
        if(StringUtils.isBlank(userDTO.getUsername()) || userDTO.getUsername().length() < 3) {
            throw new ParameterValidationException("User", Collections.singletonList("Username error"));
        }

        if(StringUtils.isBlank(userDTO.getFirstName()) || StringUtils.isBlank(userDTO.getLastName()))
            throw new InvalidNameException("A user must have a name assigned");
    }
}