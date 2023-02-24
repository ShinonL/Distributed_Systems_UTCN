package ds.assignment.backend.dtos.validators.annotation;

import ds.assignment.backend.dtos.validators.PasswordValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = {PasswordValidator.class})
public @interface PasswordConstraint {
    String message() default "Password must be at least 3 characters";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}

