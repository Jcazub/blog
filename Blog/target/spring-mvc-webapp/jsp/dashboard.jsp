<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/assets/css/material-dashboard.css">
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap 4 core CSS -->
        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">-->
        <!-- Bootstrap 3 core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Main CSS -->        
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet"> 
    </head>
    <body>       
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NAV BAR--> 
        <jsp:include page="navbar.jsp"/> 
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TOP NAV END -->
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SIDE BAR -->                
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
        <div class="col-md-6">
            <div class="w3-card panel-default">
                <div class="panel-heading">
                    <i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
                </div>
                <!-- /.panel-heading -->
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
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>

            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NOTIFICATION PANEL -->           
            <div class="col-lg-4">
                <div class="w3-card panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i> Notifications Panel
                    </div>
                    <!-- /.panel-heading -->
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
                        <!-- /.list-group -->
                        <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>          
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~CATEGORIES         -->         
            <div class="col-md-2">
                <div class="panel-body">
                    <div class="w3-card panel-group" id="categoryAccordion">
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
                <div class="w3-card panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i> User Management
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <c:forEach var="currentBlog" items="${posts}" >
                            <div class="post-preview">
                                <a href="${pageContext.request.contextPath}/post?postID=${currentBlog.blogID}">
                                    <h2 class="post-title">
                                        ${currentBlog.title}
                                    </h2>                             
                                </a>
                                <p class="post-meta">Posted by
                                    <a href="#">${currentBlog.user.userName}</a>
                                    on ${currentBlog.publishDate}</p>
                                <p class="post-content">
                                    ${currentBlog.content}
                                </p>                          
<!--                            <span><c:forEach var="currentTag" items="${currentBlog.tags}"></span>
                                <span class="label label-primary">${currentTag.name} </c:forEach></span>
                                <br>-->
                                </div>
                                <hr>
                        </c:forEach>
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
                        <!-- /.list-group -->
                        <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>          
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FOOTER             -->       
            <footer class="container-fluid text-center main-footer">
                <p>&copy;codeKages </p>
            </footer>           
            <!--   Core JS Files   -->
            <script src="/assets/js/core/jquery.min.js"></script>
            <script src="/assets/js/core/popper.min.js"></script>
            <script src="/assets/js/bootstrap-material-design.js"></script>
            <!-- Placed at the end of the document so the pages load faster -->
            <!-- Bootstrap 3 scripts -->


            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <!-- Bootstrap 4 scripts -->
            <!--        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>-->
            <!-- Personal Scripts -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        </body>
    </html>


