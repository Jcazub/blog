/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.dao.CategoryDao;
import com.sg.blog.dao.DbImpl.BlogMappers.CategoryMapper;
import com.sg.blog.model.Blog;
import com.sg.blog.model.Category;
import com.sg.blog.model.Request;
import com.sg.blog.model.SearchTerm;
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
public class CategoryDaoDBImpl implements CategoryDao {

    JdbcTemplate jdbcTemplate;

    public CategoryDaoDBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //Category SQL
    private static final String INSERT_CATEGORY = "insert into Categories (categoryName, description) values (?,?)";

    private static final String DELETE_CATEGORY = "delete from Categories where CategoryID = ?";

    private static final String EDIT_CATEGORY = "update Categories set categoryName = ?, description = ? where CategoryID = ?";

    private static final String SELECT_CATEGORY = "select * from Categories where CategoryID = ?";
    
    private static final String SELECT_CATEGORY_FOR_BLOG = "select c.categoryID, c.categoryName, c.description from Categories c join Blogs b on b.categoryID = c.categoryID where b.blogID = ?";
    
    private static final String SELECT_CATEGORY_FOR_REQUEST = "select c.categoryID, c.categoryName, c.description from Categories c join Requests r on r.categoryID = c.categoryID where r.blogID = ?";

    private static final String SELECT_ALL_CATEGORIES = "select * from Categories";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Category addCategory(Category category) {
        jdbcTemplate.update(INSERT_CATEGORY, category.getName(), category.getDesc());
        category.setCategoryID(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
        return category;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Category editCategory(Category category) {
        jdbcTemplate.update(EDIT_CATEGORY, category.getName(), category.getDesc(), category.getCategoryID());
        return category;
    }

    @Override
    public void deleteCategory(int categoryID) {
        jdbcTemplate.update(DELETE_CATEGORY, categoryID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Category getCategoryByID(int categoryID) {
        try {
            return jdbcTemplate.queryForObject(SELECT_CATEGORY, new CategoryMapper(), categoryID);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Category> getAllCategories() {
        return jdbcTemplate.query(SELECT_ALL_CATEGORIES, new CategoryMapper());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public List<Category> seachCategories(Map<SearchTerm, String> criteria) {
        if (criteria.isEmpty()) {
            return getAllCategories();
        } else {
            // build a prepared statement based on the user's search
            // terms
            StringBuilder sQuery
                    = new StringBuilder("select * from Categories where ");
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

            return jdbcTemplate.query(sQuery.toString(),
                    new CategoryMapper(),
                    paramVals);
        }
    }

    @Override
    public Category getCategoryByBlog(Blog blog) {
        try {
            return jdbcTemplate.queryForObject(SELECT_CATEGORY_FOR_BLOG, new CategoryMapper(), blog.getBlogID());
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public Category getCategoryByRequest(Request request) {
        try {
            return jdbcTemplate.queryForObject(SELECT_CATEGORY_FOR_REQUEST, new CategoryMapper(), request.getBlogID());
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

}
