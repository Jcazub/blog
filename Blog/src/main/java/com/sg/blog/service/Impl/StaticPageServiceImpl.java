/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.RoleDao;
import com.sg.blog.dao.StaticPageDao;
import com.sg.blog.model.StaticPage;
import com.sg.blog.model.User;
import com.sg.blog.service.Service;
import com.sg.blog.service.StaticPageService;
import java.util.List;

/**
 *
 * @author Jesse
 */
public class StaticPageServiceImpl extends Service implements StaticPageService {
    
    StaticPageDao staticPageDao;

    public StaticPageServiceImpl(StaticPageDao staticPageDao, RoleDao roleDao) {
        super(roleDao);
        this.staticPageDao = staticPageDao;
    }

    @Override
    public StaticPage addStaticPage(StaticPage page, User user) {
        if (adminValidation(user)) {
            if (dataValidation(page)) {
                return staticPageDao.addStaticPage(page);
            }
        }
        return null;
    }

    @Override
    public StaticPage editStaticPage(StaticPage page, User user) {
        if (adminValidation(user)) {
            if (verifyIfStaticPageExists(page.getStaticID())) {
                if (dataValidation(page)) {
                    return staticPageDao.editStaticPage(page);
                }
            }
        }
        return null;
    }

    @Override
    public void deleteStaticPage(int pageID, User user) {
        if (adminValidation(user)) {
            if (verifyIfStaticPageExists(pageID)) {
                staticPageDao.deleteStaticPage(pageID);
            }
        }
    }

    @Override
    public StaticPage getStaticPageByID(int pageID) {
        return staticPageDao.getStaticPageByID(pageID);
    }

    @Override
    public List<StaticPage> getAllStaticPages() {
        return staticPageDao.getAllStaticPages();
    }

    @Override
    public boolean verifyIfStaticPageExists(int staticPageID) {
        return staticPageDao.getStaticPageByID(staticPageID) != null;
    }

    @Override
    public boolean dataValidation(StaticPage page) {
        if (page.getTitle() == null ||
                "".equals(page.getTitle()) ||
                page.getContent() == null ||
                "".equals(page.getContent()) ||
                page.getCreationDate() == null ||
                page.getUser() == null) {
            return false;
        }
        return true;
    }
    
    
    
}
