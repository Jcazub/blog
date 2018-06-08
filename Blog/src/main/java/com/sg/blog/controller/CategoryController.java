/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.service.BlogService;
import com.sg.blog.service.CategoryService;
import javax.inject.Inject;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author chxxch
 */
public class CategoryController {
    
    
    
    CategoryService categoryService;
    
    @Inject
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
    
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String refresh(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        return "dashboard";
    }
}