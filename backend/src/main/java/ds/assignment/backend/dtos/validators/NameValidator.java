package ds.assignment.backend.dtos.validators;

import ds.assignment.backend.dtos.validators.annotation.NameConstraint;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class NameValidator implements ConstraintValidator<NameConstraint, String> {
    @Override
    public boolean isValid(String name, ConstraintValidatorContext constraintValidatorContext) {
        Pattern pattern = Pattern.compile("^[A-Za-z]{3,}$");
        Matcher matcher = pattern.matcher(name);

        return matcher.matches();
    }
}