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
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jesse
 */
public class RequestTypeDaoDBImpl implements RequestTypeDao {
    
    JdbcTemplate jdbcTemplate;

    public RequestTypeDaoDBImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    //Request Type SQL
    private static final String INSERT_REQUEST_TYPE = "insert into RequestTypes (requestType) values (?)";
    
    private static final String DELETE_REQUEST_TYPE = "delete from RequestTypes where RequestTypeID = ?";
    
    private static final String EDIT_REQUEST_TYPE = "update RequestTypes set RequestType = ? where RequestTypeID = ?";
    
    private static final String SELECT_REQUEST_TYPE = "select * from RequestTypes where RequestTypeID = ?";
    
    private static final String SELECT_REQUEST_TYPE_BY_NAME = "select * from RequestTypes where RequestType = ?";
    
    private static final String SELECT_REQUEST_TYPE_BY_REQUEST = "select rt.requestTypeID, rt.requestType from RequestTypes rt join Requests re join on re.requestTypeID = rt.requestTypeID where re.blogID = ?";
    
    private static final String SELECT_ALL_REQUEST_TYPES = "select * from RequestTypes";

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
