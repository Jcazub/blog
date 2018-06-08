/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.service.CategoryService;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;

/**
 *
 * @author chxxch
 */
@Controller
public class CategoryController {
    
    CategoryService categoryService;
    
    @Inject
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
    
}