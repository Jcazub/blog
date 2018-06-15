/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.model.Blog;
import com.sg.blog.model.Request;
import com.sg.blog.model.SearchTerm;
import com.sg.blog.model.Tag;
import com.sg.blog.model.User;
import com.sg.blog.service.BlogService;
import com.sg.blog.service.CategoryService;
import com.sg.blog.service.RequestService;
import com.sg.blog.service.StaticPageService;
import com.sg.blog.service.TagService;
import com.sg.blog.service.UserService;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
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

    private BlogService blogService;
    private CategoryService categoryService;
    private TagService tagService;
    private UserService userService;
    private RequestService requestService;
    private StaticPageService staticPageService;

    @Inject
    public PostController(BlogService blogService, CategoryService categoryService, TagService tagService, 
            UserService userService, RequestService requestService, StaticPageService staticPageService) {
        this.blogService = blogService;
        this.categoryService = categoryService;
        this.tagService = tagService;
        this.userService = userService;
        this.requestService = requestService;
        this.staticPageService = staticPageService;
    }

    @RequestMapping(value = "/createPost", method = RequestMethod.GET)
    public String createPost(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("pages", staticPageService.getAllStaticPages());
        return "createPost";
    }

    @RequestMapping(value = "/addPost", method = RequestMethod.POST)
    public String addPost(HttpServletRequest request, Principal principal) {

        Blog b = new Blog();
        b.setCreationDate(LocalDate.now());
        //b.setPublishDate(LocalDate.now());
        b.setApprovedDate(LocalDate.parse("2199-01-01"));
        b.setIsApproved(true);

        //get user
        User user = userService.getUserByUserName(principal.getName());
        b.setUser(user);

        //pulled from page
        b.setTitle(request.getParameter("title"));
        b.setContent(request.getParameter("content"));
        b.setPublishDate(LocalDate.parse(request.getParameter("publishDate")));
        b.setExpirationDate(LocalDate.parse(request.getParameter("expirationDate")));

        //get category
        b.setCategory(categoryService.getCategoryByID(Integer.parseInt(request.getParameter("categorySelect"))));

        //get and/or create tag
        List<Tag> tags = new ArrayList();
        String[] tagsFromPage = request.getParameterValues("tagsSelect");

        for (String currentTag : tagsFromPage) {
            if (tagService.getTagByName(currentTag) == null) {
                Tag t = new Tag();
                t.setName(currentTag);
                tagService.addTag(t);
                tags.add(t);
            } else {
                tags.add(tagService.getTagByName(currentTag));
            }
        }

        b.setTags(tags);

        blogService.addBlog(b);

        return "redirect:/";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String displayPost(HttpServletRequest request, Model model) {
        
        String postType = request.getParameter("postType");
        
        if (postType != null && "request".equals(postType)) {
            model.addAttribute("post", requestService.getRequestByRequestID(Integer.parseInt(request.getParameter("postID"))));
        } else {
            model.addAttribute("post", blogService.getBlogByBlogID(Integer.parseInt(request.getParameter("postID"))));
        }
  
        model.addAttribute("postType", postType);
        model.addAttribute("pages", staticPageService.getAllStaticPages());

        return "post";
    }

    @RequestMapping(value = "/displayEditPost", method = RequestMethod.GET)
    public String displayEditPost(HttpServletRequest request, Model model) {
        Integer i = Integer.parseInt(request.getParameter("postID"));
        model.addAttribute("post", blogService.getBlogByBlogID(i));
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("pages", staticPageService.getAllStaticPages());
        return "editPost";
    }

    @RequestMapping(value = "/editPost", method = RequestMethod.POST)
    public String editPost(HttpServletRequest request, Model model) {
        Blog b = blogService.getBlogByBlogID(Integer.parseInt(request.getParameter("postID")));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (title != null && !"".equals(title)) {
            b.setTitle(title);
        }

        if (content != null && !"".equals(content)) {
            b.setContent(content);
        }

        b.setPublishDate(LocalDate.parse(request.getParameter("publishDate")));
        b.setExpirationDate(LocalDate.parse(request.getParameter("expirationDate")));

        b.setCategory(categoryService.getCategoryByID(Integer.parseInt(request.getParameter("categorySelect"))));

        List<Tag> tags = new ArrayList();
        String[] tagsFromPage = request.getParameterValues("tagsSelect");

        //check to make sure tags were added
        if (tagsFromPage != null && tagsFromPage.length > 0) {
            for (String currentTag : tagsFromPage) {
                if (tagService.getTagByName(currentTag) == null) {
                    Tag t = new Tag();
                    t.setName(currentTag);
                    tagService.addTag(t);
                    tags.add(t);
                } else {
                    tags.add(tagService.getTagByName(currentTag));
                }
            }
        }

        b.setTags(tags);

        blogService.editBlog(b);

        return "redirect:/";
    }

    @RequestMapping(value = "/deletePost", method = RequestMethod.GET)
    public String deletePost(HttpServletRequest request) {
        blogService.deleteBlog(Integer.parseInt(request.getParameter("postID")));
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "/search/posts", method = RequestMethod.POST)
    @ResponseBody
    public List<Blog> searchPosts(@RequestBody Map<String, String> searchMap) {

        Map<SearchTerm, String> criteriaMap = new HashMap<>();

        String currentTerm = searchMap.get("title");
        
        if (currentTerm != null && !currentTerm.isEmpty()) {
            criteriaMap.put(SearchTerm.TITLE, currentTerm);
        }
        
        currentTerm = searchMap.get("content");
        
        

        List<Blog> tempBlogs = blogService.searchBlogs(criteriaMap);

        return tempBlogs.stream()
                .filter(b -> (LocalDate.now().isEqual(b.getPublishDate()) || LocalDate.now().isAfter(b.getPublishDate())) && LocalDate.now().isBefore(b.getExpirationDate()) && b.getIsApproved() == true)
                .collect(Collectors.toList());
    }

    @RequestMapping(value = "/approvePost", method = RequestMethod.GET)
    public String approvePost(HttpServletRequest request) {
        Blog b = blogService.getBlogByBlogID(Integer.parseInt(request.getParameter("postID")));

        b.setApprovedDate(LocalDate.now());
        b.setIsApproved(true);

        blogService.editBlog(b);

        return "redirect:/dashboard";
    }
    
    @RequestMapping(value = "/approveEdit", method = RequestMethod.GET)
    public String approveEdit(HttpServletRequest request) {
        
        Blog b = requestService.getRequestByRequestID(Integer.parseInt(request.getParameter("postID")));
        
        blogService.editBlog(b);
        
        requestService.deleteRequest(b.getBlogID());
        
        return "redirect:/dashboard";
    }
    
    @RequestMapping(value = "/approveDelete", method = RequestMethod.GET)
    public String approveDelete(HttpServletRequest request) {
        
        Blog b = requestService.getRequestByRequestID(Integer.parseInt(request.getParameter("postID")));
        
        blogService.deleteBlog(b.getBlogID());
        
        requestService.deleteRequest(b.getBlogID());
        
        return "redirect:/dashboard";
    }
    
    @RequestMapping(value = "/denyRequest", method = RequestMethod.GET)
    public String denyRequest(HttpServletRequest request, Model model) {
        
        requestService.deleteRequest(Integer.parseInt(request.getParameter("postID")));
        
        return "redirect:/dashboard";
    }
    
    @RequestMapping(value = "/viewEditRequest", method = RequestMethod.GET)
    public String viewEditRequest(HttpServletRequest request) {
        
        String postID = request.getParameter("postID");
        String postType = "request";
        
        return "redirect:/post?postID=" + postID + "&postType=" + postType;
    }
}
