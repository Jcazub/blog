/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.BlogDao;
import com.sg.blog.dao.RoleDao;
import com.sg.blog.model.Blog;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.User;
import com.sg.blog.service.BlogService;
import com.sg.blog.service.Service;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Jesse
 */
public class BlogServiceImpl extends Service implements BlogService {

    BlogDao blogDao;

    public BlogServiceImpl(BlogDao blogDao, RoleDao roleDao) {
        super(roleDao);
        this.blogDao = blogDao;
    }

    @Override
    public Blog addBlog(Blog blog) {
        if (dataValidation(blog)) {
            return blogDao.addBlog(blog);
        }
        return null;
    }

    @Override
    public Blog editBlog(Blog blog) {
        if (verifyIfBlogExists(blog.getBlogID())) {
            if (dataValidation(blog)) {
                return blogDao.editBlog(blog);
            }
        }
        return null;
    }

    @Override
    public void deleteBlog(int blogID) {
        if (verifyIfBlogExists(blogID)) {
                blogDao.deleteBlog(blogID);
            }
    }

    @Override
    public Blog getBlogByBlogID(int blogID) {
        return blogDao.getBlogByBlogID(blogID);
    }

    @Override
    public List<Blog> getAllBlogs() {
        return blogDao.getAllBlogs();
    }

    @Override
    public List<Blog> searchBlogs(Map<SearchTerm, String> criteria) {
        return blogDao.searchBlogs(criteria);
    }

    @Override
    public boolean verifyIfBlogExists(int blogID) {
        return blogDao.getBlogByBlogID(blogID) != null;
    }

    @Override
    public boolean dataValidation(Blog blog) {
        if ((blog.getCreationDate() == null)
                || (blog.getPublishDate() == null)
                || (blog.getExpirationDate() == null)
                || (blog.getTitle() == null)
                || ("".equals(blog.getTitle()))
                || (blog.getContent() == null)
                || ("".equals(blog.getContent()))
                || (blog.getCategory() == null)
                || (blog.getUser() == null)) {
            return false;
        }
        return true;
    }

}
