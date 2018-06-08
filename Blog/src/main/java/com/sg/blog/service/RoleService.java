/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service;

import com.sg.blog.model.Role;
import com.sg.blog.model.User;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface RoleService {
    
    public Role addRole(Role role, User user);
    public Role editRole(Role role, User user);
    public void deleteRole(int roleID, User user);
    public Role getRoleByID(int roleID);
    public Role getRoleByName(String roleName);
    public List<Role> getAllRoles();
    public boolean verifyIfRoleExists(int roleID);
    public boolean dataValidation(Role role);
}
