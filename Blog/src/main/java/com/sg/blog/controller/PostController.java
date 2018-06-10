/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.dao.BlogDao;
import com.sg.blog.dao.CategoryDao;
import com.sg.blog.dao.TagDao;
import com.sg.blog.dao.UserDao;
import com.sg.blog.model.Blog;
import com.sg.blog.model.Category;
import com.sg.blog.model.Tag;
import com.sg.blog.model.User;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author chxxch
 */
@Controller
public class PostController {
    
    BlogDao blogDao;
    //temp maybe
    CategoryDao categoryDao;
    TagDao tagDao;
    UserDao userDao;

    @Inject
    public PostController(BlogDao blogDao, CategoryDao categoryDao, TagDao tagDao, UserDao userDao) {
        this.blogDao = blogDao;
        this.categoryDao = categoryDao;
        this.tagDao = tagDao;
        this.userDao = userDao;
    }

    @RequestMapping(value = "/createPost", method = RequestMethod.GET)
    public String createPost() {
        return "createPost";
    }

    @RequestMapping(value = "/addPost", method = RequestMethod.POST)
    public String addPost(HttpServletRequest request, Principal principal) {
        
        Blog b = new Blog();
        b.setCreationDate(LocalDate.now());
        b.setApprovedDate(LocalDate.now());
        b.setPublishDate(LocalDate.now());
        b.setIsApproved(true);
        
        //get user
        User user = userDao.getUserByUserName(principal.getName());
        b.setUser(user);
        
        //pulled from page
        b.setTitle(request.getParameter("title"));
        b.setContent(request.getParameter("content"));
        
        //create category
        Category c = new Category();
        c.setName("testCategory");
        c.setDesc("testDesc");
        categoryDao.addCategory(c);
        b.setCategory(c);
        
        //create tag
        Tag t = new Tag();
        t.setName("testTag");
        tagDao.addTag(t);
        
        List<Tag> tags = new ArrayList();
        tags.add(t);
        b.setTags(tags);
        
        blogDao.addBlog(b);
          
        return "redirect:/";
    }
    
    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String displayPost(HttpServletRequest request, Model model) {
        Blog b = blogDao.getBlogByBlogID(Integer.parseInt(request.getParameter("postID")));
        
        model.addAttribute("post", b);
        
        return "post";
    }
}