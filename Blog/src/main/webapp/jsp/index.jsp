<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="index-html" lang="en">

    <head>

        <title>Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap 3 core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" id="bootstrap-css">
        <!-- Tags CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstags/bootstrap-tagsinput.css">
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
                        <form class="navbar-form navbar-left" method="GET" action="${pageContext.request.contextPath}/">
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

        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NAV END -->
        <!--    <div class="col-lg-10 col-lg-offset-3">
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
        <span><c:forEach var="currentTag" items="${currentBlog.tags}"></span>
        <span class="label label-primary">${currentTag.name} </c:forEach></span>
        <br>
        </div>
        <hr>
        </c:forEach>
         Pager 
        <div class="clearfix">
            <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
        </div>
    </div>
</div>
</div>
</div>-->

        <section id="blog-section" >
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row" id="index-posts">

                            <c:forEach var="currentBlog" items="${posts}" >
                                <div class="col-lg-6 col-md-6">
                                    <aside>
                                        <a href="${pageContext.request.contextPath}/post?postID=${currentBlog.blogID}">
                                            <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" class="img-responsive">
                                        </a>
                                        <div class="content-title">
                                            <div class="text-center">
                                                <h3><a href="${pageContext.request.contextPath}/post?postID=${currentBlog.blogID}">${currentBlog.title}</a></h3>
                                            </div>
                                        </div>
                                        <div class="content-footer">
                                            <img class="user-small-img" src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg">
                                            <span style="font-size: 16px;color: #fff;">${currentBlog.user.userName}</span>
                                            <span class="pull-right">
                                                <a href="#" data-toggle="tooltip" data-placement="left" title="Comments"><i class="fa fa-comments" ></i> 30</a>
                                                <a href="#" data-toggle="tooltip" data-placement="right" title="Loved"><i class="fa fa-heart"></i> 20</a>                  
                                            </span>
                                            <!---- SOCIAL TOOLTIP ----->
                                            <div class="user-ditels">
                                                <div class="user-img"><img src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg" class="img-responsive"></div>
                                                <span class="user-full-ditels">
                                                    <h3>${currentBlog.user.userName}</h3>
                                                    <p>Web & Graphics Designer</p>
                                                </span>
                                                <div class="social-icon">
                                                    <a href="#"><i class="fa fa-facebook" data-toggle="tooltip" data-placement="bottom" title="Facebook"></i></a>
                                                    <a href="#"><i class="fa fa-twitter" data-toggle="tooltip" data-placement="bottom" title="Twitter"></i></a>
                                                    <a href="#"><i class="fa fa-google-plus" data-toggle="tooltip" data-placement="bottom" title="Google Plus"></i></a>
                                                    <a href="#"><i class="fa fa-youtube" data-toggle="tooltip" data-placement="bottom" title="Youtube"></i></a>
                                                    <a href="#"><i class="fa fa-github" data-toggle="tooltip" data-placement="bottom" title="Github"></i></a>				
                                                </div>
                                            </div>

                                        </div>
                                    </aside>
                                </div>
                            </c:forEach>


                        </div>
                    </div>

                    <!--           // RECENT POST===========-->
                    <div class="col-lg-4">           
                        <div class="widget-sidebar">
                            <h2 class="title-widget-sidebar">// RECENT POST</h2>
                            <div class="content-widget-sidebar">
                                <ul>

                                    <c:forEach var="currentRecentPost" items="${recentPosts}">
                                        <li class="recent-post">
                                            <div class="post-img">
                                                <a href="${pageContext.request.contextPath}/post?postID=${currentRecentPost.blogID}">
                                                    <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" class="img-responsive">
                                                </a>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/post?postID=${currentRecentPost.blogID}"><h5>${currentRecentPost.title}</h5></a>
                                            <p><small><i class="fa fa-calendar" data-original-title="" title=""></i>${currentRecentPost.publishDate}</small></p>
                                        </li>
                                        <!-- put conditional if last entry -->
                                        <hr>
                                    </c:forEach>

                                </ul>
                            </div>
                        </div>

                        <!--=====================
                               CATEGORIES
                          ======================-->
                        <div class="widget-sidebar">
                            <h2 class="title-widget-sidebar">// CATEGORIES</h2>
                            <c:forEach var="currentCategory" items="${categories}">
                                <a href="${pageContext.request.contextPath}/?category-search=${currentCategory.categoryID}" class="btn categories-btn">${currentCategory.name}</a>
                            </c:forEach>
                        </div>  

                        <!--=====================
                              NEWSLETTER
                       ======================-->
                        <div class="widget-sidebar">
                            <h2 class="title-widget-sidebar">// NEWSLETTER</h2>
                            <p>Enter your email below to get the latest updates.</p>  
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
                                <input id="email" type="text" class="form-control" name="email" placeholder="Email">
                            </div>
                            <button type="button" class="btn btn-warning">Subscribe</button>
                        </div>  
                    </div>
                </div>
            </div>

        </section>

        <!------SEARCH CATEGORIES ------------------>


        <ul class="list-group" id="errorMessages"></ul>

        <form class="" action="#">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" id="category-search">
            </div>
            <button type="button" class="btn btn-default" id="search-categories-btn">Submit</button>
        </form> 

        <div class="list-group" id="index-categories">
            <!--<li>SFsafsf</li>-->
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
        <script src="${pageContext.request.contextPath}/blogstags/bootstrap-tagsinput.min.js"></script>
        <!-- Personal Scripts -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>

    </body>

</html>