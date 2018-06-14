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
        <!--        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
        <!--        <div class="col-sm-6 col-sm-offset-3"> 
                    <div class="well">
                        <h4><small>RECENT POSTS</small></h4>
                        <hr>
        <c:forEach var="currentBlog" items="${posts}" >
            <h2>${currentBlog.title}</h2>
            <span class="glyphicon glyphicon-time"> Post by , .</span><br>

            <p>${currentBlog.content}</p>
            <br><br>
        </c:forEach>
    </div>
</div>-->
        <div class="col-lg-10 col-lg-offset-3">
            <div class="w3-panel w3-card-4">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
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
                        <!-- Pager -->
                        <div class="clearfix">
                            <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
                        </div>
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
        <!-- Bootstrap 4 scripts -->
        <!--        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>-->

        <!-- Clean Blog JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Clean Blog Scripts -->
        <script src="js/clean-blog/clean-blog.min.js"></script>
        <!-- Personal Scripts -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </body>

</html>