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
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jesse
 */
public class StaticPageDaoDBImpl implements StaticPageDao {
    
    JdbcTemplate jdbcTemplate;
    UserDao userDao;

    public StaticPageDaoDBImpl(JdbcTemplate jdbcTemplate, UserDao userDao) {
        this.jdbcTemplate = jdbcTemplate;
        this.userDao = userDao;
    }
    
    //StaticPage SQL
    private static final String INSERT_STATIC_PAGE = "insert into StaticPages (userID, title, content, creationDate) values (?,?,?,?)";
    
    private static final String DELETE_STATIC_PAGE = "delete from StaticPages where StaticPageID = ?";
    
    private static final String EDIT_STATIC_PAGE = "update StaticPages set UserID = ?, title = ?, content = ?, creationDate = ? where StaticPageID = ?";
    
    private static final String SELECT_STATIC_PAGE = "select * from StaticPages where StaticPageID = ?";
    
    private static final String SELECT_ALL_STATIC_PAGES = "select * from StaticPages";
    
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
