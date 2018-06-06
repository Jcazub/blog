/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Role;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface RoleDao {
    
    public Role addRole(Role role);
    public Role editRole(Role role);
    public void deleteRole(int roleID);
    public Role getRoleByID(int roleID);
    public List<Role> getAllRoles();
    
}
