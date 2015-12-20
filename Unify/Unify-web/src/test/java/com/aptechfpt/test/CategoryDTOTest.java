/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.test;

import com.aptechfpt.entity.Category;
import com.aptechfpt.entity.SubCategory;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Kiero
 */
public class CategoryDTOTest {

    public CategoryDTOTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Test
    public void hello() {
        Category Shirt = new Category();
        Shirt.setCategoryId(1);
        Shirt.setName("Shirt");
        
        SubCategory tShirt = new SubCategory();
        tShirt.setSubCategoryId(1);
        tShirt.setName("T-Shirt");
        SubCategory Chemise = new SubCategory();
        Chemise.setSubCategoryId(2);
        Chemise.setName("Chemise");
        
        List<Category> Category = new ArrayList<>();
        List<SubCategory> subcategories = new ArrayList<>();
        subcategories.add(Chemise);
        subcategories.add(tShirt);
        
        Shirt.setSubCategoryCollection(subcategories);
        Category.add(Shirt);
        System.out.println("MEN: ");
        for (Category c : Category) {
            System.out.println("Category");
            System.out.println("Id: " + c.getCategoryId());
            System.out.println("Name: " + c.getName());
            for (SubCategory sub : c.getSubCategoryCollection()) {
                System.out.println("Subcategory: ");
                System.out.println("Id: "+ sub.getSubCategoryId());
                System.out.println("Name: " + sub.getName());
            }
        }
        
        for (Iterator<SubCategory> iterator = subcategories.iterator(); iterator.hasNext();) {
            SubCategory next = iterator.next();
            
        }
        
        System.out.println("MEN: ");
        for (Category c : Category) {
            System.out.println("Category");
            System.out.println("Id: " + c.getCategoryId());
            System.out.println("Name: " + c.getName());
            for (SubCategory sub : c.getSubCategoryCollection()) {
                System.out.println("Subcategory: ");
                System.out.println("Id: "+ sub.getSubCategoryId());
                System.out.println("Name: " + sub.getName());
            }
        }
        
        System.out.println("MEN: ");
        for (Category c : Category) {
            System.out.println("Category");
            System.out.println("Id: " + c.getCategoryId());
            System.out.println("Name: " + c.getName());
            for (SubCategory sub : c.getSubCategoryCollection()) {
                System.out.println("Subcategory: ");
                System.out.println("Id: "+ sub.getSubCategoryId());
                System.out.println("Name: " + sub.getName());
            }
        }
    }
}
