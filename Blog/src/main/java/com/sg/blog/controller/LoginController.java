/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.model.Role;
import com.sg.blog.model.User;
import com.sg.blog.service.RoleService;
import com.sg.blog.service.UserService;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author chxxch
 */
@Controller
public class LoginController {
    
    UserService userService;
    RoleService roleService;

    @Inject
    public LoginController(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginForm() {
        return "login";
    }
    
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String showSignUpForm() {
        return "signup";
    }
    
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(HttpServletRequest request) {
        User u = new User();
        
        u.setFirstName(request.getParameter("firstname"));
        u.setLastName(request.getParameter("lastname"));
        u.setUserName(request.getParameter("username"));
        u.setEmail(request.getParameter("email"));
        u.setPassword(request.getParameter("password"));
        u.setEnabled(true);
        
        List<Role> roles = new ArrayList<>();
        
        Role r = roleService.getRoleByName("ROLE_USER");
        
        roles.add(r);
        
        u.setRoles(roles);
        
        userService.addUser(u);
        
        return "/login";
        
    }
}