<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="index-html" lang="en">

    <head>
        <!--TinyMCE SCRIPTS-->
        <script src='https://cloud.tinymce.com/stable/tinymce.min.js'></script>
        <script>
            tinymce.init({
                selector: '#texteditor'
            });
        </script>

        <title>Create a Post</title>
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

        <div class="container">
            <h1 class="text-center">Create Post</h1>
            <br>
            <form id="getpostform" 
                  method="POST"
                  action="addPost"
                  class="form-horizontal">
                <div class="form-group">
                    <label for="title" class="col-md-2 control-label">Title:</label>
                    <div class="col-md-2">
                        <input type="text" 
                               class="form-control" 
                               name="title" 
                               placeholder="Title"
                               maxlength="50"
                               required/>
                    </div>

                    <label for="categorySelect" class="col-md-2 control-label">Category:</label>
                    <div class="col-md-4">
                        <select name="categorySelect" class="form-control">
                            <c:forEach var="currentCategory" items="${categories}">
                                <option value="${currentCategory.categoryID}">${currentCategory.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <!--            <div class="form-group">
                                <div class="col-md-6">
                                                 
                                </div>
                            </div>-->

                <textarea name="content" id="texteditor"></textarea>
                <br>
                <div class="form-group">
                    <label for="publishDate" class="col-md-2 control-label">Publish Date:</label>
                    <div class="col-md-4">
                        <input type="date" class="form-control" name="publishDate" placeholder="Publish Date" required/>
                    </div>
                    <label for="expirationDate" class="col-md-2 control-label">Expiration Date:</label>
                    <div class="col-md-4">
                        <input type="date" class="form-control" name="expirationDate" placeholder="Expiration Date" required/>
                    </div>
                </div>

                <!-- tags -->
                <div class="bs-example">         
                    <label for="tagsSelect" class="col-md-2 control-label">Tags:</label>
                    <select multiple data-role="tagsinput" name="tagsSelect">
                    </select> 
                </div>

                <div class="form-group">
                    <div class="col-md-offset-5 col-md-8">
                        <input type="submit" class ="btn btn-default" value="Create Post"/>
                    </div>

                </div>
            </form>
        </div>


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
