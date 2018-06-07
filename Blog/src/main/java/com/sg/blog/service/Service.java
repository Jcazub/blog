/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service;

import com.sg.blog.dao.RoleDao;
import com.sg.blog.model.Role;
import com.sg.blog.model.User;
import java.util.List;

/**
 *
 * @author Jesse
 */
public abstract class Service {
    
    protected RoleDao roleDao;

    public Service(RoleDao roleDao) {
        this.roleDao = roleDao;
    }
    
    public boolean adminValidation(User user) {
        List<Role> userRoles = roleDao.getRolesByUser(user);
        for (Role currentRole : userRoles) {
            if (currentRole.getRole().equals("admin")) {
                return true;
            }
        }
        return false;
    }
    
}
