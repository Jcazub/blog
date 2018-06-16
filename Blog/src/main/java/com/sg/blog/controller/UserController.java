/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blog.controller;

import com.sg.blog.dao.UserDao;
import com.sg.blog.model.Blog;
import com.sg.blog.model.Request;
import com.sg.blog.model.Role;
import com.sg.blog.model.User;
import com.sg.blog.service.BlogService;
import com.sg.blog.service.CategoryService;
import com.sg.blog.service.RequestService;
import com.sg.blog.service.RoleService;
import com.sg.blog.service.StaticPageService;
import com.sg.blog.service.TagService;
import com.sg.blog.service.UserService;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author chxxch
 */
@Controller
public class UserController {

    private UserDao userDao;
    private UserService userService;
    private CategoryService categoryService;
    private TagService tagService;
    private RequestService requestService;
    private RoleService roleService;
    private StaticPageService staticPageService;
    private BlogService blogService;

    @Inject
    public UserController(UserService userService, CategoryService categoryService, TagService tagService, RequestService requestService, RoleService roleService, StaticPageService staticPageService, BlogService blogService) {
        this.userService = userService;
        this.categoryService = categoryService;
        this.tagService = tagService;
        this.requestService = requestService;
        this.roleService = roleService;
        this.staticPageService = staticPageService;
        this.blogService = blogService;
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String displayDashboard(HttpServletRequest request, Model model, Principal principal) {

        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("tags", tagService.getAllTags());
        model.addAttribute("requests", requestService.getAllRequests());
        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("pages", staticPageService.getAllStaticPages());
        List<Blog> allPosts = blogService.getAllBlogs();
        List<Request> allRequests = requestService.getAllRequests();
        User user = userService.getUserByUserName(principal.getName());

        String filter = request.getParameter("filter");

        if (filter == null || "".equals(filter) || "personal".equals(filter)) {
            List<Blog> personalBlogs = allPosts.stream()
                    .filter(b -> b.getUser().getUserID() == user.getUserID())
                    .collect(Collectors.toList());
            model.addAttribute("blogs", personalBlogs);
        } else if ("published".equals(filter)) {
            List<Blog> publishedBlogs = allPosts.stream()
                    .filter(b -> (LocalDate.now().isEqual(b.getPublishDate()) || LocalDate.now().isAfter(b.getPublishDate())) && LocalDate.now().isBefore(b.getExpirationDate()) && b.getIsApproved() == true)
                    .collect(Collectors.toList());
            model.addAttribute("blogs", publishedBlogs);
        } else if ("unapproved".equals(filter)) {
            List<Blog> unapprovedBlogs = allPosts.stream()
                    .filter(b -> b.getIsApproved() == false)
                    .collect(Collectors.toList());
            model.addAttribute("blogs", unapprovedBlogs);
        } else if ("edit".equals(filter)) {
            List<Request> editRequests = allRequests.stream()
                    .filter(r -> (r.getRequestType().getRequestType().equals("edit")))
                    .collect(Collectors.toList());
            model.addAttribute("blogs", editRequests);
        } else if ("delete".equals(filter)) {
            List<Request> deleteRequests = allRequests.stream()
                    .filter(r -> (r.getRequestType().getRequestType().equals("delete")))
                    .collect(Collectors.toList());
            model.addAttribute("blogs", deleteRequests);
        } else if ("expired".equals(filter)) {
            List<Blog> expiredBlogs = allPosts.stream()
                    .filter(b -> LocalDate.now().isAfter(b.getExpirationDate()) && b.getIsApproved() == true)
                    .collect(Collectors.toList());
            model.addAttribute("blogs", expiredBlogs);
        } else if ("upcoming".equals(filter)) {
            List<Blog> upcomingBlogs = allPosts.stream()
                    .filter(b -> LocalDate.now().isBefore(b.getPublishDate()) && LocalDate.now().isBefore(b.getExpirationDate()) && b.getIsApproved() == true)
                    .collect(Collectors.toList());
            model.addAttribute("blogs", upcomingBlogs);
        }

        model.addAttribute("filter", filter);

        model.addAttribute("roleVerification", roleService.getRoleByName("ROLE_ADMIN"));
        return "dashboard";
    }

    @RequestMapping(value = "/viewUserDetails", method = RequestMethod.GET)
    public String viewUserDetails(Model model, Principal principal) {
        model.addAttribute("pages", staticPageService.getAllStaticPages());
        model.addAttribute("User", userService.getUserByUserName(principal.getName()));
        return "viewUserDetails";
    }

    @RequestMapping(value = "viewEditUserDetails", method = RequestMethod.GET)
    public String viewEditUserDetails(Model model, Principal principal) {
        model.addAttribute("User", userService.getUserByUserName(principal.getName()));
        return "viewEditUserDetails";
    }

    @RequestMapping(value = "editUser", method = RequestMethod.POST)
    public String editUser(HttpServletRequest request) {

        User u = userService.getUserByID(Integer.parseInt(request.getParameter("userID")));

        String firstname = request.getParameter("firstname");
        if (firstname != null || !"".equals(firstname)) {
            u.setFirstName(firstname);
        }

        String lastname = request.getParameter("lastname");
        if (lastname != null || !"".equals(lastname)) {
            u.setLastName(lastname);
        }

        String username = request.getParameter("username");
        if (username != null || !"".equals(username)) {
            u.setUserName(username);
        }

        String email = request.getParameter("email");
        if (email != null || !"".equals(email)) {
            u.setEmail(email);
        }

        String password = request.getParameter("password");
        if (password != null || !"".equals(password)) {
            u.setPassword(password);
        }

//        u.setEnabled(true);
//        List<Role> roles = new ArrayList<>();
//        Role r = roleService.getRoleByName("ROLE_USER");
//        roles.add(r);
//        
//        u.setRoles(roles);
        userService.editUser(u);

        //resets principal
        Collection<SimpleGrantedAuthority> nowAuthorities = (Collection<SimpleGrantedAuthority>) SecurityContextHolder
                .getContext().getAuthentication().getAuthorities();
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(u.getUserName(), u.getPassword(), nowAuthorities);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return "redirect:/viewUserDetails";
    }

    @RequestMapping(value = "deleteUser", method = RequestMethod.GET)
    public String deleteUser(HttpServletRequest request, Principal principal) {
        User user = userService.getUserByUserName(principal.getName());
        userService.deleteUser(user.getUserID());

        //log user out of current session
        HttpSession session = request.getSession(false);
        SecurityContextHolder.clearContext();
        if (session != null) {
            session.invalidate();
        }

        return "redirect:/";
    }

    @RequestMapping(value = "promoteUser", method = RequestMethod.GET)
    public String promoteUser(HttpServletRequest request, Model model) {
        User user = userService.getUserByID(Integer.parseInt(request.getParameter("userID")));
        List<Role> newRoles = new ArrayList<>();
        newRoles.add(roleService.getRoleByName("ROLE_ADMIN"));
        newRoles.add(roleService.getRoleByName("ROLE_USER"));
        user.setRoles(newRoles);
        userService.editUser(user);
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "demoteUser", method = RequestMethod.GET)
    public String demoteUser(HttpServletRequest request, Model model) {
        User user = userService.getUserByID(Integer.parseInt(request.getParameter("userID")));
        List<Role> newRoles = new ArrayList<>();
        newRoles.add(roleService.getRoleByName("ROLE_USER"));
        user.setRoles(newRoles);
        userService.editUser(user);
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "enableUser", method = RequestMethod.GET)
    public String enableUser(HttpServletRequest request, Model model) {
        User user = userService.getUserByID(Integer.parseInt(request.getParameter("userID")));
        user.setEnabled(true);
        userService.editUser(user);
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "disableUser", method = RequestMethod.GET)
    public String disableUser(HttpServletRequest request, Model model) {
        User user = userService.getUserByID(Integer.parseInt(request.getParameter("userID")));
        user.setEnabled(false);
        userService.editUser(user);
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "filterPosts", method = RequestMethod.POST)
    public String filterPosts(HttpServletRequest request) {
        String filter = request.getParameter("postSelect");
        return "redirect:/dashboard?filter=" + filter;
    }

}
