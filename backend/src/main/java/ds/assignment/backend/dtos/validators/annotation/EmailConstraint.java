package ds.assignment.backend.dtos.validators.annotation;

import ds.assignment.backend.dtos.validators.EmailValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = {EmailValidator.class})
public @interface EmailConstraint {
    String message() default "Email invalid";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
