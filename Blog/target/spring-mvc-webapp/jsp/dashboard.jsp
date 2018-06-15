<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>




<html class="index-html" lang="en">

    <head>

        <title>Dashboard</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap 3 core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" id="bootstrap-css">

        <!-- Tags CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/tags/bootstrap-tagsinput.css">

        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Main CSS --> 
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bp.css" rel="stylesheet">
    </head>

    <body>
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NAV BAR--> 
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="https://lh3.googleusercontent.com/-N4NB2F966TU/WM7V1KYusRI/AAAAAAAADtA/fPvGVNzOkCo7ZMqLI6pPITE9ZF7NONmawCJoC/w185-h40-p-rw/logo.png"></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown">Pages<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <c:forEach var="currentPage" items="${pages}">
                                    <li><a href="${pageContext.request.contextPath}/page?pageID=${currentPage.staticID}">${currentPage.title}</a></li>  
                                </c:forEach>
                                
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <form class="navbar-form navbar-left" method="GET" action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search" name="post-search">
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default" id="search-posts-btn">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </div>
                            </div>

                        </form>


                        <c:choose>
                            <c:when test="${pageContext.request.userPrincipal.name != null}">

                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Welcome, ${pageContext.request.userPrincipal.name}<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="${pageContext.request.contextPath}/dashboard">Go to Dashboard</a></li>
                                        <li><a href="${pageContext.request.contextPath}/viewUserDetails">View Account Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/createPost">Create Post</a></li>
                                    </ul>
                                </li>
                                <li role="presentation"><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                                </c:when>
                                <c:otherwise>
                                <li><a href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                </c:otherwise>
                            </c:choose>

                    </ul>
                </div>
            </div>
        </nav>
        <br>

        <sec:authorize access="hasRole('ROLE_ADMIN')">

        </sec:authorize>
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NAV END -->
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SIDE BAR -->
        <!--        <div class="container">
                    <div class="w3-card col-md-2" role="navigation">
                        <div class="sidebar-nav navbar-collapse" data-spy="affix" data-offset-top="205">
                            <ul class="nav" id="side-menu">
                                <li class="sidebar-search">
                                    <br>
                                    <div class="input-group custom-search-form">
                                        <input type="text" class="form-control" placeholder="Search...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </span>
                                    </div>
                                     /input-group 
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/viewUserDetails"><i class="fa fa-dashboard fa-fw"></i>View Account Details</a>
                                </li>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-edit fa-fw"></i>Manage Posts<span class="fa arrow"></span></a>  
                                    <ul class="dropdown-menu">                         
                                        <li><a href="${pageContext.request.contextPath}/createPost">Create Post</a></li>                           
                                    </ul>
                                     /.nav-second-level 
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-users fa-fw"> </i> Manage Users<span class="fa arrow"></span></a>                           
                                     /.nav-second-level 
                                </li>                  
                                <li>
                                    <a href="#"><i class="fa fa-files-o fa-fw"></i>Manage Pages<span class="fa arrow"></span></a>
        
                                     /.nav-second-level 
                                </li>
                            </ul>
                        </div>
                    </div>
                    <br>-->

        <div class="container">
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PUBLISHED POSTS        -->  
            <div class="col-lg-4">
                <div class="w3-card panel-default" id="pblogAccordion">

                    <sec:authorize ifAllGranted="ROLE_USER" ifNotGranted="ROLE_ADMIN">
                        <div class="panel-heading">
                            <i class="glyphicon glyphicon-edit fa-fw"></i> Blogs
                        </div>
                    </sec:authorize>
                    <sec:authorize ifAllGranted="ROLE_ADMIN">
                        <form id="getpostform" 
                              method="POST"
                              action="filterPosts"
                              class="form-horizontal"
                              >
                            <div class="panel-heading">
                                <div class="form-group">
                                    <i class="glyphicon glyphicon-edit fa-fw"></i> Blogs
                                    <select name="postSelect" id="postSelect" class="">
                                        <option <c:if test="${filter == 'personal'}">selected</c:if> value="personal">Personal</option>
                                        <option <c:if test="${filter == 'published'}">selected</c:if> value="published">Published</option>
                                        <option <c:if test="${filter == 'unapproved'}">selected</c:if> value="unapproved">Unapproved</option>
                                        <option <c:if test="${filter == 'edit'}">selected</c:if> value="edit">Request: Edit</option>
                                        <option <c:if test="${filter == 'delete'}">selected</c:if> value="delete">Request: Delete</option>
                                        <option <c:if test="${filter == 'expired'}">selected</c:if> value="expired">Expired</option>
                                        <option <c:if test="${filter == 'upcoming'}">selected</c:if> value="upcoming">Upcoming</option>
                                        </select>

                                        <input type="submit" class ="btn btn-default" value="Filter"/> 
                                    </div>


                                </div>
                            </form>
                    </sec:authorize>
                    <!-- /.panel-heading -->
                    <div class="panel-body">  
                        <c:forEach var="blog" items="${blogs}">
                            <div class="card">
                                <div class="card-header" id="pblogHeading${blog.blogID}">
                                    <h5 class="mb-0">
                                        <a class="list-group-item collapsed" data-toggle="collapse" data-target="#collapsepBlog${blog.blogID}" aria-expanded="true" aria-controls="collapsepBlog${blog.blogID}">
                                            ${blog.title}
                                        </a>
                                    </h5>
                                </div>

                                <div id="collapsepBlog${blog.blogID}" class="collapse" aria-labelledby="pblogHeading${blog.blogID}" data-parent="#pblogAccordion">
                                    <div class="card-body"> 
                                        <a href="${pageContext.request.contextPath}/post?postID=${blog.blogID}" class="btn btn-danger">View Blog</a>
                                        <c:if test="${filter == 'edit'}">
                                            <a href="${pageContext.request.contextPath}/viewEditRequest?postID=${blog.blogID}" class="btn btn-primary">View Edit</a>
                                        </c:if>
                                        <c:if test="${filter != 'edit' && filter !='delete'}">
                                            <a href="${pageContext.request.contextPath}/displayEditPost?postID=${blog.blogID}" class="btn btn-danger">Edit</a>  
                                            <a href="${pageContext.request.contextPath}/deletePost?postID=${blog.blogID}" class="btn btn-danger">Delete</a>
                                        </c:if>                                        
                                        <c:if test="${filter == 'unapproved'}">
                                            <a href="${pageContext.request.contextPath}/approvePost?postID=${blog.blogID}" class="btn btn-primary">Approve Post</a>
                                        </c:if>
                                        <c:if test="${filter == 'edit'}">
                                            <a href="${pageContext.request.contextPath}/approveEdit?postID=${blog.blogID}" class="btn btn-primary">Approve Edit</a>
                                        </c:if> 
                                        <c:if test="${filter == 'delete'}">
                                            <a href="${pageContext.request.contextPath}/approveDelete?postID=${blog.blogID}" class="btn btn-primary">Approve Delete</a>
                                        </c:if>
                                        <c:if test="${filter == 'edit' || filter == 'delete'}">
                                            <a href="${pageContext.request.contextPath}/denyRequest?postID=${blog.blogID}" class="btn btn-primary">Deny Request</a>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </c:forEach>
                    </div>

                    <!-- /.list-group -->


                    <a href="${pageContext.request.contextPath}/createPost" class="btn btn-default btn-block">Add New Blog Post</a>

                </div>
                <!-- /.panel-body -->
            </div>

            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~STATIC PAGES         -->  
                <div class="col-lg-4">
                    <div class="w3-card panel-default" id="pageAccordion">
                        <div class="panel-heading">
                            <i class="fa fa-files-o fa-fw"></i> Static Pages
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">  
                            <c:forEach var="currentPage" items="${pages}">
                                <div class="card">
                                    <div class="card-header" id="pageHeading${currentPage.staticID}">
                                        <h5 class="mb-0">
                                            <a class="list-group-item collapsed" data-toggle="collapse" data-target="#collapsePage${currentPage.staticID}" aria-expanded="true" aria-controls="collapsePage${currentPage.staticID}">
                                                ${currentPage.title}
                                            </a>
                                        </h5>
                                    </div>

                                    <div id="collapsePage${currentPage.staticID}" class="collapse" aria-labelledby="pageHeading${currentPage.staticID}" data-parent="#pageAccordion">
                                        <div class="card-body"> 
                                            <a href="${pageContext.request.contextPath}/page?pageID=${currentPage.staticID}" class="btn btn-danger">View</a>
                                            <a href="${pageContext.request.contextPath}/displayEditPage?pageID=${currentPage.staticID}" class="btn btn-danger">Edit</a>  
                                            <a href="${pageContext.request.contextPath}/deletePage?pageID=${currentPage.staticID}" class="btn btn-danger">Delete</a>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                        </div>

                        <!-- /.list-group -->
                        <a href="${pageContext.request.contextPath}/displayCreatePage" class="btn btn-default btn-block">Add New Static Page</a>
                    </div>
                    <!-- /.panel-body -->
                </div>

                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~CATEGORIES         -->    

                <div class="col-lg-4">
                    <div class="w3-card panel-default" id="categoryAccordion">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Categories
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">  
                            <c:forEach var="currentCategory" items="${categories}">
                                <div class="card">
                                    <div class="card-header" id="catHeading${currentCategory.categoryID}">
                                        <h5 class="mb-0">
                                            <a class="list-group-item collapsed" data-toggle="collapse" data-target="#collapseCat${currentCategory.categoryID}" aria-expanded="true" aria-controls="collapseCat${currentCategory.categoryID}">
                                                ${currentCategory.name}
                                            </a>
                                        </h5>
                                    </div>

                                    <div id="collapseCat${currentCategory.categoryID}" class="collapse" aria-labelledby="catHeading${currentCategory.categoryID}" data-parent="#categoryAccordion">
                                        <div class="card-body"> 
                                            <div id="collapseCatEdit${currentCategory.categoryID}" class="collapse" aria-labelledby="catHeading${currentCategory.categoryID}" data-parent="#categoryAccordion">
                                                <form
                                                    method="POST"
                                                    action="editCategory"> 
                                                    <input name="catID" value="${currentCategory.categoryID}" hidden>
                                                    <div class="form-group">
                                                        <label for="dashboard-catName${currentCategory.categoryID}">Category Name:</label>
                                                        <input type="text" 
                                                               class="form-control"
                                                               placeholder="${currentCategory.name}"
                                                               maxlength="50"
                                                               required
                                                               id="dashboard-catName${currentCategory.categoryID}"
                                                               name="dashboard-catName${currentCategory.categoryID}">
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="dashboard-catDesc${currentCategory.categoryID}">Description:</label>
                                                        <input type="text" 
                                                               class="form-control"
                                                               placeholder="${currentCategory.desc}"
                                                               maxlength="50"
                                                               id="dashboard-catDesc${currentCategory.categoryID}"
                                                               name="dashboard-catDesc${currentCategory.categoryID}">
                                                    </div> 

                                                    <div class="form-group">
                                                        <input type="submit" class ="btn btn-default" value="Confirm Edit"/>
                                                    </div>

                                                </form>

                                            </div>

                                            <a data-toggle="collapse" data-target="#collapseCatEdit${currentCategory.categoryID}" aria-expanded="true" aria-controls="collapseCatEdit${currentCategory.categoryID}" class="btn btn-primary">Edit</a>   
                                            <a href="${pageContext.request.contextPath}/deleteCategory?categoryID=${currentCategory.categoryID}" class="btn btn-danger">Delete</a>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                        </div>

                        <div id="collapseCatAdd" class="collapse" aria-labelledby="catHeading" data-parent="#categoryAccordion">
                            <form
                                method="POST"
                                action="addCategory">  
                                <div class="form-group">
                                    <label for="dashboard-catNameAdd">Category Name:</label>
                                    <input type="text" 
                                           class="form-control"
                                           placeholder="Name"
                                           maxlength="50"
                                           required
                                           id="dashboard-catNameAdd"
                                           name="dashboard-catNameAdd">
                                </div>

                                <div class="form-group">
                                    <label for="dashboard-catDescAdd">Description:</label>
                                    <input type="text" 
                                           class="form-control"
                                           placeholder="Description"
                                           maxlength="50"
                                           id="dashboard-catDescAdd"
                                           name="dashboard-catDescAdd">
                                </div> 

                                <div class="form-group">
                                    <input type="submit" class ="btn btn-default" value="Add Category"/>
                                </div>

                            </form>

                        </div>
                        <!-- /.list-group -->
                        <a data-toggle="collapse" data-target="#collapseCatAdd" aria-expanded="true" aria-controls="collapseCatAdd" class="btn btn-default btn-block">Add New Category</a>
                    </div>
                    <!-- /.panel-body -->
                </div> 

                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~USER MANAGEMENT PANEL -->           
                <div class="col-lg-4">
                    <div class="w3-card panel-default" id="userAccordion">
                        <div class="panel-heading">
                            <i class="fa fa-users fa-fw"> </i> User Management
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">  
                            <c:forEach var="currentUser" items="${users}">
                                <div class="card">
                                    <div class="card-header" id="userHeading${currentUser.userID}">
                                        <h5 class="mb-0">
                                            <a class="list-group-item collapsed" data-toggle="collapse" data-target="#collapseUsr${currentUser.userID}" aria-expanded="true" aria-controls="collapseUsr${currentUser.userID}">
                                                ${currentUser.userName}
                                            </a>
                                        </h5>
                                    </div>

                                    <div id="collapseUsr${currentUser.userID}" class="collapse" aria-labelledby="userHeading${currentUser.userID}" data-parent="#userAccordion">
                                        <div class="card-body">
                                            <c:set var="testRoles" value="${currentUser.roles}"/>
                                            <c:set var="role" value="${roleVerification}"/>
                                            <spring:eval var="containsValue" expression="testRoles.contains(role)" />
                                            <c:choose>
                                                <c:when test="${containsValue}">
                                                    <a href="${pageContext.request.contextPath}/demoteUser?userID=${currentUser.userID}" class="btn btn-danger">Demote</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${pageContext.request.contextPath}/promoteUser?userID=${currentUser.userID}" class="btn btn-primary">Promote</a>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test = "${currentUser.enabled == true}">
                                                    <a href="${pageContext.request.contextPath}/disableUser?userID=${currentUser.userID}" class="btn btn-danger">Disable</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${pageContext.request.contextPath}/enableUser?userID=${currentUser.userID}" class="btn btn-primary">Enable</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                        <!-- /.list-group -->
                        <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                    </div>
                    <!-- /.panel-body -->
                </div> 
            </sec:authorize>


        </div>

        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FOOTER-->
        <footer class="container-fluid text-center main-footer">
            <p>	&copy; codeKages </p>
        </footer>         
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap 3 scripts -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Tags scripts -->
        <script src="${pageContext.request.contextPath}/tags/bootstrap-tagsinput.min.js"></script>
        <!-- Personal Scripts -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>

    </body>
</html>