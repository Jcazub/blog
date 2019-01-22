/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.StaticPageDao;
import com.sg.blog.model.StaticPage;
import com.sg.blog.service.StaticPageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Jesse
 */
@Service
public class StaticPageServiceImpl implements StaticPageService {
    
    StaticPageDao staticPageDao;

    @Autowired
    public StaticPageServiceImpl(StaticPageDao staticPageDao) {
        this.staticPageDao = staticPageDao;
    }

    @Override
    public StaticPage addStaticPage(StaticPage page) {
        if (dataValidation(page)) {
                return staticPageDao.addStaticPage(page);
            }
        return null;
    }

    @Override
    public StaticPage editStaticPage(StaticPage page) {
        if (verifyIfStaticPageExists(page.getStaticID())) {
                if (dataValidation(page)) {
                    return staticPageDao.editStaticPage(page);
                }
            }
        return null;
    }

    @Override
    public void deleteStaticPage(int pageID) {
        if (verifyIfStaticPageExists(pageID)) {
                staticPageDao.deleteStaticPage(pageID);
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
