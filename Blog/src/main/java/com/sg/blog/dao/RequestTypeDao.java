/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Request;
import com.sg.blog.model.RequestType;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface RequestTypeDao {
    
    public RequestType addRequestType(RequestType requestType);
    public RequestType editRequestType(RequestType requestType);
    public void deleteRequestType(int requestTypeID);
    public RequestType getRequestTypeByRequestTypeID(int requestTypeID);
    public RequestType getRequestTypeByName(String requestName);
    public RequestType getRequestTypeByRequest(Request request);
    public List<RequestType> getAllRequestTypes();
    
}
