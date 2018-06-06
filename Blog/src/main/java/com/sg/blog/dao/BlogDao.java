/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Category;
import com.sg.blog.model.Role;
import com.sg.blog.model.StaticPage;
import com.sg.blog.model.Tag;
import com.sg.blog.model.User;
import java.util.List;

/**
 *
 * @author Al Rahman
 */
public interface BlogDao {
    
    //Role
    public Role addRole(Role role);
    public Role editRole(Role role);
    public void deleteRole(int roleID);
    public Role getRoleByID(int roleID);
    public List<Role> getAllRoles();
    
    //User 
    public User addUser(User user);
    public User editUser(User user);
    public void deleteUser(int userID);
    public User getUserByID(int userID);
    public List<User> getAllUsers();
    public List<User> searchUser();                     //need to include the parameters for this method
    
    //Static Page
    public StaticPage addStaticPage(StaticPage page);
    public StaticPage editStaticPage(StaticPage page);
    public void deleteStaticPage(int pageID);
    public StaticPage getStaticPageByID(int pageID);
    public List<StaticPage> getAllStaticPages();
    
    //Post
    public Blog addPost(Blog post);
    public Blog editPost(Blog post);
    public void deletePost(int postID);
    public Blog getPostByPostID(int postID);
    public List<Blog> getAllPosts();
    public List<Blog> searchPosts();                    //need to include the parameters for this method
    
    //Category
    public Category addCategory(Category category);
    public Category editCategory(Category category);
    public void deleteCategory(int categoryID);
    public Category getCategoryByID(int categoryID);
    public List<Category> getAllCategories();
    public List<Category> seachCategories();            //need to include the parameters for this method
    
    //Tag
    public Tag addTag(Tag tag);
    public Tag editTag(Tag tag);
    public void deleteTag(int tagID);
    public Tag getTagByID(int tagID);
    public List<Tag> getAllTags();
    public Tag getTagByName(String tagName);
    
}
