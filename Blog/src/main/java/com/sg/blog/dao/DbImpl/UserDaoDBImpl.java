/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.dao.DbImpl.BlogMappers.UserMapper;
import com.sg.blog.dao.RoleDao;
import com.sg.blog.dao.UserDao;
import com.sg.blog.model.Blog;
import com.sg.blog.model.Request;
import com.sg.blog.model.Role;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.StaticPage;
import com.sg.blog.model.User;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jesse
 */
public class UserDaoDBImpl implements UserDao {

    JdbcTemplate jdbcTemplate;
    RoleDao roleDao;

    public UserDaoDBImpl(JdbcTemplate jdbcTemplate, RoleDao roleDao) {
        this.jdbcTemplate = jdbcTemplate;
        this.roleDao = roleDao;
    }

    //User SQL
    private static final String INSERT_USER = "insert into Users (firstName, lastName, email, userName, password, enabled) values (?,?,?,?,?,?)";

    private static final String DELETE_USER = "delete from Users where UserID = ?";

    private static final String EDIT_USER = "update Users set firstName = ?, lastName = ?, email = ?, userName = ?, password = ?, enabled = ? where UserID = ?";

    private static final String SELECT_USER = "select * from Users where UserID = ?";
    
    private static final String SELECT_USER_BY_STATIC_PAGE = "select u.userID, u.firstName, u.lastName, u.email, u.userName, u.password, u.enabled from Users u join StaticPages s on u.userID = s.userID where s.staticPageID = ?";
    
    private static final String SELECT_USER_BY_BLOG = "select u.userID, u.firstName, u.lastName, u.email, u.userName, u.password, u.enabled from Users u join Blogs b on u.userID = b.userID where b.BlogID = ?";;
    
    private static final String SELECT_USER_BY_REQUEST = "select u.userID, u.firstName, u.lastName, u.email, u.userName, u.password, u.enabled from Users u join Requests r on u.userID = r.userID where r.RequestID = ?";;

    private static final String SELECT_ALL_USERS = "select * from Users";

    //Users_Roles SQL
    private static final String INSERT_INTO_USERS_ROLES = "insert into Users_Roles values (?,?)";

    private static final String DELETE_FROM_USERS_ROLES = "delete from Users_Roles where userID = ?";

    //User Helper Methods
    private User findRolesForUser(User user) {
        List<Role> roles = roleDao.getRolesByUser(user);
        user.setRoles(roles);
        return user;
    }

    private List<User> associateRolesWithUsers(List<User> users) {
        for (User currentUser : users) {
            currentUser = findRolesForUser(currentUser);
        }
        return users;
    }

    private void insertIntoUsersRoles(User user) {
        List<Role> roles = user.getRoles();

        for (Role currentRole : roles) {
            jdbcTemplate.update(INSERT_INTO_USERS_ROLES, user.getUserID(), currentRole.getRoleID());
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public User addUser(User user) {
        jdbcTemplate.update(INSERT_USER, user.getFirstName(), user.getLastName(), user.getEmail(), user.getUserName(), user.getPassword(), user.getEnabled());
        user.setUserID(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
        insertIntoUsersRoles(user);
        return user;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public User editUser(User user) {
        jdbcTemplate.update(DELETE_FROM_USERS_ROLES, user.getUserID());
        jdbcTemplate.update(EDIT_USER, user.getFirstName(), user.getLastName(), user.getEmail(), user.getUserName(), user.getPassword(), user.getEnabled(), user.getUserID());
        insertIntoUsersRoles(user);
        return user;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteUser(int userID) {
        jdbcTemplate.update(DELETE_FROM_USERS_ROLES, userID);
        jdbcTemplate.update(DELETE_USER, userID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public User getUserByID(int userID) {
        try {
            User u = jdbcTemplate.queryForObject(SELECT_USER, new UserMapper(), userID);
            u = findRolesForUser(u);
            return u;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public List<User> getAllUsers() {
        List<User> users = jdbcTemplate.query(SELECT_ALL_USERS, new UserMapper());
        users = associateRolesWithUsers(users);
        return users;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public List<User> searchUser(Map<SearchTerm, String> criteria) {
        if (criteria.isEmpty()) {
            return getAllUsers();
        } else {
            // build a prepared statement based on the user's search
            // terms
            StringBuilder sQuery
                    = new StringBuilder("select * from Users where ");
            // build the where clause
            int numParams = criteria.size();
            int paramPosition = 0;
            // we'll put the positional parameters into an array, the 
            // order of the parameters will match the order in which we 
            // get the search criteria from the map
            String[] paramVals = new String[numParams];
            Set<SearchTerm> keySet = criteria.keySet();
            Iterator<SearchTerm> iter = keySet.iterator();
            // build up the where clause based on the key/value pairs in 
            // the map build where clause and positional parameter array
            while (iter.hasNext()) {
                SearchTerm currentKey = iter.next();
                // if we are not the first one in, we must add an AND to 
                // the where clause
                if (paramPosition > 0) {
                    sQuery.append(" and ");
                }
                // now append our criteria name
                sQuery.append(currentKey);
                sQuery.append(" = ? ");
                // grab the value for this search criteria and put it into 
                // the paramVals array
                paramVals[paramPosition] = criteria.get(currentKey);
                paramPosition++;
            }

            List<User> users = jdbcTemplate.query(sQuery.toString(),
                    new UserMapper(),
                    paramVals);
            users = associateRolesWithUsers(users);
            return users;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public User getUserForStaticPage(StaticPage staticPage) {
        try {
          User u = jdbcTemplate.queryForObject(SELECT_USER_BY_STATIC_PAGE,new UserMapper(), staticPage.getStaticID());
          u = findRolesForUser(u);
          return u;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public User getUserForBlog(Blog blog) {
        try {
          User u = jdbcTemplate.queryForObject(SELECT_USER_BY_BLOG,new UserMapper(), blog.getBlogID());
          u = findRolesForUser(u);
          return u;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public User getUserForRequest(Request request) {
        try {
          User u = jdbcTemplate.queryForObject(SELECT_USER_BY_REQUEST,new UserMapper(), request.getBlogID());
          u = findRolesForUser(u);
          return u;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

}
