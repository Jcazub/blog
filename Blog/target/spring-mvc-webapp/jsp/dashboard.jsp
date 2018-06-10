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
        <div id="wrapper">
            <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NAV BAR--> 
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/">codeKages</a> 
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li role="presentation">
                            <li><a href="#">About</a>
                            </li>
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <li class="active" role="presentation">
                                    <a href="${pageContext.request.contextPath}/dashboard">
                                        Dashboard
                                    </a>
                                </li>
                            </sec:authorize>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <c:choose>
                                <c:when test="${pageContext.request.userPrincipal.name != null}">
                                    <li role="presentation"><a href="${pageContext.request.contextPath}/dashboard">Hello : ${pageContext.request.userPrincipal.name}</a>
                                    </li>
                                    <li><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                    <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                        <!-- top search -->
                        <form class="navbar-form navbar-right" action="#">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="search">
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>  
                    </div>
                </div>
                <br>
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TOP NAV END -->
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SIDE BAR -->                   
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
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
                                <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Manage Posts<span class="fa arrow"></span></a>                                                        
                            <li>
                                <a href="#"><i class="fa fa-wrench fa-fw"></i>Manage Users<span class="fa arrow"></span></a>                           
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-sitemap fa-fw"></i>Multi-Level Dropdown<span class="fa arrow"></span></a>

                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-files-o fa-fw"></i>Manage Pages<span class="fa arrow"></span></a>

                                <!-- /.nav-second-level -->
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>
            <div id="page-wrapper">
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TIMELINE -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
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
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                            <p><small class="text-muted"><i class="fa fa-clock-o"></i> 11 hours ago via Twitter</small></p>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero laboriosam dolor perspiciatis omnis exercitationem. Beatae, officia pariatur? Est cum veniam excepturi. Maiores praesentium, porro voluptas suscipit facere rem dicta, debitis.</p>
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
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  NOTIFICATION PANEL -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
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
                    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~CATEGORIES-->
                    <!--                <div class="row">-->
                    <div class="col-lg-6">
                        <div class="w3-card panel-default">
                            <div class="panel-heading">
                                Category Management
                            </div>
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="categoryAccordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#categoryAccordion" href="#collapseOne">Categories</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <c:forEach var="currentCategory" items="${categories}" >
                                                    <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">${currentCategory.name}</span>
                        <!--                                <span>${currentCategory.desc}</span>-->
                                                </c:forEach>                                       </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#categoryAccordion" href="#collapseTwo">Edit Categories</a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                Lorem ipsum dolor sit amet,
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#categoryAccordion" href="#collapseThree">Collapsible Group Item #3</a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                Lorem ipsum dolor sit amet,
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- .panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!--</div>-->
                    <!-- /.col-lg-12 -->
                    <!--                </div>-->
                    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TAGS-->
                    <!--                <div class="row">-->
                    <div class="col-lg-6">
                        <div class="w3-card panel-default">
                            <div class="panel-heading">
                                Tag Management
                            </div>
                            <!-- .panel-heading -->
                            <div class="panel-body">
                                <div class="panel-group" id="tagAccordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#tagAccordion" href="#collapseTags">Tags</a>
                                            </h4>
                                        </div>
                                        <div id="collapseTags" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <c:forEach var="currentTag" items="${tags}" >
                                                    <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">${currentTag.name}</span>
                        <!--                                <span>${currentTag.name}</span>-->
                                                </c:forEach>                                        </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#tagAccordion" href="#collapseTags2">Edit Tags</a>
                                            </h4>
                                        </div>
                                        <div id="collapseTags2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#tagAccordion" href="#collapseTags3">Collapsible Group Item #3</a>
                                            </h4>
                                        </div>
                                        <div id="collapseTags3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- .panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                    <!--                </div>-->
                    <!--                            <div class= "input-group">
                                                         <input type="text" class="col-md-5" placeholder="New Tag" name="search">
                                                         <div class="input-group-btn">
                                                             <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-tag"></i></button>
                                                         </div>-->

                    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~LEFT SIDE BAR--> 


                    <!--        <div class="container text-center">-->
                    <!--            <div class="row">
                    
                                    <div class="col-md-5 well">
                                        <div class="well">
                                            <p><a href="#">My Profile</a></p>
                                        </div>
                                        <div class="well">
                                            <p><a href="${pageContext.request.contextPath}/createPost">Create Post</a></p>
                                        </div>
                                        <div class="well">
                                            <p><a href="#">Create Page</a></p>
                                        </div>
                                    </div>
                                </div>
                    
                    -->
                    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FOOTER-->
                    <footer class="container-fluid text-center main-footer">
                        <p>&copy;codeKages </p>
                    </footer>
                </div>
            </div>
        </div>
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


