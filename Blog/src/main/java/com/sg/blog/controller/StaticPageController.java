/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.model.StaticPage;
import com.sg.blog.model.User;
import com.sg.blog.service.StaticPageService;
import com.sg.blog.service.UserService;
import java.security.Principal;
import java.time.LocalDate;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Jesse
 */
@Controller
public class StaticPageController {
    
    private StaticPageService staticPageService;
    private UserService userService;

    @Inject
    public StaticPageController(StaticPageService staticPageService, UserService userService) {
        this.staticPageService = staticPageService;
        this.userService = userService;
    }
    
    @RequestMapping(value = "/displayCreatePage", method = RequestMethod.GET)
    public String displayCreatePage() {
        return "createPage";
    }
    
    @RequestMapping(value = "/createPage", method = RequestMethod.POST)
    public String createPage(HttpServletRequest request, Principal principal) {
        
        StaticPage s = new StaticPage();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        User user = userService.getUserByUserName(principal.getName());
        
        s.setTitle(title);
        s.setContent(content);
        s.setCreationDate(LocalDate.now());
        s.setUser(user);
        
        staticPageService.addStaticPage(s);
        
        return "redirect:/dashboard";
    }
    
    @RequestMapping(value = "/displayEditPage", method = RequestMethod.GET)
    public String displayEditPage(HttpServletRequest request, Model model) {
        
        model.addAttribute("page", staticPageService.getStaticPageByID(Integer.parseInt(request.getParameter("pageID"))));
        
        return "editPage";
    }
    
    @RequestMapping(value = "/editPage", method = RequestMethod.POST)
    public String editPage(HttpServletRequest request) {
        
        StaticPage s = staticPageService.getStaticPageByID(Integer.parseInt(request.getParameter("pageID")));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        if (title != null || "".equals(title)) {
            s.setTitle(title);
        }
      
        if (content != null || "".equals(content)) {
            s.setContent(content);
        }
        
        staticPageService.editStaticPage(s);
        
        return "redirect:/dashboard";
    }
    
    @RequestMapping(value = "/deletePage", method = RequestMethod.GET)
    public String deletePage(HttpServletRequest request) {
        Integer i = Integer.parseInt(request.getParameter("pageID"));
        staticPageService.deleteStaticPage(i);
        return "redirect:/dashboard";
    }
    
    @RequestMapping(value="/page", method = RequestMethod.GET)
    public String viewPage(HttpServletRequest request, Model model) {   
        model.addAttribute("page", staticPageService.getStaticPageByID(Integer.parseInt(request.getParameter("pageID"))));
        return "page";
    }
    
    
    
}
