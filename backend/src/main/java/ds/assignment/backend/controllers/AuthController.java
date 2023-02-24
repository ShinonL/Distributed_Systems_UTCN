package ds.assignment.backend.controllers;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import ds.assignment.backend.dtos.UserDTO;
import ds.assignment.backend.security.CustomDetailsService;
import ds.assignment.backend.security.JwtUtil;
import ds.assignment.backend.services.UserService;
import ds.assignment.backend.controllers.response.ApiResponse;

import java.util.Arrays;

@Slf4j
@RestController
@CrossOrigin
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private CustomDetailsService customDetailsService;

    @Autowired
    private JwtUtil jwtUtil;

    private final Logger LOGGER = LoggerFactory.getLogger(AuthController.class);

    @PostMapping("/register")
    public ResponseEntity<ApiResponse> register(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::createUser");

        try {
            LOGGER.info("Creating user account " + userDTO.getUsername());
            userService.createUser(userDTO);

            LOGGER.info("Successfully created user account " + userDTO.getUsername());
            return login(userDTO);
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

    @PostMapping("/login")
    public ResponseEntity<ApiResponse> login(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::loginUser");

        try {
            LOGGER.info("Authenticating user account " + userDTO.getUsername());
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(userDTO.getUsername(), userDTO.getPassword())
            );
            LOGGER.info("Successfully authenticated user account " + userDTO.getUsername());

            LOGGER.info("Fetching details for user account " + userDTO.getUsername());
            final UserDetails userDetails = customDetailsService.loadUserByUsername(userDTO.getUsername());
            LOGGER.info("Successfully fetched details for user account " + userDTO.getUsername());

            LOGGER.info("Creating JWT");
            final String token = jwtUtil.generateToken(userDetails);
            LOGGER.info("Successfully created JWT ");

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withMessage("Successfully logged in user.")
                    .withHttpHeader(httpHeaders)
                    .withData(token)
                    .build();

        } catch (Exception ex) {
            LOGGER.error("Error while logging in the user account " + userDTO.getUsername());
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
