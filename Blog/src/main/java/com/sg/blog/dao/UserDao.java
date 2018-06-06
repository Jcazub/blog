/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.User;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface UserDao {
    
    public User addUser(User user);
    public User editUser(User user);
    public void deleteUser(int userID);
    public User getUserByID(int userID);
    public List<User> getAllUsers();
    public List<User> searchUser();                     //need to include the parameters for this method
    
}
