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
        </nav>
        <br>
        <!-- NAV END -->

        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~LEFT SIDE BAR--> 
        <div class="container text-center">
            <div class="row">

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

                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~CATEGORIES-->
                <div class="col-md-5"> 

                    <div class="w3-card w3-margin" >
                        <div class="w3-container w3-padding text-left">
                            <h4>Categories <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#categories"><span class="glyphicon glyphicon-folder-close"></span></button></h4>
                        </div>
                        <div id="categories" class="collapse">
                            <c:forEach var="currentCategory" items="${categories}" >
                                <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">${currentCategory.name}</span>
    <!--                                <span>${currentCategory.desc}</span>-->
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~TAGS-->

                <div class="col-md-5"> 

                    <div class="w3-card w3-margin">
                        <div class="w3-container w3-padding text-left" >
                            <h4><span>Tags <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#tags"><span class="glyphicon glyphicon-tag"></span></button></h4>

                            <div class= "input-group">
                                <input type="text" class="col-md-5" placeholder="New Tag" name="search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-tag"></i></button>
                                </div>

                                <div id="tags" class="collapse">
                                    <c:forEach var="currentTag" items="${tags}" >
                                        <span class="w3-tag w3-light-grey w3-small w3-margin-bottom">${currentTag.name}</span>
            <!--                                <span>${currentTag.name}</span>-->
                                    </c:forEach>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FOOTER-->
                    <footer class="container-fluid text-center main-footer">
                        <p>&copy;codeKages </p>
                    </footer>
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


