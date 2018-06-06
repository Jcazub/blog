/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import java.util.List;

/**
 *
 * @author Al Rahman
 */
public class BlogDaoDBbImpl{

    
    
    //Category SQL
    private static final String INSERT_CATEGORY = "insert into Categories values (?,?)";
    
    private static final String DELETE_CATEGORY = "delete from Categories where CategoryID = ?";
    
    private static final String EDIT_CATEGORY = "update Categories set categoryName = ?, categoryDescription = ? where CategoryID = ?";
    
    private static final String SELECT_CATEGORY = "select * from Categories where CategoryID = ?";
    
    private static final String SELECT_ALL_CATEGORIES = "select * from Categories";
    
    //Tag SQL
    private static final String INSERT_TAG = "insert into Tags values (?)";
    
    private static final String DELETE_TAG = "delete from Tags where TagID = ?";
    
    private static final String EDIT_TAG = "update Tags set TagName = ? where TagID = ?";
    
    private static final String SELECT_TAG = "select * from Tags where TagID = ?";
    
    private static final String SELECT_ALL_TAGS = "select * from Tags";
    
    //Role SQL
    private static final String INSERT_ROLE = "insert into Roles values (?)";
    
    private static final String DELETE_ROLE = "delete from Roles where RoleID = ?";
    
    private static final String EDIT_ROLE = "update Roles set RoleType = ? where RoleID = ?";
    
    private static final String SELECT_ROLE = "select * from Roles where RoleID = ?";
    
    private static final String SELECT_ALL_ROLES = "select * from Roles";
    
    //StaticPage SQL
    private static final String INSERT_STATIC_PAGE = "insert into StaticPages values (?,?,?)";
    
    private static final String DELETE_STATIC_PAGE = "delete from StaticPages where StaticPageID = ?";
    
    private static final String EDIT_STATIC_PAGE = "update StaticPages set UserID = ?, title = ?, content = ? where StaticPageID = ?";
    
    private static final String SELECT_STATIC_PAGE = "select * from StaticPages where StaticPageID = ?";
    
    private static final String SELECT_ALL_STATIC_PAGES = "select * from StaticPages";
    
    //Blog SQL
    private static final String INSERT_BLOG = "insert into Blogs values (?,?,?,?,?,?,?,?)";
    
    private static final String DELETE_BLOG = "delete from Blogs where BlogID = ?";
    
    private static final String EDIT_BLOG = "update Blogs set userID = ?, categoryID = ?, creationDate = ?, publishDate = ?, approvedDate = ?, isApproved = ?, title = ?, content = ? where BlogID = ?";
    
    private static final String SELECT_BLOG = "select * from Blogs where BlogID = ?";
    
    private static final String SELECT_ALL_BLOGS = "select * from Blogs";
    
    //Request Type SQL
    private static final String INSERT_REQUEST_TYPE = "insert into RequestTypes values (?)";
    
    private static final String DELETE_REQUEST_TYPE = "delete from RequestTypes where RequestTypeID = ?";
    
    private static final String EDIT_REQUEST_TYPE = "update RequestTypes set RequestType = ?";
    
    private static final String SELECT_REQUEST_TYPE = "select * from RequestTypes where RequestTypeID = ?";
    
    private static final String SELECT_ALL_REQUEST_REQUEST_TYPES = "select * from RequestTypes";
    
    //Request SQL
    private static final String INSERT_REQUEST = "insert into Requests values (?,?,?,?,?,?,?,?,?,?)";
    
    private static final String DELETE_REQUEST = "delete from Requests where BlogID = ?";
    
    private static final String EDIT_REQUEST = "update Request set userID = ?, categoryID = ?, creationDate = ?, publishDate = ?, approvedDate = ?, isApproved = ?, title = ?, content = ?, requestTypeID = ? where BlogID = ?";
    
    private static final String SELECT_REQUEST = "select * from Requests where BlogID = ?";
    
    private static final String SELECT_ALL_REQUESTS = "select * from Requests";
    
}
