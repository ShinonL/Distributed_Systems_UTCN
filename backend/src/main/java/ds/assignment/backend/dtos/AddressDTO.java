package ds.assignment.backend.dtos;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.hateoas.RepresentationModel;

import java.util.UUID;

@Data
@NoArgsConstructor
public class AddressDTO extends RepresentationModel<AddressDTO> {
    private UUID id;
    private String addressLine1;
    private String addressLine2;
}
