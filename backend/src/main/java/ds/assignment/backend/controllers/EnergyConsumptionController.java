package ds.assignment.backend.controllers;

import ds.assignment.backend.controllers.response.ApiResponse;
import ds.assignment.backend.dtos.EnergyConsumptionDTO;
import ds.assignment.backend.services.EnergyConsumptionService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Slf4j
@RestController
@CrossOrigin
@RequestMapping("/energy-consumption")
public class EnergyConsumptionController {
    @Autowired
    private EnergyConsumptionService energyConsumptionService;

    private final Logger LOGGER = LoggerFactory.getLogger(EnergyConsumptionController.class);

    @PostMapping("/create/{deviceId}")
    public ResponseEntity<ApiResponse> createEnergyConsumption(
            @RequestBody() EnergyConsumptionDTO energyConsumptionDTO,
            @PathVariable("deviceId") String deviceId
    ) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "EnergyConsumptionController::createEnergyConsumption");

        try {
            LOGGER.info("Creating the energy consumption based on the given details");
            energyConsumptionDTO.setDeviceId(UUID.fromString(deviceId));
            EnergyConsumptionDTO energyConsumption =
                    energyConsumptionService.createEnergyConsumption(energyConsumptionDTO);

            LOGGER.info("Successfully created energy consumption");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withMessage("Successfully created energy consumption")
                    .withData(energyConsumption)
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error creating energy consumption");
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @DeleteMapping("/delete/{energyConsumptionId}")
    public ResponseEntity<ApiResponse> deleteEnergyConsumption(
            @PathVariable("energyConsumptionId") String energyConsumptionId
    ) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "EnergyConsumptionController::deleteEnergyConsumption");

        try {
            LOGGER.info("Deleting the energy consumption based on the given details");
            energyConsumptionService.deleteEnergyConsumption(UUID.fromString(energyConsumptionId));

            LOGGER.info("Successfully deleted energy consumption");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value())
                    .withMessage("Successfully deleted energy consumption")
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            LOGGER.error("Error deleting energy consumption");
            ex.printStackTrace();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value())
                    .withMessage(ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
