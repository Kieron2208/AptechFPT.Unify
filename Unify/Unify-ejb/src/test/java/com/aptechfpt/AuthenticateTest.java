/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptechfpt;

import com.aptechfpt.enumtype.Role;
import java.util.HashSet;
import java.util.Set;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.*;

/**
 *
 * @author Kiero
 */
public class AuthenticateTest {

    public AuthenticateTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Test
    public void hello() {
        Set<Role> adminRoles = new HashSet<>();
        Set<Role> salePerson = new HashSet<>();
        Set<Role> user = new HashSet<>();
        adminRoles.add(Role.ADMINISTRATOR);
        adminRoles.add(Role.SALEPERSON);
        adminRoles.add(Role.USER);
        salePerson.add(Role.SALEPERSON);
        salePerson.add(Role.USER);
        user.add(Role.USER);
        assertThat(adminRoles.contains(Role.ADMINISTRATOR)).isTrue();
        assertThat(adminRoles.contains(Role.SALEPERSON)).isTrue();
        assertThat(adminRoles.contains(Role.USER)).isTrue();
        assertThat(salePerson.contains(Role.ADMINISTRATOR)).isFalse();
        assertThat(salePerson.contains(Role.SALEPERSON)).isTrue();
        assertThat(salePerson.contains(Role.USER)).isTrue();
        assertThat(user.contains(Role.ADMINISTRATOR)).isFalse();
        assertThat(user.contains(Role.SALEPERSON)).isFalse();
        assertThat(user.contains(Role.USER)).isTrue();
    }
}
