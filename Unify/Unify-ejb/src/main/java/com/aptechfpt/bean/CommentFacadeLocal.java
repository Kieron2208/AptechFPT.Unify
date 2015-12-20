/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.bean;

import com.aptechfpt.dto.HighSale;
import com.aptechfpt.entity.Comment;
import com.aptechfpt.entity.Product;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author ken
 */
@Local
public interface CommentFacadeLocal {

    void create(Comment comment);

    void edit(Comment comment);

    void remove(Comment comment);

    Comment find(Object id);

    List<Comment> findAll();

    List<Comment> findRange(int[] range);

    int count();

    List<Comment> getListCommet(Product p);

    List<HighSale> getTop10Comment(String f, String t);
    
}
