/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Blog;
import com.sg.blog.model.SearchTerm;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Al Rahman
 */
public interface BlogDao {
    
    public Blog addBlog(Blog blog);
    public Blog editBlog(Blog blog);
    public void deleteBlog(int blogID);
    public Blog getBlogByBlogID(int blogID);
    public List<Blog> getAllBlogs();
    public List<Blog> searchBlogs(Map<SearchTerm, String> criteria);
    
}
