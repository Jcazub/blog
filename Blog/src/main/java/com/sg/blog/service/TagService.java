/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service;

import com.sg.blog.model.Blog;
import com.sg.blog.model.Request;
import com.sg.blog.model.Tag;
import com.sg.blog.model.User;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface TagService {
    
    public Tag addTag(Tag tag);
    public Tag editTag(Tag tag, User user);
    public void deleteTag(int tagID, User user);
    public Tag getTagByID(int tagID);
    public List<Tag> getAllTags();
    public Tag getTagByName(String tagName);
    public boolean verifyIfTagExists(int tagID);
    public boolean dataValidation(Tag tag);
    
}
