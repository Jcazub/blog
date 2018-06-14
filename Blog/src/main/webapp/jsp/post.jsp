<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="index-html">
    <head>
        <title>Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap 4 core CSS -->
        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">-->
        <!-- Bootstrap 3 core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- Clean Blog CSS -->
        <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href="css/clean-blog/clean-blog.css" rel="stylesheet">
        <!-- Main CSS -->        
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet"> 
    </head>
    <body>

        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NAV BAR--> 
        <nav class="navbar navbar-inverse main-nav">
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
                        <li role="presentation"><a href="#">About</a>
                        </li>
                        <sec:authorize access="hasRole('ROLE_USER')">
                            <li role="presentation">
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
                                <li role="presentation"><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
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
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NAV END -->

        <!-- CONTENT ---------------->
        <div class="container">
            <div class="row">
            <div class="col-lg-8">

                <!-- Title -->
                <h1 class="mt-4">${post.title}</h1>

                <!-- Author -->
                <p class="lead">
                    by
                    <a href="#">${post.user.userName}</a>
                </p>

                <hr>

                <!-- Date/Time -->
                <p>Posted on ${post.publishDate} in <a href="#">${post.category.name}</a></p>

                <hr>

                <!-- Preview Image -->
                <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">

                <hr>

                <!-- Post Content -->
                ${post.content}

            </div>
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
        <!-- Bootstrap 4 scripts -->
        <!--        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>-->
        <!-- Personal Scripts -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </body>
</html>
