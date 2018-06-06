/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Blog;
import com.sg.blog.model.Category;
import com.sg.blog.model.Request;
import com.sg.blog.model.SearchTerm;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Jesse
 */
public interface CategoryDao {
    
    public Category addCategory(Category category);
    public Category editCategory(Category category);
    public void deleteCategory(int categoryID);
    public Category getCategoryByID(int categoryID);
    public Category getCategoryByBlog(Blog blog);
    public Category getCategoryByRequest(Request request);
    public List<Category> getAllCategories();
    public List<Category> seachCategories(Map<SearchTerm, String> criteria);
    
}
