/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.dao.BlogDao;
import com.sg.blog.dao.CategoryDao;
import com.sg.blog.dao.DbImpl.BlogMappers.BlogMapper;
import com.sg.blog.dao.TagDao;
import com.sg.blog.dao.UserDao;
import com.sg.blog.model.Blog;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.Tag;
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
 * @author Al Rahman
 */
public class BlogDaoDBImpl implements BlogDao {

    JdbcTemplate jdbcTemplate;
    UserDao userDao;
    CategoryDao categoryDao;
    TagDao tagDao;

    public BlogDaoDBImpl(JdbcTemplate jdbcTemplate, UserDao userDao, CategoryDao categoryDao, TagDao tagDao) {
        this.jdbcTemplate = jdbcTemplate;
        this.userDao = userDao;
        this.categoryDao = categoryDao;
        this.tagDao = tagDao;
    }
    
    //Blog SQL
    private static final String INSERT_BLOG = "insert into Blogs (userID, categoryID, creationDate, publishDate, approvedDate, isApproved, title, content, expirationDate) values (?,?,?,?,?,?,?,?,?)";
    
    private static final String DELETE_BLOG = "delete from Blogs where BlogID = ?";
    
    private static final String EDIT_BLOG = "update Blogs set userID = ?, categoryID = ?, creationDate = ?, publishDate = ?, approvedDate = ?, isApproved = ?, title = ?, content = ?, expirationDate = ? where BlogID = ?";
    
    private static final String SELECT_BLOG = "select * from Blogs where BlogID = ?";
    
    private static final String SELECT_ALL_BLOGS = "select * from Blogs ORDER BY publishDate ASC";
    
    //Blog_Tags SQL
    private static final String INSERT_INTO_BLOGS_TAGS = "insert into Blogs_Tags (BlogID, TagID) values (?,?)";
    
    private static final String DELETE_FROM_BLOGS_TAGS = "delete from Blogs_Tags where BlogID = ?";
    
    //Blog Helper Methods
    private Blog getMembersForBlog(Blog blog) {
        blog.setUser(userDao.getUserForBlog(blog));
        blog.setCategory(categoryDao.getCategoryByBlog(blog));
        blog.setTags(tagDao.getTagsByBlog(blog));
        return blog;
    }
    
    private List<Blog> associateMembersWithBlogs(List<Blog> blogs) {
        for (Blog currentBlog : blogs) {
            currentBlog = getMembersForBlog(currentBlog);
        }
        return blogs;
    }
    
    private void insertIntoBlogsTags(Blog blog) {
        List<Tag> tags = blog.getTags();
        for (Tag currentTag : tags) {
            jdbcTemplate.update(INSERT_INTO_BLOGS_TAGS, blog.getBlogID(), currentTag.getTagID());
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Blog addBlog(Blog blog) {
        jdbcTemplate.update(INSERT_BLOG, blog.getUser().getUserID(), blog.getCategory().getCategoryID(), blog.getCreationDate().toString(), blog.getPublishDate().toString(), blog.getApprovedDate().toString(), blog.getIsApproved(), blog.getTitle(), blog.getContent(), blog.getExpirationDate().toString());
        blog.setBlogID(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
        insertIntoBlogsTags(blog);
        return blog;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Blog editBlog(Blog blog) {
        jdbcTemplate.update(DELETE_FROM_BLOGS_TAGS, blog.getBlogID());
        jdbcTemplate.update(EDIT_BLOG, blog.getUser().getUserID(), blog.getCategory().getCategoryID(), blog.getCreationDate().toString(), blog.getPublishDate().toString(), blog.getApprovedDate().toString(), blog.getIsApproved(), blog.getTitle(), blog.getContent(), blog.getExpirationDate().toString(), blog.getBlogID());
        insertIntoBlogsTags(blog);
        return blog;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteBlog(int blogID) {
        jdbcTemplate.update(DELETE_FROM_BLOGS_TAGS, blogID);
        jdbcTemplate.update(DELETE_BLOG, blogID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Blog getBlogByBlogID(int blogID) {
        try {
            Blog b = jdbcTemplate.queryForObject(SELECT_BLOG, new BlogMapper(), blogID);
            b = getMembersForBlog(b);
            return b;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public List<Blog> getAllBlogs() {
        List<Blog> blogs = jdbcTemplate.query(SELECT_ALL_BLOGS, new BlogMapper());
        blogs = associateMembersWithBlogs(blogs);
        return blogs;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public List<Blog> searchBlogs(Map<SearchTerm, String> criteria) {
        if (criteria.isEmpty()) {
            return getAllBlogs();
        } else {
            // build a prepared statement based on the user's search
            // terms
            StringBuilder sQuery
                    = new StringBuilder("select * from Blogs where ");
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

            List<Blog> blogs = jdbcTemplate.query(sQuery.toString(),
                    new BlogMapper(),
                    paramVals);
            blogs = associateMembersWithBlogs(blogs);
            return blogs;
        }
    }
    
    
    
}
