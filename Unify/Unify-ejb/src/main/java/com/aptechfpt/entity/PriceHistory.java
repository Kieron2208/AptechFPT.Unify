package com.aptechfpt.entity;

import com.aptechfpt.converter.JodaDateTimeConverter;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import org.joda.time.DateTime;

/**
 *
 * @author Kiero
 */
@Entity
@Table(name = "PriceHistory", catalog = "Unify", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PriceHistory.findAll", query = "SELECT p FROM PriceHistory p"),
    @NamedQuery(name = "PriceHistory.findByPriceHistoryId", query = "SELECT p FROM PriceHistory p WHERE p.priceHistoryId = :priceHistoryId"),
    @NamedQuery(name = "PriceHistory.findByCost", query = "SELECT DISTINCT  p FROM PriceHistory p WHERE p.productId = :productId ORDER BY p.createdDate desc "),
    @NamedQuery(name = "PriceHistory.findByPrice", query = "SELECT p FROM PriceHistory p WHERE p.price = :price"),
    @NamedQuery(name = "PriceHistory.findByCreatedDate", query = "SELECT p FROM PriceHistory p WHERE p.createdDate = :createdDate")})
public class PriceHistory implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PriceHistoryId", nullable = false)
    private Long priceHistoryId;
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "Cost", nullable = false, precision = 19, scale = 4)
    private BigDecimal cost;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "Price", nullable = false, precision = 19, scale = 4)
    private BigDecimal price;

    @Basic(optional = false)
    @Temporal(TemporalType.TIMESTAMP)
    @Convert(converter = JodaDateTimeConverter.class)
    @Column(name = "CreatedDate", insertable = false, updatable = false)
    private DateTime createdDate;

    @JoinColumn(name = "ProductId", referencedColumnName = "ProductId", nullable = false)
    @ManyToOne(optional = false)
    private Product productId;

    public PriceHistory() {
    }

    public PriceHistory(Long priceHistoryId) {
        this.priceHistoryId = priceHistoryId;
    }

    public PriceHistory(Long priceHistoryId, BigDecimal cost, BigDecimal price, DateTime createdDate) {
        this.priceHistoryId = priceHistoryId;
        this.cost = cost;
        this.price = price;
        this.createdDate = createdDate;
    }

    public Long getPriceHistoryId() {
        return priceHistoryId;
    }

    public void setPriceHistoryId(Long priceHistoryId) {
        this.priceHistoryId = priceHistoryId;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public DateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(DateTime createdDate) {
        this.createdDate = createdDate;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (priceHistoryId != null ? priceHistoryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PriceHistory)) {
            return false;
        }
        PriceHistory other = (PriceHistory) object;
        if ((this.priceHistoryId == null && other.priceHistoryId != null) || (this.priceHistoryId != null && !this.priceHistoryId.equals(other.priceHistoryId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.aptechfpt.entity.PriceHistory[ priceHistoryId=" + priceHistoryId + " ]";
    }

}
