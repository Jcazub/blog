/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.dao.UserDao;
import com.sg.blog.service.CategoryService;
import com.sg.blog.service.TagService;
import javax.inject.Inject;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private CategoryService categoryService;
    private TagService tagService;

    @Inject
    public UserController(UserDao userDao, PasswordEncoder encoder, CategoryService categoryService, TagService tagService) {
        this.userDao = userDao;
        this.encoder = encoder;
        this.categoryService = categoryService;
        this.tagService = tagService;
    }
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String displayDashboard(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("tags", tagService.getAllTags());
        return "dashboard";
    }
}