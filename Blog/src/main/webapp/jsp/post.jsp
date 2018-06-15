<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="index-html" lang="en">

    <head>
        <title>View Post</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap 3 core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" id="bootstrap-css">
        <!-- Tags CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/tags/bootstrap-tagsinput.css">
        <!-- Main CSS -->  
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bp.css" rel="stylesheet">
        <style>
            #tagcloud a {
                text-decoration: none;
                color: white;
                display: inline-block;
                padding: 5px;
                margin: 0 7px 7px 0;
                border-radius: 5px;
            }

            sup {
                padding-left: 2px;
            }
        </style>

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

        <%--<sec:authorize access="hasRole('ROLE_USER')">--%>

        <%--</sec:authorize>--%>

        <%--<jsp:include page="navbar.jsp"/>--%>
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
                    <p>Posted on ${post.publishDate} in <a href="${pageContext.request.contextPath}/?category-search=${post.category.categoryID}">${post.category.name}</a></p>

                    <hr>

                    <!-- Preview Image -->
                    <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">

                    <hr>

                    <!-- Post Content -->
                    ${post.content}

                    <div>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <c:if test="${post.isApproved == false}">
                                <a href="${pageContext.request.contextPath}/approvePost?postID=${post.blogID}" class="btn btn-primary">
                                    Approve Post
                                </a>
                            </c:if>    
                        </sec:authorize>
                    </div>


                </div>
            </div>
            <br>
            <div id="tagcloud">
                <c:forEach var="tag" items="${post.tags}">
                    <c:set var="rand"><%= (int) (Math.random() * 16)%></c:set>
                    <a href="#" rel='${rand}'><span>${tag.name}<sup></sup></span></a>
                            </c:forEach>

            </div>


            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <c:if test="${postType == 'request'}">
                    <a href="${pageContext.request.contextPath}/approveEdit?postID=${post.blogID}" class="btn btn-primary">Approve Edit</a>
                </c:if>
            </sec:authorize> 

        </div>



        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FOOTER-->
        <footer class="container-fluid text-center main-footer">
            <p>	&copy; codeKages </p>
        </footer>

        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap 3 scripts -->
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Tags scripts -->
        <script src="${pageContext.request.contextPath}/tags/bootstrap-tagsinput.min.js"></script>

        <script src="${pageContext.request.contextPath}/tags/tagcloud.js"></script>
        <!-- Personal Scripts -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script> 
        <script>
            $("#tagcloud a").tagcloud();
        </script>

    </body>
</html>
