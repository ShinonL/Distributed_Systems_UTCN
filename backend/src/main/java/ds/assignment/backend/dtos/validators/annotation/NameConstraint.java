package ds.assignment.backend.dtos.validators.annotation;

import ds.assignment.backend.dtos.validators.NameValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = {NameValidator.class})
public @interface NameConstraint {
    String message() default "A name must not be empty, must contain only english letter and must be longer than 3.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}