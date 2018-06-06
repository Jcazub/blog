/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jesse
 */
public class UserDaoDBImpl {
    
    JdbcTemplate jdbcTemplate;

    public UserDaoDBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    //User SQL
    private static final String INSERT_USER = "insert into Users values (?,?,?,?,?)";
    
    private static final String DELETE_USER = "delete from Users where UserID = ?";
    
    private static final String EDIT_USER = "update Users set firstName = ?, lastName = ?, email = ?, userName = ?, password = ? where UserID = ?";
    
    private static final String SELECT_USER = "select * from Users where UserID = ?";
    
    private static final String SELECT_ALL_USERS = "select * from Users";
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public User addUser(User user) {
        jdbcTemplate.update(psc);
    }
    
    
}
