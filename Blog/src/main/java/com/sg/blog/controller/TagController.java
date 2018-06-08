/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.service.TagService;
import javax.inject.Inject;

/**
 *
 * @author chxxch
 */
public class TagController {
    
    TagService tagService;
    
    @Inject
    public TagController(TagService tagService) {
        this.tagService = tagService;
    }
}
