<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="index-html">
    <head>
        <title>View Post</title>
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
        <jsp:include page="navbar.jsp"/> 
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
