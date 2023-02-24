package ds.assignment.backend.dtos.validators;


import ds.assignment.backend.dtos.validators.annotation.PasswordConstraint;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class PasswordValidator implements ConstraintValidator<PasswordConstraint, String> {
    @Override
    public boolean isValid(String password, ConstraintValidatorContext constraintValidatorContext) {
        Pattern pattern = Pattern.compile("^.{3,}$");
        Matcher matcher = pattern.matcher(password);

        return matcher.matches();
    }
}
