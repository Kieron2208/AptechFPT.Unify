package com.aptechfpt.dto;

import com.aptechfpt.entity.Account;
import com.aptechfpt.entity.Role;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

/**
 *
 * @author Kiero
 */
public class AccountDTO {

    private int id;
    private String email;
    private String password;
    private String imageLink;
    private String firstName;
    private String lastName;
    private String phone;
    private String address;
    private Gender gender;
    private Date dateOfBirth;
    private Collection<Role> roles;
    private Date modifiedDate;

    private AccountDTO(Builder builder) {
        this.id = builder.id;
        this.email = builder.email;
        this.password = builder.password;
        this.imageLink = builder.imageLink;
        this.firstName = builder.firstName;
        this.lastName = builder.lastName;
        this.phone = builder.phone;
        this.address = builder.address;
        this.gender = builder.gender;
        this.dateOfBirth = builder.dateOfBirth;
        this.roles = builder.roles;
        this.modifiedDate = builder.modifiedDate;
    }

    public static class Builder {

        private Validator validator;

        private int id;
        private String email;
        private String password;
        private String imageLink;
        private String firstName;
        private String lastName;
        private String phone;
        private String address;
        private Gender gender;
        private Date dateOfBirth;
        private Collection<Role> roles;
        private Date modifiedDate;

        public Builder(String email) {
            this(0,email);
        }

        public Builder(int id, String email) {
            this.id = id;
            this.email = email;
            dateOfBirth = new Date();
            modifiedDate = new Date();
            roles = new HashSet<>();
            validator = Validation.buildDefaultValidatorFactory().getValidator();
        }

        public Builder Password(String password) {
            this.password = password;
            return this;
        }

        public Builder ImageLink(String imageLink) {
            this.imageLink = imageLink;
            return this;
        }

        public Builder FirstName(String firstName) {
            this.firstName = firstName;
            return this;
        }

        public Builder LastName(String lastName) {
            this.lastName = lastName;
            return this;
        }

        public Builder Phone(String phone) {
            this.phone = phone;
            return this;
        }

        public Builder Address(String address) {
            this.address = address;
            return this;
        }

        public Builder Gender(Gender gender) {
            this.gender = gender;
            return this;
        }

        public Builder DateOfBirth(Date dateOfBirth) {
            this.dateOfBirth = dateOfBirth;
            return this;
        }

        public Builder Roles(Collection<Role> roles) {
            this.roles = roles;
            return this;
        }

        public Builder ModifiedDate(Date modifiedDate) {
            this.modifiedDate = modifiedDate;
            return this;
        }

        public AccountDTO build() throws ConstraintViolationException{
            AccountDTO dto = new AccountDTO(this);

            Set<ConstraintViolation<AccountDTO>> violations = 
                validator.validate(dto);

            if (!violations.isEmpty()) {
                throw new ConstraintViolationException(
                    new HashSet<ConstraintViolation<?>>(violations));
            }
            return dto;
        }

    }

    @NotNull
    public int getId() {
        return id;
    }

    @NotNull(message = "Email cannot be null.")
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getImageLink() {
        return imageLink;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public Gender getGender() {
        return gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public Collection<Role> getRoles() {
        return roles;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    //TODO: Refactor Account to correct MODIFIDATE,ROLE, AND GENDER
    //TODO: Validation to correct value type
    public Account toAccount(){
        return new Account(id, email, password, imageLink, firstName);
    }

    public static AccountDTO buildFromAccount(Account account){
        return new AccountDTO
                .Builder(account.getAccountId(), account.getEmail())
                .Password(account.getPassword())
                .Phone(account.getPhone())
                .DateOfBirth(account.getDayOfBirth())
                .Roles(account.getRoleCollection())
                .ImageLink(account.getImageLink())
                .Gender(Gender.valueOf(account.getGender()))
                .Address(account.getAddress())
                .build();
    }
}
