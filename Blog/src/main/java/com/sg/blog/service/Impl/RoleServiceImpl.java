/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.RoleDao;
import com.sg.blog.model.Role;
import com.sg.blog.service.RoleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Jesse
 */
@Service
public class RoleServiceImpl implements RoleService {
    
    RoleDao roleDao;

    @Autowired
    public RoleServiceImpl(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    @Override
    public Role addRole(Role role) {
        if (dataValidation(role)) {
                roleDao.addRole(role);
                return role;
            }
        return null;
    }

    @Override
    public Role editRole(Role role) {
        if (verifyIfRoleExists(role.getRoleID())) {
                return roleDao.editRole(role);
            }
        return null;
    }

    @Override
    public void deleteRole(int roleID) {
        if (verifyIfRoleExists(roleID)) {
                roleDao.deleteRole(roleID);
            }
    }

    @Override
    public Role getRoleByID(int roleID) {
        return roleDao.getRoleByID(roleID);
    }

    @Override
    public Role getRoleByName(String roleName) {
        return roleDao.getRoleByName(roleName);
    }

    @Override
    public List<Role> getAllRoles() {
        return roleDao.getAllRoles();
    }

    @Override
    public boolean verifyIfRoleExists(int roleID) {
        return roleDao.getRoleByID(roleID) != null;
    }

    @Override
    public boolean dataValidation(Role role) {
        if (role.getRole() == null ||
                "".equals(role.getRole())) {
            return false;
        }
        return true;
    }
    
    
    
}
