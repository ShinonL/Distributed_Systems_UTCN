package ds.assignment.backend.controllers;

import ds.assignment.backend.controllers.response.ApiResponse;
import ds.assignment.backend.dtos.DeviceDTO;
import ds.assignment.backend.services.DeviceService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Slf4j
@RestController
@CrossOrigin
@RequestMapping("/device")
public class DeviceController {
    @Autowired
    private DeviceService deviceService;

    private final Logger LOGGER = LoggerFactory.getLogger(DeviceController.class);

    @PostMapping("/create-device")
    public ResponseEntity<ApiResponse> createDevice(@RequestBody() DeviceDTO deviceDTO) {
         HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "DeviceController::createDevice");

        try {
            LOGGER.info("Creating the device details");
            DeviceDTO device = deviceService.createDevice(deviceDTO);

            LOGGER.info("Successfully created device");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withMessage("Successfully created device")
                    .withData(device)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error creating device");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/find-all/{username}")
    public ResponseEntity<ApiResponse> findAllDevicesByUsername(
            @PathVariable("username") String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "DeviceController::findAllDevices");

        try {
            LOGGER.info("Retrieving devices from DB...");
            List<DeviceDTO> devices = deviceService.findAllByUsername(username);

            LOGGER.info("Successfully retrieved devices");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withData(devices)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error retrieving devices from DB");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/find-by-id/{id}")
    public ResponseEntity<ApiResponse> findById(
            @PathVariable("id") String id) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "DeviceController::findById");

        try {
            LOGGER.info("Retrieving devices from DB...");
            DeviceDTO device = deviceService.findById(UUID.fromString(id));

            LOGGER.info("Successfully retrieved devices");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withData(device)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error retrieving devices from DB");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PutMapping("/update-device")
    public ResponseEntity<ApiResponse> updateDevice(@RequestBody() DeviceDTO deviceDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "DeviceController::updateDevice");

        try {
            LOGGER.info("Updating the device details");
            DeviceDTO device = deviceService.updateDevice(deviceDTO);

            LOGGER.info("Successfully updated device");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withData(device)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error updating device");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @DeleteMapping("/delete/id={id}")
    public ResponseEntity<ApiResponse> deleteDeviceById(@PathVariable("id") UUID id) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "DeviceController::deleteDeviceById");

        try {
            LOGGER.info("Deleting device with id " + id);
            deviceService.deleteDeviceById(id);

            LOGGER.info("Successfully deleted device");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withMessage("Successfully deleted device")
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error deleting device");
            LOGGER.error(ex.getMessage());
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
