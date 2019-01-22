/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.dao.CategoryDao;
import com.sg.blog.dao.DbImpl.BlogMappers.RequestMapper;
import com.sg.blog.dao.RequestDao;
import com.sg.blog.dao.RequestTypeDao;
import com.sg.blog.dao.TagDao;
import com.sg.blog.dao.UserDao;
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
public class RequestDaoDBImpl implements RequestDao {

    JdbcTemplate jdbcTemplate;
    UserDao userDao;
    CategoryDao categoryDao;
    TagDao tagDao;
    RequestTypeDao requestTypeDao;

    @Autowired
    public RequestDaoDBImpl(DataSource dataSource, UserDao userDao, CategoryDao categoryDao, TagDao tagDao, RequestTypeDao requestTypeDao) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.userDao = userDao;
        this.categoryDao = categoryDao;
        this.tagDao = tagDao;
        this.requestTypeDao = requestTypeDao;
    }

    //Request SQL
    private static final String INSERT_REQUEST = "insert into ebdb.requests (blogID, userID, categoryID, creationDate, publishDate, approvedDate, expirationDate, isApproved, title, content, requestTypeID) values (?,?,?,?,?,?,?,?,?,?,?)";

    private static final String DELETE_REQUEST = "delete from ebdb.requests where blogID = ?";

    private static final String EDIT_REQUEST = "update ebdb.requests set userID = ?, categoryID = ?, creationDate = ?, publishDate = ?, approvedDate = ?, expirationDate = ?, isApproved = ?, title = ?, content = ?, requestTypeID = ? where blogID = ?";

    private static final String SELECT_REQUEST = "select * from ebdb.requests where blogID = ?";

    private static final String SELECT_ALL_REQUESTS = "select * from ebdb.requests";

    //Request_Tags SQL
    private static final String INSERT_INTO_REQUESTS_TAGS = "insert into ebdb.requests_tags (blogID, tagID) values (?,?)";

    private static final String DELETE_FROM_REQUESTS_TAGS = "delete from ebdb.requests_tags where blogID = ?";

    //Request Helper Methods
    private Request getMembersForRequest(Request request) {
        request.setUser(userDao.getUserForRequest(request));
        request.setCategory(categoryDao.getCategoryByRequest(request));
        request.setTags(tagDao.getTagsByRequest(request));
        request.setRequestType(requestTypeDao.getRequestTypeByRequest(request));
        return request;
    }

    private List<Request> associateMembersWithRequests(List<Request> requests) {
        for (Request currentRequest : requests) {
            currentRequest = getMembersForRequest(currentRequest);
        }
        return requests;
    }

    private void insertIntoRequestsTags(Request request) {
        List<Tag> tags = request.getTags();
        for (Tag currentTag : tags) {
            jdbcTemplate.update(INSERT_INTO_REQUESTS_TAGS, request.getBlogID(), currentTag.getTagID());
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Request addRequest(Request request) {
            jdbcTemplate.update(INSERT_REQUEST, request.getBlogID(), request.getUser().getUserID(), request.getCategory().getCategoryID(), request.getCreationDate().toString(), request.getPublishDate().toString(), request.getApprovedDate().toString(), request.getExpirationDate().toString(), request.getIsApproved(), request.getTitle(), request.getContent(), request.getRequestType().getRequestTypeID());
            insertIntoRequestsTags(request);
        return request;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Request editRequest(Request request) {
        jdbcTemplate.update(DELETE_FROM_REQUESTS_TAGS, request.getBlogID());
        jdbcTemplate.update(EDIT_REQUEST, request.getUser().getUserID(), request.getCategory().getCategoryID(), request.getCreationDate().toString(), request.getPublishDate().toString(), request.getApprovedDate().toString(), request.getExpirationDate().toString(), request.getIsApproved(), request.getTitle(), request.getContent(), request.getRequestType().getRequestTypeID(), request.getBlogID());
        insertIntoRequestsTags(request);
        return request;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteRequest(int requestID) {
        jdbcTemplate.update(DELETE_FROM_REQUESTS_TAGS, requestID);
        jdbcTemplate.update(DELETE_REQUEST, requestID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Request getRequestByRequestID(int requestID) {
        try {
            Request r = jdbcTemplate.queryForObject(SELECT_REQUEST, new RequestMapper(), requestID);
            r = getMembersForRequest(r);
            return r;
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public List<Request> getAllRequests() {
        List<Request> requests = jdbcTemplate.query(SELECT_ALL_REQUESTS, new RequestMapper());
        requests = associateMembersWithRequests(requests);
        return requests;
    }

}
