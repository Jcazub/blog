/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.RequestTypeDao;
import com.sg.blog.model.RequestType;
import com.sg.blog.service.RequestTypeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Jesse
 */
@Service
public class RequestTypeServiceImpl implements RequestTypeService {

    RequestTypeDao requestTypeDao;

    @Autowired
    public RequestTypeServiceImpl(RequestTypeDao requestTypeDao) {
        this.requestTypeDao = requestTypeDao;
    }

    @Override
    public RequestType addRequestType(RequestType requestType) {
        if (dataValidation(requestType)) {
                return requestTypeDao.addRequestType(requestType);
            }
        return null;
    }

    @Override
    public RequestType editRequestType(RequestType requestType) {
        if (verifyIfRequestTypeExists(requestType.getRequestTypeID())) {
                if (dataValidation(requestType)) {
                    return requestTypeDao.editRequestType(requestType);
                }
            }
        return null;
    }

    @Override
    public void deleteRequestType(int requestTypeID) {
        if (verifyIfRequestTypeExists(requestTypeID)) {
                requestTypeDao.deleteRequestType(requestTypeID);
            }
    }

    @Override
    public RequestType getRequestTypeByRequestTypeID(int requestTypeID) {
        return requestTypeDao.getRequestTypeByRequestTypeID(requestTypeID);
    }

    @Override
    public RequestType getRequestTypeByName(String requestName) {
        return requestTypeDao.getRequestTypeByName(requestName);
    }

    @Override
    public List<RequestType> getAllRequestTypes() {
        return requestTypeDao.getAllRequestTypes();
    }

    @Override
    public boolean verifyIfRequestTypeExists(int requestTypeID) {
        return requestTypeDao.getRequestTypeByRequestTypeID(requestTypeID) != null;
    }

    @Override
    public boolean dataValidation(RequestType requestType) {
        if (requestType.getRequestType() == null
                || "".equals(requestType.getRequestType())) {
            return false;
        }
        return true;
    }

}
