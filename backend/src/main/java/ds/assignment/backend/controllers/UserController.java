package ds.assignment.backend.controllers;

import ds.assignment.backend.controllers.response.ApiResponse;
import ds.assignment.backend.dtos.UserDTO;
import ds.assignment.backend.services.UserService;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Slf4j
@RestController
@CrossOrigin
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    private final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @PostMapping("/create")
    public ResponseEntity<ApiResponse> register(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "UserController::createUser");

        try {
            LOGGER.info("Creating user account " + userDTO.getUsername());
            userService.createUser(userDTO);

            LOGGER.info("Successfully created user account " + userDTO.getUsername());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error creating user account " + userDTO.getUsername());
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/find-all")
    public ResponseEntity<ApiResponse> findAllUsers(Authentication authentication) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "UserController::findAllUsers");

        try {
            LOGGER.info("Retrieving users from DB...");
            List<UserDTO> users = userService.findAllUsers();

            for (UserDTO user: users) {
                Link devicesLink = linkTo(methodOn(DeviceController.class)
                        .findAllDevicesByUsername(user.getUsername())).withRel("devices");
                user.add(devicesLink);
            }

            LOGGER.info("Successfully retrieved users");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withData(users)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error retrieving users from DB");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/find-by-username")
    public ResponseEntity<ApiResponse> findByUsername(Authentication authentication) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "UserController::findAllUsers");

        try {
            UserDetails userDetails = (UserDetails) authentication.getDetails();
            UserDTO user = userService.findByUsername(userDetails.getUsername());

            LOGGER.info("Successfully retrieved users");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withData(user)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error retrieving users from DB");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PutMapping("/update-user")
    public ResponseEntity<ApiResponse> updateUser(@RequestBody() UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "UserController::updateUser");

        try {
            LOGGER.info("Updating the user details");
            UserDTO user = userService.updateUser(userDTO);

            LOGGER.info("Successfully updated user");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withData(user)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error updating user");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @DeleteMapping("/delete/id={id}")
    public ResponseEntity<ApiResponse> deleteUserById(@PathVariable("id") String id) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "UserController::deleteUserById");

        try {
            LOGGER.info("Deleting user with id " + id);
            userService.deleteUserById(UUID.fromString(id));

            LOGGER.info("Successfully deleted user");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withMessage("Successfully deleted user")
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error deleting user");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
