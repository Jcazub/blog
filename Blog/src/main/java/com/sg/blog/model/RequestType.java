/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.model;

import java.util.Objects;

/**
 *
 * @author Jesse
 */
public class RequestType {
    
    int requestTypeID;
    String requestType;

    public int getRequestTypeID() {
        return requestTypeID;
    }

    public void setRequestTypeID(int requestTypeID) {
        this.requestTypeID = requestTypeID;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 43 * hash + this.requestTypeID;
        hash = 43 * hash + Objects.hashCode(this.requestType);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final RequestType other = (RequestType) obj;
        if (this.requestTypeID != other.requestTypeID) {
            return false;
        }
        if (!Objects.equals(this.requestType, other.requestType)) {
            return false;
        }
        return true;
    }
    
    
}
