/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.TagDao;
import com.sg.blog.model.Tag;
import com.sg.blog.service.TagService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Jesse
 */
@Service
public class TagServiceImpl implements TagService {

    TagDao tagDao;

    @Autowired
    public TagServiceImpl(TagDao tagDao) {
        this.tagDao = tagDao;
    }

    @Override
    public Tag addTag(Tag tag) {
        if (dataValidation(tag)) {
            tagDao.addTag(tag);
            return tag;
        }
        return tag;
    }

    @Override
    public Tag editTag(Tag tag) {
        if (verifyIfTagExists(tag.getTagID())) {
            if (dataValidation(tag)) {
                tagDao.editTag(tag);
                return tag;
            }
        }
        return tag;
    }

    @Override
    public void deleteTag(int tagID) {
        if (verifyIfTagExists(tagID)) {
            tagDao.deleteTag(tagID);
        }
    }

    @Override
    public Tag getTagByID(int tagID) {
        return tagDao.getTagByID(tagID);
    }

    @Override
    public List<Tag> getAllTags() {
        return tagDao.getAllTags();
    }

    @Override
    public Tag getTagByName(String tagName) {
        return tagDao.getTagByName(tagName);
    }

    @Override
    public boolean verifyIfTagExists(int tagID) {
        return tagDao.getTagByID(tagID) != null;
    }

    @Override
    public boolean dataValidation(Tag tag) {
        if (tag.getName() == null
                || "".equals(tag.getName())) {
            return false;
        }
        return true;
    }

}
