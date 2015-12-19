package com.aptechfpt;

import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.entity.Account;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.enumtype.Role;
import java.text.ParseException;
import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.*;
import org.joda.time.DateTime;

/**
 *
 * @author Kiero
 */
public class AccountValidationTest {

    // ======================================
    // =             Attributes             =
    // ======================================
    private static ValidatorFactory vf;
    private static Validator validator;
    private Set<ConstraintViolation<Account>> violations;

    // ======================================
    // =          Lifecycle Methods         =
    // ======================================
    @BeforeClass
    public static void init() throws ParseException {
        vf = Validation.buildDefaultValidatorFactory();
        validator = vf.getValidator();
    }

    @AfterClass
    public static void close() {
        vf.close();
    }

    @Test
    public void shouldRaiseExceptionCauseAge() {
        Account account = new AccountDTO.Builder("kieron2208")
                .Password("123456")
                .Phone("0907701007")
                .FirstName(null)
                .LastName(null)
                .DateOfBirth(new DateTime("2016-1-1"))
                .Role(Role.USER)
                .build()
                .toAccount();

        violations = validator.validate(account);
        displayContraintViolations(violations);
        assertEquals(1, violations.size());
        assertEquals("16", violations.iterator().next().getInvalidValue().toString());
        assertEquals("customer is too young", violations.iterator().next().getMessageTemplate());
        assertEquals("customer is too young", violations.iterator().next().getMessage());
        assertEquals("age", violations.iterator().next().getPropertyPath().toString());
    }

    private void displayContraintViolations(Set<ConstraintViolation<Account>> constraintViolations) {
        for (ConstraintViolation constraintViolation : constraintViolations) {
            System.out.println("### " + constraintViolation.getRootBeanClass().getSimpleName()
                    + "." + constraintViolation.getPropertyPath() + " - Invalid Value = " + constraintViolation.getInvalidValue() + " - Error Msg = " + constraintViolation.getMessage());

        }
    }
}
