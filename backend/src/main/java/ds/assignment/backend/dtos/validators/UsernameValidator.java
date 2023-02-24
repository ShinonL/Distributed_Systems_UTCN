package ds.assignment.backend.dtos.validators;


import ds.assignment.backend.dtos.validators.annotation.UsernameConstraint;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class UsernameValidator implements ConstraintValidator<UsernameConstraint, String> {
    @Override
    public boolean isValid(String username, ConstraintValidatorContext constraintValidatorContext) {
        Pattern pattern = Pattern.compile("^[A-Za-z0-9_]{3,}$");
        Matcher matcher = pattern.matcher(username);

        return matcher.matches();
    }
}