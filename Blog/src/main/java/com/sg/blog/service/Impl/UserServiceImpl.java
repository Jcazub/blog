/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.RoleDao;
import com.sg.blog.dao.UserDao;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.User;
import com.sg.blog.service.Service;
import com.sg.blog.service.UserService;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Jesse
 */
public class UserServiceImpl extends Service implements UserService {

    UserDao userDao;

    public UserServiceImpl(UserDao userDao, RoleDao roleDao) {
        super(roleDao);
        this.userDao = userDao;
    }

    @Override
    public User addUser(User user) {
        if (dataValidation(user)) {
                return userDao.addUser(user);
            }
        return null;
    }

    @Override
    public User editUser(User editedCredentials) {
        if (dataValidation(editedCredentials)) {
                if (verifyIfUserExists(editedCredentials.getUserID())) {
                    return userDao.editUser(editedCredentials);
                }
            }
        return null;
    }

    @Override
    public void deleteUser(int userID) {
        if (verifyIfUserExists(userID)) {
                userDao.deleteUser(userID);
            }
    }

    @Override
    public User getUserByID(int userID) {
        return userDao.getUserByID(userID);
    }
    
    @Override
    public User getUserByUserName(String userName) {
        return userDao.getUserByUserName(userName);
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public List<User> searchUser(Map<SearchTerm, String> criteria) {
        return userDao.searchUser(criteria);
    }

    @Override
    public boolean userVerification(User user, User editedCredentials) {
        return user.getUserID() == editedCredentials.getUserID();
    }

    @Override
    public boolean verifyIfUserExists(int userID) {
        return userDao.getUserByID(userID) != null;
    }

    @Override
    public boolean dataValidation(User user) {
        if (user.getFirstName() == null
                || "".equals(user.getFirstName())
                || user.getLastName() == null
                || "".equals(user.getLastName())
                || user.getUserName() == null
                || "".equals(user.getUserName())
                || user.getPassword() == null
                || "".equals(user.getPassword())
                || user.getEmail() == null
                || "".equals(user.getEmail())
                || user.getRoles() == null
                || user.getRoles().isEmpty()) {
            return false;
        }
        return true;
    }

}
