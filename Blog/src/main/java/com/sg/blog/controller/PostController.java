/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author chxxch
 */
@Controller
public class PostController {

    @RequestMapping(value = "/createPost", method = RequestMethod.GET)
    public String createPost() {
        return "post";
    }
}