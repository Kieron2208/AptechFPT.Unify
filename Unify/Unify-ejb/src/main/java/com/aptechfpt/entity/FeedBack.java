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
import javax.persistence.Id;
import javax.persistence.Lob;
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
@Table(name = "FeedBack", catalog = "Unify", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FeedBack.findAll", query = "SELECT f FROM FeedBack f"),
    @NamedQuery(name = "FeedBack.findByFeedBackId", query = "SELECT f FROM FeedBack f WHERE f.feedBackId = :feedBackId"),
    @NamedQuery(name = "FeedBack.findByTitle", query = "SELECT f FROM FeedBack f WHERE f.title = :title"),
    @NamedQuery(name = "FeedBack.findByCreatedDate", query = "SELECT f FROM FeedBack f WHERE f.createdDate = :createdDate"),
    @NamedQuery(name = "FeedBack.findByStatus", query = "SELECT f FROM FeedBack f WHERE f.status = :status")})
public class FeedBack implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "FeedBackId", nullable = false)
    private Integer feedBackId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Title", nullable = false, length = 200)
    private String title;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "Description", nullable = false, length = 2147483647)
    private String description;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 27)
    @Column(name = "CreatedDate", nullable = false, length = 27)
    private String createdDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Status", nullable = false)
    private int status;

    public FeedBack() {
    }

    public FeedBack(Integer feedBackId) {
        this.feedBackId = feedBackId;
    }

    public FeedBack(Integer feedBackId, String title, String description, String createdDate, int status) {
        this.feedBackId = feedBackId;
        this.title = title;
        this.description = description;
        this.createdDate = createdDate;
        this.status = status;
    }

    public Integer getFeedBackId() {
        return feedBackId;
    }

    public void setFeedBackId(Integer feedBackId) {
        this.feedBackId = feedBackId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feedBackId != null ? feedBackId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FeedBack)) {
            return false;
        }
        FeedBack other = (FeedBack) object;
        if ((this.feedBackId == null && other.feedBackId != null) || (this.feedBackId != null && !this.feedBackId.equals(other.feedBackId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.aptechfpt.entity.FeedBack[ feedBackId=" + feedBackId + " ]";
    }
    
}
