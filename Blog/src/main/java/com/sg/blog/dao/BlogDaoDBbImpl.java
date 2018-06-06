/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import java.util.List;

/**
 *
 * @author Al Rahman
 */
public class BlogDaoDBbImpl{

    //User SQL
    private static final String INSERT_USER = "insert into Users values (?,?,?,?,?)";
    
    private static final String DELETE_USER = "delete from Users where UserID = ?";
    
    private static final String EDIT_USER = "update Users set firstName = ?, lastName = ?, email = ?, userName = ?, password = ? where UserID = ?";
    
    private static final String SELECT_USER = "select * from Users where UserID = ?";
    
    private static final String SELECT_ALL_USERS = "select * from Users";
    
    //Category SQL
    private static final String INSERT_CATEGORY = "insert into Categories values (?,?)";
    
    private static final String DELETE_CATEGORY = "delete from Categories where CategoryID = ?";
    
    private static final String EDIT_CATEGORY = "update Categories set categoryName = ?, categoryDescription = ?";
    
    private static final String SELECT_CATEGORY = "select * from Categories where CategoryID = ?";
    
    private static final String SELECT_ALL_CATEGORIES = "select * from Categories";
    
    //Tag SQL
    private static final String INSERT_TAG = "insert into Tags values (?)";
    
    private static final String DELETE_TAG = "delete from Tags where TagID = ?";
    
    private static final String EDIT_TAG = "update from Tags where TagID = ?";
    
    private static final String SELECT_TAG = "select * from Tags where TagID = ?";
    
    private static final String SELECT_ALL_TAGS = "select * from Tags";
    
}
