/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.StaticPage;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface StaticPageDao {
    
    public StaticPage addStaticPage(StaticPage page);
    public StaticPage editStaticPage(StaticPage page);
    public void deleteStaticPage(int pageID);
    public StaticPage getStaticPageByID(int pageID);
    public List<StaticPage> getAllStaticPages();   
    
}
