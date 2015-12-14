package com.aptechfpt.dto;

import com.aptechfpt.entity.Account;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.enumtype.Role;
import java.util.HashSet;
import java.util.Set;
import org.joda.time.DateTime;

/**
 *
 * @author kieron2208
 */
public class AccountDTO {

    private int accountId;
    private String email;
    private String password;
    private String imageLink;
    private String firstName;
    private String lastName;
    private String fullName;
    private String phone;
    private String address;
    private DateTime dateOfBirth;
    private AccountGender gender;
    private DateTime createdDate;
    private boolean isAvaliable;
    private Set<Role> roles;
    
    private AccountDTO(int accountId,
            String email,
            String password,
            String imageLink,
            String firstName,
            String lastName,
            String phone,
            String address,
            DateTime dateOfBirth,
            AccountGender gender,
            DateTime createdDate,
            boolean isAvaliable,
            Set<Role> roles) {
        this.accountId = accountId;
        this.email = email;
        this.password = password;
        this.imageLink = imageLink;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = firstName + " " + lastName;
        this.phone = phone;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.isAvaliable = isAvaliable;
        this.createdDate = createdDate;
        this.roles = roles;
    }

    public Account toAccount() {
        return new Account(this);
    }

    private AccountDTO(Builder builder) {
        this.accountId = builder.accountId;
        this.email = builder.email;
        this.password = builder.password;
        this.imageLink = builder.imageLink;
        this.firstName = builder.firstName;
        this.lastName = builder.lastName;
        this.fullName = builder.firstName + " " + builder.lastName;
        this.phone = builder.phone;
        this.address = builder.address;
        this.dateOfBirth = builder.dateOfBirth;
        this.gender = builder.gender;
        this.isAvaliable = builder.avalaible;
        this.createdDate = builder.createdDate;
        this.roles = builder.roles;
        
    }

    public static AccountDTO fromAccount(Account account) {
        return new AccountDTO(
                account.getAccountId(),
                account.getEmail(),
                account.getPassword(),
                account.getImageLink(),
                account.getFirstName(),
                account.getLastName(),
                account.getPhone(),
                account.getAddress(),
                account.getDayOfBirth(),
                account.getGender(),
                account.getCreatedDate(),
                account.isAvailable(),
                account.getRoles());
    }

    public static class Builder {

        private int accountId;
        private String email;
        private String password;
        private String imageLink;
        private String firstName;
        private String lastName;
        private String phone;
        private String address;
        private DateTime dateOfBirth;
        private DateTime createdDate;
        private Set<Role> roles;
        private boolean avalaible;
        private AccountGender gender;

        public Builder(String email) {
            this(0, email);
        }

        public Builder(int accountId, String email) {
            this.accountId = accountId;
            this.email = email;
            this.roles = new HashSet<>();
        }

        public Builder Password(String password) {
            this.password = password;
            return this;
        }

        public Builder Gender(AccountGender gender) {
            this.gender = gender;
            return this;
        }

        public Builder Roles(Set<Role> roles) {
            this.roles = roles;
            return this;
        }

        public Builder Role(Role role) {
            this.roles.add(role);
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

        public Builder DateOfBirth(DateTime dateOfBirth) {
            this.dateOfBirth = dateOfBirth;
            return this;
        }

        public Builder isAvalaible(boolean avalaible) {
            this.avalaible = avalaible;
            return this;
        }
        
        public Builder CreatedDate(DateTime createdDate) {
            this.createdDate = createdDate;
            return this;
        }

        public AccountDTO build() {
            return new AccountDTO(this);
        }
    }

    public String getImageLink() {
        return imageLink;
    }

    public String getFullName() {
        return fullName;
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

    public DateTime getDateOfBirth() {
        return dateOfBirth;
    }

    public int getAccountId() {
        return accountId;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public AccountGender getGender() {
        return gender;
    }

    public DateTime getCreatedDate() {
        return createdDate;
    }

    public boolean isAvaliable() {
        return isAvaliable;
    }

    public Set<Role> getRoles() {
        return roles;
    }
}
