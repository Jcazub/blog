/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.service;

import com.sg.blog.model.Request;
import com.sg.blog.model.User;
import java.util.List;

/**
 *
 * @author Jesse
 */
public interface RequestService {
    
    public Request addRequest(Request request);
    public Request editRequest(Request request);
    public void deleteRequest(Request request);
    public Request getRequestByRequestID(int requestID);
    public List<Request> getAllRequests();
    public boolean userVerification(Request request, User user);
    public boolean verifyIfRequestExists(int requestID);
    public boolean dataValidation(Request request);
    
}
