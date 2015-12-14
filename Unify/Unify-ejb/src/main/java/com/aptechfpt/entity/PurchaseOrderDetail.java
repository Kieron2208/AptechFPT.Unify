/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Kiero
 */
@Entity
@Table(name = "PurchaseOrderDetail", catalog = "Unify", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PurchaseOrderDetail.findAll", query = "SELECT p FROM PurchaseOrderDetail p"),
    @NamedQuery(name = "PurchaseOrderDetail.findByPurchaseOrderDetailId", query = "SELECT p FROM PurchaseOrderDetail p WHERE p.purchaseOrderDetailId = :purchaseOrderDetailId"),
    @NamedQuery(name = "PurchaseOrderDetail.findByQuantity", query = "SELECT p FROM PurchaseOrderDetail p WHERE p.quantity = :quantity"),
    @NamedQuery(name = "PurchaseOrderDetail.findByCost", query = "SELECT p FROM PurchaseOrderDetail p WHERE p.cost = :cost"),
    @NamedQuery(name = "PurchaseOrderDetail.findByUnitPrice", query = "SELECT p FROM PurchaseOrderDetail p WHERE p.unitPrice = :unitPrice"),
    @NamedQuery(name = "PurchaseOrderDetail.findBySubtotal", query = "SELECT p FROM PurchaseOrderDetail p WHERE p.subtotal = :subtotal")})
public class PurchaseOrderDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PurchaseOrderDetailId", nullable = false)
    private Long purchaseOrderDetailId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Quantity", nullable = false)
    private int quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "Cost", nullable = false, precision = 19, scale = 4)
    private BigDecimal cost;
    @Basic(optional = false)
    @NotNull
    @Column(name = "UnitPrice", nullable = false, precision = 19, scale = 4)
    private BigDecimal unitPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Subtotal", nullable = false, precision = 19, scale = 4)
    private BigDecimal subtotal;
    @JoinColumn(name = "ProductId", referencedColumnName = "ProductId", nullable = false)
    @ManyToOne(optional = false)
    private Product productId;
    @JoinColumn(name = "PurchaseOrderId", referencedColumnName = "PurchaseOrderId", nullable = false)
    @ManyToOne(optional = false)
    private PurchaseOrder purchaseOrderId;

    public PurchaseOrderDetail() {
    }

    public PurchaseOrderDetail(Long purchaseOrderDetailId) {
        this.purchaseOrderDetailId = purchaseOrderDetailId;
    }

    public PurchaseOrderDetail(Long purchaseOrderDetailId, int quantity, BigDecimal cost, BigDecimal unitPrice, BigDecimal subtotal) {
        this.purchaseOrderDetailId = purchaseOrderDetailId;
        this.quantity = quantity;
        this.cost = cost;
        this.unitPrice = unitPrice;
        this.subtotal = subtotal;
    }

    public Long getPurchaseOrderDetailId() {
        return purchaseOrderDetailId;
    }

    public void setPurchaseOrderDetailId(Long purchaseOrderDetailId) {
        this.purchaseOrderDetailId = purchaseOrderDetailId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public PurchaseOrder getPurchaseOrderId() {
        return purchaseOrderId;
    }

    public void setPurchaseOrderId(PurchaseOrder purchaseOrderId) {
        this.purchaseOrderId = purchaseOrderId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (purchaseOrderDetailId != null ? purchaseOrderDetailId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PurchaseOrderDetail)) {
            return false;
        }
        PurchaseOrderDetail other = (PurchaseOrderDetail) object;
        if ((this.purchaseOrderDetailId == null && other.purchaseOrderDetailId != null) || (this.purchaseOrderDetailId != null && !this.purchaseOrderDetailId.equals(other.purchaseOrderDetailId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.aptechfpt.entity.PurchaseOrderDetail[ purchaseOrderDetailId=" + purchaseOrderDetailId + " ]";
    }
    
}
