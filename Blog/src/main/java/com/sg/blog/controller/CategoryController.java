/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.dao.CategoryDao;
import com.sg.blog.model.Category;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.service.CategoryService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author chxxch
 */
@Controller
public class CategoryController {

    CategoryService categoryService;
    CategoryDao categoryDao;

    @Inject
    public CategoryController(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    @RequestMapping(value = "/search/categories", method = RequestMethod.POST)
    @ResponseBody
    public List<Category> searchCategories(@RequestBody Map<String, String> searchMap) {

        Map<SearchTerm, String> criteriaMap = new HashMap<>();

//        String currentTerm = searchMap.get("firstName");
//        if (currentTerm != null && !currentTerm.isEmpty()) {
//            criteriaMap.put(SearchTerm.FIRST_NAME, currentTerm);
//        }
//        currentTerm = searchMap.get("lastName");
//        if (currentTerm != null && !currentTerm.isEmpty()) {
//            criteriaMap.put(SearchTerm.LAST_NAME, currentTerm);
//        }
//        currentTerm = searchMap.get("email");
//        if (currentTerm != null && !currentTerm.isEmpty()) {
//            criteriaMap.put(SearchTerm.EMAIL, currentTerm);
//        }
//        currentTerm = searchMap.get("userName");
//        if (currentTerm != null && !currentTerm.isEmpty()) {
//            criteriaMap.put(SearchTerm.EMAIL, currentTerm);
//        }
//        currentTerm = searchMap.get("password");
//        if (currentTerm != null && !currentTerm.isEmpty()) {
//            criteriaMap.put(SearchTerm.PASSWORD, currentTerm);
//        }

    
        String currentTerm = searchMap.get("categoryName");
        if (currentTerm != null && !currentTerm.isEmpty()) {
            criteriaMap.put(SearchTerm.CATEGORYNAME, currentTerm);
        }
        
        return categoryDao.seachCategories(criteriaMap);
    }
    
    @RequestMapping(value = "/editCategory", method = RequestMethod.POST)
    @ResponseBody
    public String editCategory(HttpServletRequest request) {
        Integer i = Integer.parseInt(request.getParameter("catID"));
        Category c = categoryService.getCategoryByID(i);
        String name = request.getParameter("dashboard-catName" + i);
        String desc = request.getParameter("dashboard-catDesc" + i);
        
        if (name != null || "".equals(name)) {
            c.setName(name);
        }
      
        if (desc != null || "".equals(desc)) {
            c.setDesc(desc);
        }
        
        //edit category
        categoryService.editCategory(c);
        
        return "redirect:/dashboard";
    }
    
    @RequestMapping(value = "addCategory", method = RequestMethod.POST)
    @ResponseBody
    public String addCategory(HttpServletRequest request) {
        Category c = new Category();
        
        return "/";
    }

}
