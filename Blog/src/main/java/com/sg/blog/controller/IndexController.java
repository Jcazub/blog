/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.model.Blog;
import com.sg.blog.service.BlogService;
import com.sg.blog.service.CategoryService;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Jesse
 */
@Controller
public class IndexController {
    
    BlogService blogService;
    CategoryService categoryService;
    
    @Inject
    public IndexController(BlogService blogService, CategoryService categoryService) {
        this.blogService = blogService;
        this.categoryService = categoryService;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String refresh(Model model) {
        List<Blog> allPosts = blogService.getAllBlogs();
        List<Blog> publishedBlogs = allPosts.stream()
                .filter(b -> (LocalDate.now().isEqual(b.getPublishDate()) || LocalDate.now().isAfter(b.getPublishDate())) && LocalDate.now().isBefore(b.getExpirationDate()) && b.getIsApproved() == true)
                .collect(Collectors.toList());
        model.addAttribute("posts", publishedBlogs);
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("recentPosts", publishedBlogs);
        return "index";
    }

    
}
