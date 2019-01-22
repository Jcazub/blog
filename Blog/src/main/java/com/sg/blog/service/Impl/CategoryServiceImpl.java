/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.CategoryDao;
import com.sg.blog.model.Category;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.service.CategoryService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Jesse
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    
    CategoryDao categoryDao;

    @Autowired
    public CategoryServiceImpl(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    @Override
    public Category addCategory(Category category) {
        if (dataValidation(category)) {
                categoryDao.addCategory(category);
                return category;
            }
        return null;
    }

    @Override
    public Category editCategory(Category category) {
        if (verifyIfCategoryExists(category.getCategoryID())) {
                if (dataValidation(category)) {
                    categoryDao.editCategory(category);
                    return category;
                }
            }
        return null;
    }

    @Override
    public void deleteCategory(int categoryID) {
        if (verifyIfCategoryExists(categoryID)) {
                categoryDao.deleteCategory(categoryID);
            }
    }

    @Override
    public Category getCategoryByID(int categoryID) {
        return categoryDao.getCategoryByID(categoryID);
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryDao.getAllCategories();
    }

    @Override
    public List<Category> seachCategories(Map<SearchTerm, String> criteria) {
        return categoryDao.seachCategories(criteria);
    }

    @Override
    public boolean verifyIfCategoryExists(int categoryID) {
        return categoryDao.getCategoryByID(categoryID) != null;
    }

    @Override
    public boolean dataValidation(Category category) {
        if (category.getName() == null ||
                "".equals(category.getName())) {
            return false;
        }
        return true;
    }
}
