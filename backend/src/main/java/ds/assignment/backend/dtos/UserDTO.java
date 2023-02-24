package ds.assignment.backend.dtos;

import ds.assignment.backend.dtos.enums.Role;
import ds.assignment.backend.dtos.validators.annotation.*;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.util.UUID;

@Data
@NoArgsConstructor
public class UserDTO extends RepresentationModel<UserDTO> {
    private UUID id;
    @NameConstraint
    private String firstName;
    @NameConstraint
    private String lastName;
    @EmailConstraint
    private String email;
    private String phoneNumber;
    @UsernameConstraint
    private String username;
    @PasswordConstraint
    private String password;
    private Role role;
}
