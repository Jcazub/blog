/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Blog;
import com.sg.blog.model.Request;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.StaticPage;
import com.sg.blog.model.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Jesse
 */
public interface UserDao {
    
    public User addUser(User user);
    public User editUser(User user);
    public void deleteUser(int userID);
    public User getUserByID(int userID);
    public User getUserByUserName(String userName);
    public User getUserForStaticPage(StaticPage staticPage);
    public User getUserForBlog(Blog blog);
    public User getUserForRequest(Request request);
    public List<User> getAllUsers();
    public List<User> searchUser(Map<SearchTerm, String> criteria);
    
}
