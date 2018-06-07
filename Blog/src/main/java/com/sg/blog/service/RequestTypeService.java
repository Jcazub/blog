/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service;

import com.sg.blog.model.RequestType;
import com.sg.blog.model.User;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface RequestTypeService {
    
    public RequestType addRequestType(RequestType requestType, User user);
    public RequestType editRequestType(RequestType requestType, User user);
    public void deleteRequestType(int requestTypeID, User user);
    public RequestType getRequestTypeByRequestTypeID(int requestTypeID);
    public RequestType getRequestTypeByName(String requestName);
    public List<RequestType> getAllRequestTypes();
    public boolean verifyIfRequestTypeExists(int requestTypeID);
    public boolean dataValidation(RequestType requestType);
    
}
