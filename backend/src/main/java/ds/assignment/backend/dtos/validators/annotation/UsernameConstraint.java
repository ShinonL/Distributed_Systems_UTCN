package ds.assignment.backend.dtos.validators.annotation;

import ds.assignment.backend.dtos.validators.UsernameValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = {UsernameValidator.class})
public @interface UsernameConstraint {
    String message() default "Username must not be empty, must contain only characters and must be longer than 3.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
