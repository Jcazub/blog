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

        <title>Bootstrap Example</title>
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
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Page 1-1</a></li>
                                <li><a href="#">Page 1-2</a></li>
                                <li><a href="#">Page 1-3</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <form class="navbar-form navbar-left">

                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search" id="post-search">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default" id="search-posts-btn">
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

        <sec:authorize access="hasRole('ROLE_USER')">

        </sec:authorize>
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NAV END -->
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SIDE BAR -->
        <div class="container">
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
                            <!-- /input-group -->
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
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-users fa-fw"> </i> Manage Users<span class="fa arrow"></span></a>                           
                            <!-- /.nav-second-level -->
                        </li>                  
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i>Manage Pages<span class="fa arrow"></span></a>

                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
            </div>
            <br>
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TIMELINE           -->          
            <!--        <div class="col-md-6">
                        <div class="w3-card panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
                            </div>
                             /.panel-heading 
                            <div class="panel-body">
                                <ul class="timeline">
                                    <li>
                                        <div class="timeline-badge"><i class="fa fa-check"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
            <c:forEach var="currentBlog" items="${posts}" >
                <div class="post-preview">
                    <a href="${pageContext.request.contextPath}/post?postID=${currentBlog.blogID}">
                        <h2 class="post-title">
                ${currentBlog.title}
            </h2>                             
        </a>
    </div>
    <div class="post-content">
        <p>${currentBlog.content}</p>                                     
            </c:forEach>
            <hr>
            <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-gear"></i> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a>
                    </li>
                    <li><a href="#">Another action</a>
                    </li>
                    <li><a href="#">Something else here</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</li>
<li class="timeline-inverted">
<div class="timeline-badge warning"><i class="fa fa-check"></i>
</div>
<div class="timeline-panel">
    <div class="timeline-heading">
        <h4 class="timeline-title">Lorem ipsum dolor</h4>
    </div>
    <div class="timeline-body">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem dolorem quibusdam, tenetur commodi provident cumque magni voluptatem libero, quis rerum. Fugiat esse debitis optio, tempore. Animi officiis alias, officia repellendus.</p>
        <hr>
        <div class="btn-group">
            <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-gear"></i> <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a>
                </li>
                <li><a href="#">Another action</a>
                </li>
                <li><a href="#">Something else here</a>
                </li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</li>                                                                

</ul>
</div>
/.panel-body 
</div>
/.panel 
</div>-->

            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NOTIFICATION PANEL -->           
            <!--        <div class="col-lg-4">
                        <div class="w3-card panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bell fa-fw"></i> Notifications Panel
                            </div>
                             /.panel-heading 
                            <div class="panel-body">
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-comment fa-fw"></i> New Comment
                                        <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                        </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                        </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                                        <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                        </span>
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-tasks fa-fw"></i> New Task
                                        <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                        </span>
                                    </a>
                                </div>
                                 /.list-group 
                                <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                            </div>
                             /.panel-body 
                        </div>
                    </div>          -->
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~CATEGORIES         --> 


            <div class="col-md-2">
                <div class="panel-body">
                    <div class="w3-card panel-group" >
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#categoryAccordion" href="#collapseOne">Category Management</a>
                                </h4>
                            </div>
                            <!-- .panel-heading -->
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <c:forEach var="currentCategory" items="${categories}" >
                                    <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">${currentCategory.name}</span>
        <!--                                <span>${currentCategory.desc}</span>-->
                                </c:forEach>                                       </div>
                        </div>
                    </div>                                                                      
                </div>
            </div>    

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
                                            <form> 
                                                <input name="catID" value="${currentCategory.categoryID}" hidden>
                                                <div class="form-group">
                                                    <label for="dashboard-catName${currentCategory.categoryID}">CategoryName:</label>
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
                                                
                                                
                                                
                                            </form>

                                        </div>

                                        <a data-toggle="collapse" data-target="#collapseCatEdit${currentCategory.categoryID}" aria-expanded="true" aria-controls="collapseCatEdit${currentCategory.categoryID}" class="btn btn-primary">Edit</a>   
                                        <a href="#" class="btn btn-danger">Delete</a>
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

            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TAGS               -->
            <div class="col-md-2">
                <div class="panel-body">
                    <div class="w3-card panel-group" id="tagAccordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#tagAccordion" href="#collapseTags">Tags</a>
                                </h4>
                            </div>                            
                            <!-- .panel-heading -->
                        </div>
                        <div id="collapseTags" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <c:forEach var="currentTag" items="${tags}" >
                                    <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">${currentTag.name}</span>
        <!--                                <span>${currentTag.name}</span>-->
                                </c:forEach> 
                            </div>
                        </div>                                                                                
                    </div>
                </div>               
            </div>

            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~USER MANAGEMENT PANEL -->           
            <div class="col-lg-4">
                <div class="w3-card panel-default" id="userAccordion">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i> User Management
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

                            <!--                        <a href="#" class="list-group-item">
                                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                                        <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                                        </span>
                                                    </a>-->
                        </c:forEach>
                    </div>
                    <!-- /.list-group -->
                    <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                </div>
                <!-- /.panel-body -->
            </div> 
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


