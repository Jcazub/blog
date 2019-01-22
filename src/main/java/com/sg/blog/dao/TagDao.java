/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Blog;
import com.sg.blog.model.Request;
import com.sg.blog.model.Tag;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface TagDao {
    
    public Tag addTag(Tag tag);
    public Tag editTag(Tag tag);
    public void deleteTag(int tagID);
    public Tag getTagByID(int tagID);
    public List<Tag> getTagsByBlog(Blog blog);
    public List<Tag> getTagsByRequest(Request request);
    public List<Tag> getAllTags();
    public Tag getTagByName(String tagName);
    
}
