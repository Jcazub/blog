/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.dao.DbImpl.BlogMappers.StaticPageMapper;
import com.sg.blog.dao.StaticPageDao;
import com.sg.blog.dao.UserDao;
import com.sg.blog.model.StaticPage;
import com.sg.blog.model.User;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jesse
 */
@Repository
public class StaticPageDaoDBImpl implements StaticPageDao {
    
    JdbcTemplate jdbcTemplate;
    UserDao userDao;

    @Autowired
    public StaticPageDaoDBImpl(DataSource dataSource, UserDao userDao) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.userDao = userDao;
    }
    
    //StaticPage SQL
    private static final String INSERT_STATIC_PAGE = "insert into ebdb.staticPages (userID, title, content, creationDate) values (?,?,?,?)";
    
    private static final String DELETE_STATIC_PAGE = "delete from ebdb.staticPages where staticPageID = ?";
    
    private static final String EDIT_STATIC_PAGE = "update ebdb.staticPages set userID = ?, title = ?, content = ?, creationDate = ? where staticPageID = ?";
    
    private static final String SELECT_STATIC_PAGE = "select * from ebdb.staticPages where staticPageID = ?";
    
    private static final String SELECT_ALL_STATIC_PAGES = "select * from ebdb.staticPages";
    
    //Static Page Helper Methods
    private StaticPage getUserForStaticPage(StaticPage page) {
        User u = userDao.getUserForStaticPage(page);
        page.setUser(u);
        return page;
    }
    
    private List<StaticPage> associateUsersWithStaticPages(List<StaticPage> pages) {
        for (StaticPage currentPage : pages) {
            currentPage = getUserForStaticPage(currentPage);
        }
        return pages;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public StaticPage addStaticPage(StaticPage page) {
        jdbcTemplate.update(INSERT_STATIC_PAGE, page.getUser().getUserID(), page.getTitle(), page.getContent(), page.getCreationDate().toString());
        page.setStaticID(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
        return page;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public StaticPage editStaticPage(StaticPage page) {
        jdbcTemplate.update(EDIT_STATIC_PAGE, page.getUser().getUserID(), page.getTitle(), page.getContent(), page.getCreationDate().toString(), page.getStaticID());
        return page;
    }

    @Override
    public void deleteStaticPage(int pageID) {
        jdbcTemplate.update(DELETE_STATIC_PAGE, pageID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public StaticPage getStaticPageByID(int pageID) {
        StaticPage page = jdbcTemplate.queryForObject(SELECT_STATIC_PAGE, new StaticPageMapper(), pageID);
        page = getUserForStaticPage(page);
        return page;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public List<StaticPage> getAllStaticPages() {
        List<StaticPage> pages = jdbcTemplate.query(SELECT_ALL_STATIC_PAGES, new StaticPageMapper());
        pages = associateUsersWithStaticPages(pages);
        return pages;
    }
    
    
    
}
