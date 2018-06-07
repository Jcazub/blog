/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.dao.UserDao;
import javax.inject.Inject;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author chxxch
 */
@Controller
public class UserController {
    
    private UserDao userDao;
    private PasswordEncoder encoder;

    @Inject
    public UserController(UserDao userDao, PasswordEncoder encoder) {
        this.userDao = userDao;
        this.encoder = encoder;
    }

    @RequestMapping(value = "/addPost", method = RequestMethod.POST)
    public String addPost() {
        return "post";
    }
    
    @RequestMapping(value="/dashboard", method=RequestMethod.GET)
    public String displayDashboard() {
        return "dashboard";
    }
    
}