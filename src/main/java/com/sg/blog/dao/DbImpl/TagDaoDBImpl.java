/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.dao.DbImpl.BlogMappers.TagMapper;
import com.sg.blog.dao.TagDao;
import com.sg.blog.model.Blog;
import com.sg.blog.model.Request;
import com.sg.blog.model.Tag;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jesse
 */
@Repository
public class TagDaoDBImpl implements TagDao {

    JdbcTemplate jdbcTemplate;

    @Autowired
    public TagDaoDBImpl(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    //Tag SQL
    private static final String INSERT_TAG = "insert into ebdb.tags (tagName) values (?)";

    private static final String DELETE_TAG = "delete from ebdb.tags where tagID = ?";

    private static final String EDIT_TAG = "update ebdb.tags set tagName = ? where tagID = ?";

    private static final String SELECT_TAG = "select * from ebdb.tags where tagID = ?";

    private static final String SELECT_TAG_BY_NAME = "select * from ebdb.tags where tagName = ?";

    private static final String SELECT_TAGS_BY_BLOG = "select t.tagID, t.tagName from ebdb.tags t join ebdb.blogs_tags bt on bt.tagID = t.tagID where bt.blogID = ?";

    private static final String SELECT_TAGS_BY_REQUEST = "select t.tagID, t.tagName from ebdb.tags t join ebdb.requests_tags rt on rt.tagID = t.tagID where rt.blogID = ?";

    private static final String SELECT_ALL_TAGS = "select * from ebdb.tags";

    //Post_Tag_SQL
    private static final String DELETE_FROM_BLOGS_TAGS = "delete from ebdb.blogs_tags where tagID = ?";

    private static final String DELETE_FROM_REQUESTS_TAGS = "delete from ebdb.requests_tags where tagID = ?";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Tag addTag(Tag tag) {
        jdbcTemplate.update(INSERT_TAG, tag.getName());
        tag.setTagID(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
        return tag;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Tag editTag(Tag tag) {
        jdbcTemplate.update(EDIT_TAG, tag.getName(), tag.getTagID());
        return tag;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteTag(int tagID) {
        jdbcTemplate.update(DELETE_FROM_BLOGS_TAGS, tagID);
        jdbcTemplate.update(DELETE_FROM_REQUESTS_TAGS, tagID);
        jdbcTemplate.update(DELETE_TAG, tagID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Tag getTagByID(int tagID) {
        try {
            return jdbcTemplate.queryForObject(SELECT_TAG, new TagMapper(), tagID);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Tag> getAllTags() {
        return jdbcTemplate.query(SELECT_ALL_TAGS, new TagMapper());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Tag getTagByName(String tagName) {
        try {
            return jdbcTemplate.queryForObject(SELECT_TAG_BY_NAME, new TagMapper(), tagName);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Tag> getTagsByBlog(Blog blog) {
        return jdbcTemplate.query(SELECT_TAGS_BY_BLOG, new TagMapper(), blog.getBlogID());
    }

    @Override
    public List<Tag> getTagsByRequest(Request request) {
        return jdbcTemplate.query(SELECT_TAGS_BY_REQUEST, new TagMapper(), request.getBlogID());
    }
}
