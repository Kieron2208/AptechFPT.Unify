/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt.dto;

import com.aptechfpt.controller.HomeController;
import com.aptechfpt.entity.Account;
import com.aptechfpt.entity.Role;
import java.io.File;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.*;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.maven.Maven;
import org.junit.Assert;
import org.junit.runner.RunWith;
/**
 *
 * @author Kiero
 */
@RunWith(Arquillian.class)
public class AccountDTOTest {

//    @Test
//    public void validCustomer() {
//        Customer c = 
//            new Customer.Builder(1, "Smith")
//                .firstName("Bob")
//                .birthday(new GregorianCalendar(1970, 3, 10).getTime())
//                .build();
//
//        assertNotNull(c);
//    }

    @Deployment
    public static Archive<?> createDeployment() {
        
        JavaArchive war = ShrinkWrap.create(JavaArchive.class)
                .addClasses(AccountDTO.class,Gender.class,Role.class,Account.class);

        System.out.println("Folder Structure: ");
        System.out.println(war.toString(true));
        return war;
    }
    
    @Test
    public void lastNameNullAndBirthdayInFuture() {
        try {
            new AccountDTO.Builder(null)
                .build();
            Assert.fail("Expected ConstraintViolationException wasn't thrown.");
        } catch (ConstraintViolationException e) {
            for (ConstraintViolation<?> ex : e.getConstraintViolations()) {
                System.out.println("Exception message: "+ ex.getMessage());
            }
            System.out.println("The Exception has been threw: ");
            assertEquals(1, e.getConstraintViolations().size());
        }
    }
}
