/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.model.Blog;
import com.sg.blog.service.BlogService;
import com.sg.blog.service.CategoryService;
import com.sg.blog.service.StaticPageService;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
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
    StaticPageService staticPageService;

    @Autowired
    public IndexController(BlogService blogService, CategoryService categoryService, StaticPageService staticPageService) {
        this.blogService = blogService;
        this.categoryService = categoryService;
        this.staticPageService = staticPageService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String refresh(HttpServletRequest request, Model model) {
        
        String postSearch = request.getParameter("post-search");
        String categorySearch = request.getParameter("category-search");
        String userSearch = request.getParameter("user-search");
        
        List<Blog> allPosts = blogService.getAllBlogs();
        List<Blog> publishedBlogs = allPosts.stream()
                .filter(b -> (LocalDate.now().isEqual(b.getPublishDate()) || LocalDate.now().isAfter(b.getPublishDate())) && LocalDate.now().isBefore(b.getExpirationDate()) && b.getIsApproved() == true)
                .collect(Collectors.toList());
        
        List<Blog> recentBlogs = new ArrayList<>();
        
        //Straight up milestone 1
        int publishedBlogsSize = publishedBlogs.size();
        for(int i = 0; i < publishedBlogsSize; i++) {
            if ((publishedBlogsSize - i) <= 5) {
                recentBlogs.add(publishedBlogs.get(i));
            }
        }
       
        if (postSearch != null && !"".equals(postSearch)) {
            List<Blog> searchedBlogs = publishedBlogs.stream()
                    .filter(b -> (b.getTitle().toLowerCase().contains(postSearch.toLowerCase()) || b.getContent().toLowerCase().contains(postSearch.toLowerCase())))
                    .collect(Collectors.toList());
            model.addAttribute("posts", searchedBlogs);
        } else if (categorySearch != null && !"".equals(categorySearch)){
            List<Blog> categoryBlogs = publishedBlogs.stream()
                    .filter(b -> Integer.parseInt(categorySearch) == b.getCategory().getCategoryID())
                    .collect(Collectors.toList());
            model.addAttribute("posts", categoryBlogs);
        } else if (userSearch != null && !"".equals(userSearch)) {
            List<Blog> userBlogs = publishedBlogs.stream()
                    .filter(b -> Integer.parseInt(userSearch) == b.getUser().getUserID())
                    .collect(Collectors.toList());
            model.addAttribute("posts", userBlogs);
        } else {
            model.addAttribute("posts", publishedBlogs);
        }
             
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("recentPosts", recentBlogs);
        model.addAttribute("pages", staticPageService.getAllStaticPages());
        
        return "index";
    }
}
