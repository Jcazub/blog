/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.model.Blog;
import com.sg.blog.model.Category;
import com.sg.blog.model.Request;
import com.sg.blog.model.RequestType;
import com.sg.blog.model.Role;
import com.sg.blog.model.StaticPage;
import com.sg.blog.model.Tag;
import com.sg.blog.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Jesse
 */
public class BlogMappers {
    
    public static final class RoleMapper implements RowMapper<Role> {
        @Override
        public Role mapRow(ResultSet rs, int i) throws SQLException {
            Role r = new Role();
            
            r.setRoleID(rs.getInt("RoleID"));
            r.setRole(rs.getString("RoleType"));
            
            return r;
        }
    }

    public static final class UserMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int i) throws SQLException {
            User u = new User();

            u.setUserID(rs.getInt("UserID"));
            u.setEmail(rs.getString("email"));
            u.setFirstName(rs.getString("firstName"));
            u.setLastName(rs.getString("lastName"));
            u.setUserName(rs.getString("userName"));
            u.setPassword(rs.getString("password"));
      
            return u;
        }
    }
    
    public static final class CategoryMapper implements RowMapper<Category> {
        @Override
        public Category mapRow(ResultSet rs, int i) throws SQLException {
            Category c = new Category();
            
            c.setCategoryID(rs.getInt("CategoryID"));
            c.setName(rs.getString("categoryName"));
            c.setDesc(rs.getString("description"));
            
            return c;
        }
    }
    
    public static final class TagMapper implements RowMapper<Tag> {
        @Override
        public Tag mapRow(ResultSet rs, int i) throws SQLException {
            Tag t = new Tag(); 
            
            t.setTagID(rs.getInt("TagID"));
            t.setName(rs.getString("tagName"));
            
            return t;
        }
    }
    
    public static final class StaticPageMapper implements RowMapper<StaticPage> {
        @Override
        public StaticPage mapRow(ResultSet rs, int i) throws SQLException {
            StaticPage s = new StaticPage();
            
            s.setStaticID(rs.getInt("StaticPageID"));
            s.setCreationDate(rs.getTimestamp("creationDate").toLocalDateTime().toLocalDate());
            s.setTitle(rs.getString("title"));
            s.setContent(rs.getString("content"));
            
            return s;
        }
    }
    
    public static final class BlogMapper implements RowMapper<Blog> {
        @Override
        public Blog mapRow(ResultSet rs, int i) throws SQLException {
            Blog b = new Blog();
            
            b.setBlogID(rs.getInt("blogID"));
            b.setTitle(rs.getString("title"));
            b.setContent(rs.getString("content"));
            b.setCreationDate(rs.getTimestamp("creationDate").toLocalDateTime().toLocalDate());
            b.setPublishDate(rs.getTimestamp("publishDate").toLocalDateTime().toLocalDate());
            b.setApprovedDate(rs.getTimestamp("approvedDate").toLocalDateTime().toLocalDate());
            b.setIsApproved(rs.getBoolean("isApproved"));
            
            return b;
        }
    }
    
    public static final class RequestTypeMapper implements RowMapper<RequestType> {
        @Override
        public RequestType mapRow(ResultSet rs, int i) throws SQLException {
            RequestType r = new RequestType();
            
            r.setRequestTypeID(rs.getInt("RequestTypeID"));
            r.setRequestType(rs.getString("requestType"));
            
            return r;
        }
    }
    
    public static final class RequestMapper implements RowMapper<Request> {
        @Override
        public Request mapRow(ResultSet rs, int i) throws SQLException {
            Request r = new Request();
            
            r.setBlogID(rs.getInt("blogID"));
            r.setTitle(rs.getString("title"));
            r.setContent(rs.getString("content"));
            r.setCreationDate(rs.getTimestamp("creationDate").toLocalDateTime().toLocalDate());
            r.setPublishDate(rs.getTimestamp("publishDate").toLocalDateTime().toLocalDate());
            r.setApprovedDate(rs.getTimestamp("approvedDate").toLocalDateTime().toLocalDate());
            r.setIsApproved(rs.getBoolean("isApproved"));
            
            return r;
        }
    }
}
