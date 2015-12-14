/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Kiero
 */
@Entity
@Table(name = "Product", catalog = "Unify", schema = "dbo", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"Name"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findByProductId", query = "SELECT p FROM Product p WHERE p.productId = :productId"),
    @NamedQuery(name = "Product.findByName", query = "SELECT p FROM Product p WHERE p.name = :name"),
    @NamedQuery(name = "Product.findByUnitPrice", query = "SELECT p FROM Product p WHERE p.unitPrice = :unitPrice"),
    @NamedQuery(name = "Product.findByLike", query = "SELECT p FROM Product p WHERE p.like = :like"),
    @NamedQuery(name = "Product.findByGender", query = "SELECT p FROM Product p WHERE p.gender = :gender"),
    @NamedQuery(name = "Product.findByAvailable", query = "SELECT p FROM Product p WHERE p.available = :available")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductId", nullable = false)
    private Integer productId;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "Name", nullable = false, length = 100)
    private String name;
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "UnitPrice", nullable = false, precision = 19, scale = 4)
    private BigDecimal unitPrice;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "[Like]", nullable = false)
    private int like;
    
    @Column(name = "Gender")
    private Integer gender;
    
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Description", length = 2147483647)
    private String description;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "Available", nullable = false)
    private boolean available;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<PurchaseOrderDetail> purchaseOrderDetailCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<PriceHistory> priceHistoryCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<Image> imageCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<Comment> commentCollection;
    
    @JoinColumn(name = "SubCategoryId", referencedColumnName = "SubCategoryId", nullable = false)
    @ManyToOne(optional = false)
    private SubCategory subCategoryId;

    public Product() {
    }

    public Product(Integer productId) {
        this.productId = productId;
    }

    public Product(Integer productId, String name, BigDecimal unitPrice, int like, boolean available) {
        this.productId = productId;
        this.name = name;
        this.unitPrice = unitPrice;
        this.like = like;
        this.available = available;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.aptechfpt.entity.Product[ productId=" + productId + " ]";
    }

    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }

    public SubCategory getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(SubCategory subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    @XmlTransient
    public Collection<PurchaseOrderDetail> getPurchaseOrderDetailCollection() {
        return purchaseOrderDetailCollection;
    }

    public void setPurchaseOrderDetailCollection(Collection<PurchaseOrderDetail> purchaseOrderDetailCollection) {
        this.purchaseOrderDetailCollection = purchaseOrderDetailCollection;
    }

    @XmlTransient
    public Collection<PriceHistory> getPriceHistoryCollection() {
        return priceHistoryCollection;
    }

    public void setPriceHistoryCollection(Collection<PriceHistory> priceHistoryCollection) {
        this.priceHistoryCollection = priceHistoryCollection;
    }

    @XmlTransient
    public Collection<Image> getImageCollection() {
        return imageCollection;
    }

    public void setImageCollection(Collection<Image> imageCollection) {
        this.imageCollection = imageCollection;
    }

}
