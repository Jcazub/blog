/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service.Impl;

import com.sg.blog.dao.RequestDao;
import com.sg.blog.dao.RoleDao;
import com.sg.blog.model.Request;
import com.sg.blog.model.User;
import com.sg.blog.service.RequestService;
import com.sg.blog.service.Service;
import java.util.List;

/**
 *
 * @author Jesse
 */
public class RequestServiceImpl extends Service implements RequestService {

    RequestDao requestDao;

    public RequestServiceImpl(RequestDao requestDao, RoleDao roleDao) {
        super(roleDao);
        this.requestDao = requestDao;
    }

    @Override
    public Request addRequest(Request request) {
        if (dataValidation(request)) {
            return requestDao.addRequest(request);
        }
        return null;
    }

    @Override
    public Request editRequest(Request request) {
        if (verifyIfRequestExists(request.getBlogID())) {
            if (dataValidation(request)) {
                return requestDao.editRequest(request);
            }
        }
        return null;
    }

    @Override
    public void deleteRequest(Request request) {
        if (verifyIfRequestExists(request.getBlogID())) {
            requestDao.deleteRequest(request.getBlogID());
        }
    }

    @Override
    public Request getRequestByRequestID(int requestID) {
        return requestDao.getRequestByRequestID(requestID);
    }

    @Override
    public List<Request> getAllRequests() {
        return requestDao.getAllRequests();
    }

    @Override
    public boolean userVerification(Request request, User user) {
        return request.getUser().getUserID() == user.getUserID();
    }

    @Override
    public boolean verifyIfRequestExists(int requestID) {
        return requestDao.getRequestByRequestID(requestID) != null;
    }

    @Override
    public boolean dataValidation(Request blog) {

        if ((blog.getUser() == null)
                || (blog.getBlogID() == 0)
                || (blog.getRequestType() == null)) {
            return false;
        }

        if (blog.getRequestType().getRequestType().equals("edit")) {
            if ((blog.getCreationDate() == null)
                    || (blog.getPublishDate() == null)
                    || (blog.getExpirationDate() == null)
                    || (blog.getTitle() == null)
                    || ("".equals(blog.getTitle()))
                    || (blog.getContent() == null)
                    || ("".equals(blog.getContent()))
                    || (blog.getCategory() == null)) {
                return false;
            }
        }
        return true;
    }

}
