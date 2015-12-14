package com.aptechfpt.entity;

import com.aptechfpt.converter.GenderConverter;
import com.aptechfpt.dto.AccountDTO;
import com.aptechfpt.converter.JodaDateTimeConverter;
import com.aptechfpt.enumtype.AccountGender;
import com.aptechfpt.enumtype.Role;
import java.io.Serializable;
import java.util.Collection;
import java.util.Set;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.apache.commons.codec.digest.DigestUtils;
import org.joda.time.DateTime;

/**
 *
 * @author kieron2208
 */
@Entity
@Table(name = "Account", catalog = "Unify", schema = "dbo")
@NamedQueries({
    @NamedQuery(name = "Account.findAll", query = "SELECT a FROM Account a"),
    @NamedQuery(name = "Account.findByAccountId", query = "SELECT a FROM Account a WHERE a.accountId = :accountId"),
    @NamedQuery(name = "Account.findByEmail", query = "SELECT a FROM Account a WHERE a.email = :email"),
    @NamedQuery(name = "Account.findByCreatedDate", query = "SELECT a FROM Account a WHERE a.createdDate = :createdDate")})
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AccountId", nullable = false)
    private Integer accountId;

    @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email format.")//if the field contains email address consider using this annotation to enforce field validation
    @NotNull(message = "Email cannot null.")
    @Size(min = 1, max = 100, message = "Email length must between 1 to 100 characters")
    @Column(name = "Email", unique = true, nullable = false, length = 100)
    private String email;

    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "Password", nullable = false, length = 128)
    private String password;

    @NotNull
    @Size(min = 1, max = 400)
    @Column(name = "ImageLink", nullable = false, length = 400)
    private String imageLink = "/img/user/user.jpg";

    @Pattern(regexp = "")
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "FirstName", nullable = false, length = 50)
    private String firstName;

    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "LastName", nullable = false, length = 50)
    private String lastName;

    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Address", nullable = false, length = 200)
    private String address;

    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Phone", nullable = false, length = 20)
    private String phone;

    @Basic(optional = false)
    @NotNull
    @Convert(converter = GenderConverter.class)
    @Column(name = "Gender", nullable = false)
    private AccountGender gender;

    @Basic(optional = false)
    @NotNull
    @Convert(converter = JodaDateTimeConverter.class)
    @Column(name = "DayOfBirth", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private DateTime dayOfBirth;

    @Basic(optional = false)
    @Convert(converter = JodaDateTimeConverter.class)
    @Column(name = "CreatedDate", insertable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private DateTime createdDate;

    @Basic(optional = false)
    @Column(name = "isAvailable")
    private boolean isAvailable;

    @ElementCollection(targetClass = Role.class)
    @CollectionTable(name = "AccountRole",
            joinColumns = @JoinColumn(name = "Email", nullable = false ,referencedColumnName = "Email"),
            uniqueConstraints = @UniqueConstraint(columnNames = {"Email", "Role"}))
    @Enumerated(EnumType.STRING)
    @Column(name = "Role", length = 20, nullable = false)
    private Set<Role> roles;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "accountId")
    private Collection<Comment> commentCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "accountId")
    private Collection<FeedBack> feedBackCollection;
    
    public Account() {
    }

    public Account(AccountDTO dto) {
        this.accountId = dto.getAccountId() != 0 ? dto.getAccountId() : null;
        this.email = dto.getEmail();
        this.password = DigestUtils.sha512Hex(dto.getPassword());
        this.imageLink = dto.getImageLink();
        this.firstName = dto.getFirstName();
        this.lastName = dto.getLastName();
        this.address = dto.getAddress();
        this.phone = dto.getPhone();
        this.gender = dto.getGender();
        this.dayOfBirth = dto.getDateOfBirth();
        this.isAvailable = dto.isAvaliable();
        this.roles = dto.getRoles();
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

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
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

    public boolean isAvailable() {
        return isAvailable;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public Collection<FeedBack> getFeedBackCollection() {
        return feedBackCollection;
    }

    public void setFeedBackCollection(Collection<FeedBack> feedBackCollection) {
        this.feedBackCollection = feedBackCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (accountId != null ? accountId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Account)) {
            return false;
        }
        Account other = (Account) object;
        if ((this.accountId == null && other.accountId != null) || 
                (this.accountId != null && !this.accountId.equals(other.accountId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.aptechfpt.entity.Account[ accountId=" + accountId + " ]";
    }
}
