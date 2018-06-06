/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.dao;

import com.sg.blog.model.Request;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface RequestDao {
    
    public Request addRequest(Request request);
    public Request editRequest(Request request);
    public void deleteRequest(int requestID);
    public Request getRequestByRequestID(int requestID);
    public List<Request> getAllRequests();
    
}
