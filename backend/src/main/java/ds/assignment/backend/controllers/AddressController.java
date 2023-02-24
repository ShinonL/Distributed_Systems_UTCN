package ds.assignment.backend.controllers;

import ds.assignment.backend.controllers.response.ApiResponse;
import ds.assignment.backend.dtos.AddressDTO;
import ds.assignment.backend.dtos.UserDTO;
import ds.assignment.backend.services.AddressService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@CrossOrigin
@RequestMapping("/address")
public class AddressController {
    @Autowired
    private AddressService addressService;

    private final Logger LOGGER = LoggerFactory.getLogger(AddressController.class);

    @GetMapping("/find-by-user/{username}")
    public ResponseEntity<ApiResponse> findUnusedAddressesByUser(
            @PathVariable("username") String username, Authentication authentication) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AddressController::findUnusedAddressesByUser");

        try {
            LOGGER.info("Retrieving unused addresses");
            List<AddressDTO> addresses = addressService.findByUsername(username);

            LOGGER.info("Successfully retrieved unused addresses");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withData(addresses)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error retrieving unused addresses from DB");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
