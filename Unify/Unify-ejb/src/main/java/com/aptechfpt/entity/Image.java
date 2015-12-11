/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.entity;

import java.io.Serializable;
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Kiero
 */
@Entity
@Table(name = "Image", catalog = "Unify", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Image.findAll", query = "SELECT i FROM Image i"),
    @NamedQuery(name = "Image.findByImageId", query = "SELECT i FROM Image i WHERE i.imageId = :imageId"),
    @NamedQuery(name = "Image.findByImagePath", query = "SELECT i FROM Image i WHERE i.imagePath = :imagePath"),
    @NamedQuery(name = "Image.findByDisplayOrder", query = "SELECT i FROM Image i WHERE i.displayOrder = :displayOrder")})
public class Image implements Serializable {
    @JoinColumn(name = "ProductId", referencedColumnName = "ProductId", nullable = false)
    @ManyToOne(optional = false)
    private Product productId;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ImageId", nullable = false)
    private Long imageId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 400)
    @Column(name = "ImagePath", nullable = false, length = 400)
    private String imagePath;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DisplayOrder", nullable = false)
    private int displayOrder;

    public Image() {
    }

    public Image(Long imageId) {
        this.imageId = imageId;
    }

    public Image(Long imageId, String imagePath, int displayOrder) {
        this.imageId = imageId;
        this.imagePath = imagePath;
        this.displayOrder = displayOrder;
    }

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public int getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(int displayOrder) {
        this.displayOrder = displayOrder;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (imageId != null ? imageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Image)) {
            return false;
        }
        Image other = (Image) object;
        if ((this.imageId == null && other.imageId != null) || (this.imageId != null && !this.imageId.equals(other.imageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.aptechfpt.entity.Image[ imageId=" + imageId + " ]";
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }
    
}
