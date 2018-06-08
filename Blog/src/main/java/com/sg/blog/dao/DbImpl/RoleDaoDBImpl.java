/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.dao.DbImpl.BlogMappers.RoleMapper;
import com.sg.blog.dao.RoleDao;
import com.sg.blog.model.Role;
import com.sg.blog.model.User;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jesse
 */
public class RoleDaoDBImpl implements RoleDao {
    
    JdbcTemplate jdbcTemplate;

    public RoleDaoDBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //Role SQL
    private static final String INSERT_ROLE = "insert into Roles (roleType) values (?)";
    
    private static final String DELETE_ROLE = "delete from Roles where RoleID = ?";
    
    private static final String EDIT_ROLE = "update Roles set RoleType = ? where RoleID = ?";
    
    private static final String SELECT_ROLE = "select * from Roles where RoleID = ?";
    
    private static final String SELECT_ROLE_BY_NAME = "select * from Roles where roleName = ?";
    
    private static final String SELECT_ALL_ROLES = "select * from Roles";
    
    private static final String SELECT_ROLES_BY_USER = "select r.RoleID, r.RoleType from Roles r join Users_Roles ur on r.RoleID = ur.RoleID where ur.UserID = ?";
    
    //Users_Roles SQL
    private static final String DELETE_FROM_USERS_ROLES = "delete from Users_Roles where roleID = ?";
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public Role addRole(Role role) {
        jdbcTemplate.update(INSERT_ROLE, role.getRole());
        role.setRoleID(jdbcTemplate.queryForObject("select LAST_INSERT_ID()",Integer.class));
        return role;
    }
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public Role editRole(Role role) {
        jdbcTemplate.update(EDIT_ROLE, role.getRole(), role.getRoleID());
        return role;
    }

    @Override
    public void deleteRole(int roleID) {
        jdbcTemplate.update(DELETE_FROM_USERS_ROLES, roleID);
        jdbcTemplate.update(DELETE_ROLE, roleID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public Role getRoleByID(int roleID) {
        try {
            return jdbcTemplate.queryForObject(SELECT_ROLE, new RoleMapper(), roleID);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public Role getRoleByName(String roleName) {
        try {
            return jdbcTemplate.queryForObject(SELECT_ROLE_BY_NAME, new RoleMapper(), roleName);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Role> getAllRoles() {
        return jdbcTemplate.query(SELECT_ALL_ROLES, new RoleMapper());
    }

    @Override
    public List<Role> getRolesByUser(User user) {
        return jdbcTemplate.query(SELECT_ROLES_BY_USER, new RoleMapper(), user.getUserID());
    }
}
