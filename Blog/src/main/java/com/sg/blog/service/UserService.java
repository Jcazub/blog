/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service;

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
public interface UserService {
    
    public User addUser(User user);
    public User editUser(User user, User editedCredentials);
    public void deleteUser(User user, User editedCredentials);
    public User getUserByID(int userID);
    public List<User> getAllUsers();
    public List<User> searchUser(Map<SearchTerm, String> criteria);
    public boolean userVerification(User user, User editedCredentials);
    public boolean verifyIfUserExists(int userID);
    public boolean dataValidation(User user);
    
}
