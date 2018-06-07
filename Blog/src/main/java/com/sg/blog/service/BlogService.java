/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service;

import com.sg.blog.model.Blog;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Jesse
 */
public interface BlogService {
    
    public Blog addBlog(Blog blog, User user);
    public Blog editBlog(Blog blog, User user);
    public void deleteBlog(int blogID, User user);
    public Blog getBlogByBlogID(int blogID);
    public List<Blog> getAllBlogs();
    public List<Blog> searchBlogs(Map<SearchTerm, String> criteria);
    public boolean verifyIfBlogExists(int blogID);
    public boolean dataValidation(Blog blog);
}
