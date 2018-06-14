/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.dao.BlogDao;
import com.sg.blog.dao.CategoryDao;
import com.sg.blog.dao.TagDao;
import com.sg.blog.dao.UserDao;
import com.sg.blog.model.Blog;
import com.sg.blog.model.Category;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.Tag;
import com.sg.blog.model.User;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author chxxch
 */
@Controller
public class PostController {

    BlogDao blogDao;
    //temp maybe
    CategoryDao categoryDao;
    TagDao tagDao;
    UserDao userDao;

    @Inject
    public PostController(BlogDao blogDao, CategoryDao categoryDao, TagDao tagDao, UserDao userDao) {
        this.blogDao = blogDao;
        this.categoryDao = categoryDao;
        this.tagDao = tagDao;
        this.userDao = userDao;
    }

    @RequestMapping(value = "/createPost", method = RequestMethod.GET)
    public String createPost(Model model) {
        model.addAttribute("categories", categoryDao.getAllCategories());
        return "createPost";
    }

    @RequestMapping(value = "/addPost", method = RequestMethod.POST)
    public String addPost(HttpServletRequest request, Principal principal) {

        Blog b = new Blog();
        b.setCreationDate(LocalDate.now());
        //b.setPublishDate(LocalDate.now());
        b.setApprovedDate(LocalDate.now());
        b.setIsApproved(true);

        //get user
        User user = userDao.getUserByUserName(principal.getName());
        b.setUser(user);

        //pulled from page
        b.setTitle(request.getParameter("title"));
        b.setContent(request.getParameter("content"));
        b.setPublishDate(LocalDate.parse(request.getParameter("publishDate")));

        if (LocalDate.parse(request.getParameter("publishDate")) == LocalDate.now()) {
            //set expiration date WAYYY in the future
        } else {
            //set expiration date
        }

        //get category
        Category testCat = categoryDao.getCategoryByID(Integer.parseInt(request.getParameter("categorySelect")));
        b.setCategory(testCat);

        //get and/or create tag
        List<Tag> tags = new ArrayList();
        String[] tagsFromPage = request.getParameterValues("tagsSelect");

        for (String currentTag : tagsFromPage) {
            if (tagDao.getTagByName(currentTag) == null) {
                Tag t = new Tag();
                t.setName(currentTag);
                tagDao.addTag(t);
                tags.add(t);
            } else {
                tags.add(tagDao.getTagByName(currentTag));
            }
        }

        b.setTags(tags);

        blogDao.addBlog(b);

        return "redirect:/";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String displayPost(HttpServletRequest request, Model model) {
        Blog b = blogDao.getBlogByBlogID(Integer.parseInt(request.getParameter("postID")));

        model.addAttribute("post", b);

        return "post";
    }

    @RequestMapping(value = "/displayEditPost", method = RequestMethod.GET)
    public String displayEditPost(HttpServletRequest request, Model model) {
        return "";
    }

    @RequestMapping(value = "/editPost", method = RequestMethod.GET)
    public String editPost(HttpServletRequest request, Model model) {
        return "";
    }

    @RequestMapping(value = "/search/posts", method = RequestMethod.POST)
    @ResponseBody
    public List<Blog> searchPosts(@RequestBody Map<String, String> searchMap) {

        Map<SearchTerm, String> criteriaMap = new HashMap<>();

        String currentTerm = searchMap.get("title");
        if (currentTerm != null && !currentTerm.isEmpty()) {
            criteriaMap.put(SearchTerm.TITLE, currentTerm);
        }
        
        return blogDao.searchBlogs(criteriaMap);
    }
}
