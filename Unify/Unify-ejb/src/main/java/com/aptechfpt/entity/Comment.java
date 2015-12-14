/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.entity;

import com.aptechfpt.converter.JodaDateTimeConverter;
import java.io.Serializable;
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import org.joda.time.DateTime;

/**
 *
 * @author Kiero
 */
@Entity
@Table(name = "Comment", catalog = "Unify", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c"),
    @NamedQuery(name = "Comment.findByCommentId", query = "SELECT c FROM Comment c WHERE c.commentId = :commentId"),
    @NamedQuery(name = "Comment.findByLike", query = "SELECT c FROM Comment c WHERE c.like = :like"),
    @NamedQuery(name = "Comment.findByComments", query = "SELECT c FROM Comment c WHERE c.comments = :comments"),
    @NamedQuery(name = "Comment.findByModifiedDate", query = "SELECT c FROM Comment c WHERE c.modifiedDate = :modifiedDate"),
    @NamedQuery(name = "Comment.findByCreatedDate", query = "SELECT c FROM Comment c WHERE c.createdDate = :createdDate")})
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CommentId", nullable = false)
    private Integer commentId;
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "[Like]", nullable = false)
    private int like;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8000)
    @Column(name = "Comments", nullable = false, length = 8000)
    private String comments;
    
    @Basic(optional = false)
    @Convert(converter = JodaDateTimeConverter.class)
    @Column(name = "CreatedDate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private DateTime createdDate;

    @Basic(optional = false)
    @Convert(converter = JodaDateTimeConverter.class)
    @Column(name = "ModifiedDate", insertable = false, updatable = false)
    private DateTime modifiedDate;
    
    @JoinColumn(name = "AccountId", referencedColumnName = "AccountId", nullable = false)
    @ManyToOne(optional = false)
    private Account accountId;
    
    @JoinColumn(name = "ProductId", referencedColumnName = "ProductId", nullable = false)
    @ManyToOne(optional = false)
    private Product productId;

    public Comment() {
    }

    public Comment(Integer commentId) {
        this.commentId = commentId;
    }

    public Comment(Integer commentId, int like, String comments, DateTime modifiedDate, DateTime createdDate) {
        this.commentId = commentId;
        this.like = like;
        this.comments = comments;
        this.modifiedDate = modifiedDate;
        this.createdDate = createdDate;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public DateTime getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(DateTime modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public DateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(DateTime createdDate) {
        this.createdDate = createdDate;
    }

    public Account getAccountId() {
        return accountId;
    }

    public void setAccountId(Account accountId) {
        this.accountId = accountId;
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
        hash += (commentId != null ? commentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.commentId == null && other.commentId != null) || (this.commentId != null && !this.commentId.equals(other.commentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.aptechfpt.entity.Comment[ commentId=" + commentId + " ]";
    }
    
}
