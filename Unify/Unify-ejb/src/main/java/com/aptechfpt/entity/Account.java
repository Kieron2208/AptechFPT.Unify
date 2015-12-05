package com.aptechfpt.entity;

import com.aptechfpt.converter.JodaDateTimeConverter;
import com.aptechfpt.dto.AccountDTO;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.codec.digest.DigestUtils;
import org.joda.time.DateTime;

/**
 *
 * @author Kiero
 */
@Entity
@Table(name = "Account", catalog = "Unify", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "Account.findAll", query = "SELECT a FROM Account a")})
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AccountId", nullable = false)
    private Integer accountId;

    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "Email", nullable = false, unique = true, length = 100)
    private String email;

    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Password", nullable = false, length = 200)
    private String password;

    @NotNull
    @Size(min = 1, max = 400)
    @Column(name = "ImageLink", nullable = false, length = 400)
    private String imageLink;

    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "FirstName", nullable = false, length = 50)
    private String firstName;

    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "LastName", nullable = false, length = 50)
    private String lastName;

    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 20)
    @Column(name = "Phone", nullable = false, length = 20)
    private String phone;

    @Size(max = 200)
    @Column(name = "Address", length = 200)
    private String address;

    @Size(max = 1)
    @Convert(converter = GenderConverter.class)
    @Column(name = "Gender", nullable = false, length = 1)
    private AccountGender gender;

    @Temporal(TemporalType.TIMESTAMP)
    @Convert(converter = JodaDateTimeConverter.class)
    @Column(name = "DayOfBirth", nullable = false)
    private DateTime dayOfBirth;

    @Temporal(TemporalType.TIMESTAMP)
    @Convert(converter = JodaDateTimeConverter.class)
    @Column(name = "CreatedDate", insertable = false, updatable = false)
    private DateTime createdDate;

    @ElementCollection(targetClass = Role.class)
    @CollectionTable(name = "AccountRole",
            joinColumns = @JoinColumn(name = "Email", nullable = false, referencedColumnName = "Email"),
            uniqueConstraints = @UniqueConstraint(columnNames = {"Email", "Role"}))
    @Enumerated(EnumType.STRING)
    @Column(name = "Role", length = 20, nullable = false)
    private Set<Role> roles;

    public Account() {
    }
    
    public Account(AccountDTO dto) {
        this.accountId = dto.getAccountId() != 0 ? dto.getAccountId() : null;
        this.email = dto.getEmail();
        this.password = DigestUtils.sha512Hex(dto.getPassword());
        this.imageLink = dto.getImageLink();
        this.firstName = dto.getFirstName();
        this.lastName = dto.getLastName();
        this.phone = dto.getPhone();
        this.address = dto.getAddress();
        this.gender = dto.getGender();
        this.dayOfBirth = dto.getDateOfBirth();
        this.createdDate = dto.getCreatedDate();
        this.roles = dto.getRoles();
    }
    
    public Account(Integer accountId, String email, String password, String imageLink, String firstName, String lastName, String phone, String address, AccountGender gender, DateTime dayOfBirth, DateTime createdDate, Set<Role> roles) {
        this.accountId = accountId;
        this.email = email;
        this.password = password;
        this.imageLink = imageLink;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.dayOfBirth = dayOfBirth;
        this.createdDate = createdDate;
        this.roles = roles;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (accountId != null ? accountId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Account)) {
            return false;
        }
        Account other = (Account) object;
        if ((this.accountId == null && other.accountId != null) || (this.accountId != null && !this.accountId.equals(other.accountId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.aptechfpt.Account[ accountId=" + accountId + " ]";
    }

    public Integer getAccountId() {
        return accountId;
    }

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

    public AccountGender getGender() {
        return gender;
    }

    public DateTime getDayOfBirth() {
        return dayOfBirth;
    }

    public DateTime getCreatedDate() {
        return createdDate;
    }

    public Set<Role> getRoles() {
        return roles;
    }
}
