/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service;

import com.sg.blog.model.Category;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Jesse
 */
public interface CategoryService {
    public Category addCategory(Category category, User user);
    public Category editCategory(Category category, User user);
    public void deleteCategory(int categoryID,  User user);
    public Category getCategoryByID(int categoryID);
    public List<Category> getAllCategories();
    public List<Category> seachCategories(Map<SearchTerm, String> criteria);
    public boolean verifyIfCategoryExists(int categoryID);
    public boolean dataValidation(Category category);
    
}
