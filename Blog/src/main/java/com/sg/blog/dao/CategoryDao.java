/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Category;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface CategoryDao {
    
    public Category addCategory(Category category);
    public Category editCategory(Category category);
    public void deleteCategory(int categoryID);
    public Category getCategoryByID(int categoryID);
    public List<Category> getAllCategories();
    public List<Category> seachCategories();            //need to include the parameters for this method
    
}
