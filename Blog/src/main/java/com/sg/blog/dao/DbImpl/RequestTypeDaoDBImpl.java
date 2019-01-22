/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao.DbImpl;

import com.sg.blog.dao.DbImpl.BlogMappers.RequestTypeMapper;
import com.sg.blog.dao.RequestTypeDao;
import com.sg.blog.model.Request;
import com.sg.blog.model.RequestType;
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
public class RequestTypeDaoDBImpl implements RequestTypeDao {
    
    JdbcTemplate jdbcTemplate;

    @Autowired
    public RequestTypeDaoDBImpl(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    //Request Type SQL
    private static final String INSERT_REQUEST_TYPE = "insert into ebdb.requestTypes (requestType) values (?)";
    
    private static final String DELETE_REQUEST_TYPE = "delete from ebdb.requestTypes where requestTypeID = ?";
    
    private static final String EDIT_REQUEST_TYPE = "update ebdb.requestTypes set requestType = ? where requestTypeID = ?";
    
    private static final String SELECT_REQUEST_TYPE = "select * from ebdb.requestTypes where requestTypeID = ?";
    
    private static final String SELECT_REQUEST_TYPE_BY_NAME = "select * from ebdb.requestTypes where requestType = ?";
    
    private static final String SELECT_REQUEST_TYPE_BY_REQUEST = "select rt.requestTypeID, rt.requestType from ebdb.requestTypes rt join ebdb.requests re on re.requestTypeID = rt.requestTypeID where re.blogID = ?";
    
    private static final String SELECT_ALL_REQUEST_TYPES = "select * from ebdb.requestTypes";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public RequestType addRequestType(RequestType requestType) {
        jdbcTemplate.update(INSERT_REQUEST_TYPE, requestType.getRequestType());
        requestType.setRequestTypeID(jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class));
        return requestType;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public RequestType editRequestType(RequestType requestType) {
        jdbcTemplate.update(EDIT_REQUEST_TYPE, requestType.getRequestType(), requestType.getRequestTypeID());
        return requestType;
    }

    @Override
    public void deleteRequestType(int requestTypeID) {
        jdbcTemplate.update(DELETE_REQUEST_TYPE, requestTypeID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public RequestType getRequestTypeByRequestTypeID(int requestTypeID) {
        try { 
            return jdbcTemplate.queryForObject(SELECT_REQUEST_TYPE, new RequestTypeMapper(), requestTypeID);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public RequestType getRequestTypeByName(String requestName) {
        try { 
            return jdbcTemplate.queryForObject(SELECT_REQUEST_TYPE_BY_NAME, new RequestTypeMapper(), requestName);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<RequestType> getAllRequestTypes() {
        return jdbcTemplate.query(SELECT_ALL_REQUEST_TYPES, new RequestTypeMapper());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public RequestType getRequestTypeByRequest(Request request) {
        try { 
            return jdbcTemplate.queryForObject(SELECT_REQUEST_TYPE_BY_REQUEST, new RequestTypeMapper(), request.getBlogID());
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }
    
    
}
