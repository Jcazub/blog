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
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jesse
 */
@Repository
public class RoleDaoDBImpl implements RoleDao {
    
    JdbcTemplate jdbcTemplate;

    @Autowired
    public RoleDaoDBImpl(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    //Role SQL
    private static final String INSERT_ROLE = "insert into ebdb.roles (roleType) values (?)";
    
    private static final String DELETE_ROLE = "delete from ebdb.roles where roleID = ?";
    
    private static final String EDIT_ROLE = "update ebdb.roles set roleType = ? where roleID = ?";
    
    private static final String SELECT_ROLE = "select * from ebdb.roles where roleID = ?";
    
    private static final String SELECT_ROLE_BY_NAME = "select * from ebdb.roles where roleType = ?";
    
    private static final String SELECT_ALL_ROLES = "select * from ebdb.roles";
    
    private static final String SELECT_ROLES_BY_USER = "select r.roleID, r.roleType from ebdb.roles r join ebdb.users_roles ur on r.roleID = ur.roleID where ur.userID = ?";
    
    //Users_Roles SQL
    private static final String DELETE_FROM_USERS_ROLES = "delete from ebdb.users_roles where roleID = ?";
    
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
