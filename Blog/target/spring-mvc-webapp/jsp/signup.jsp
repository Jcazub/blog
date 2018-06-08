<<<<<<< HEAD
=======
<%-- 
    Document   : signUp
    Created on : Jun 1, 2018, 7:02:18 PM
    Author     : chxxch
--%>

>>>>>>> 81d8bdbdd30a6f62850251114d2511076fa8e47e
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
=======
>>>>>>> 81d8bdbdd30a6f62850251114d2511076fa8e47e
<!DOCTYPE html>
<html>
    
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
<<<<<<< HEAD
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/">codeKages</a> 
=======
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Logo</a> 
>>>>>>> 81d8bdbdd30a6f62850251114d2511076fa8e47e
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li role="presentation">
                        <li><a href="#">About</a>
                        </li>
<<<<<<< HEAD
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
                                <li role="presentation">
                                <li><a href="${pageContext.request.contextPath}/dashboard">Hello : ${pageContext.request.userPrincipal.name}</a>
                                </li>
                                <li><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                                </c:when>
                                <c:otherwise>
                                <li class="active"><a href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                </c:otherwise>
                            </c:choose>
                    </ul>
=======
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/dashboard">
                                Dashboard
                            </a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>

>>>>>>> 81d8bdbdd30a6f62850251114d2511076fa8e47e
                    <!-- top search -->
                    <form class="navbar-form navbar-right" action="#">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search" name="search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>  
<<<<<<< HEAD

=======
                    
>>>>>>> 81d8bdbdd30a6f62850251114d2511076fa8e47e
                </div>
            </div>
        </nav>
        <br>
<<<<<<< HEAD
        <!-- NAV END -->
=======

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h4>Hello : ${pageContext.request.userPrincipal.name}
                | <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
            </h4>
        </c:if>
        
        <!-- NAV END -->

>>>>>>> 81d8bdbdd30a6f62850251114d2511076fa8e47e
        <h2>Account Creation</h2>

        <form action="/action_page.php">
            First name:<br>
            <input type="text" name="firstname" value="Mickey">
            <br>
            Last name:<br>
            <input type="text" name="lastname" value="Mouse">
            <br><br>
            E-mail:<br>
            <input type="email" name="email">
            <br>

            <br>
            User name:<br>
            <input type="text" name="userid">
            <br>
            User password:<br>
            <input type="password" name="psw">
        </form>
        <input type="submit">
        <br><br>
<<<<<<< HEAD

        <div class="col-md-4">
            <div class="form-group">
                <label for="usr">First Name:</label>
                <input type="text" 
                       class="form-control"
                       placeholder="First Name"
                       maxlength="50"
                       id="usr">
            </div>

            <div class="form-group">
                <label for="usr">Last Name:</label>
                <input type="text" class="form-control" id="usr">
            </div>

            <div class="form-group">
                <label for="usr">E-Mail:</label>
                <input type="email" class="form-control" id="usr">
            </div>

            <div class="form-group">
                <label for="usr">User Name:</label>
                <input type="email" class="form-control" id="usr">
            </div>

            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" id="pwd">
            </div>
            <div class="form-group">
                <div class="col-md-offset-4 col-md-8">
                    <input type="submit" 
                           class="btn btn-default" 
                           id="search-button" 
                           value="Sign Up"/>
                </div>
            </div>
        </div>
        <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FOOTER-->
        <footer class="container-fluid text-center main-footer"> 
            <p>	&copy; codeKages </p>
        </footer>

=======
        <footer class="container-fluid text-center">
            <p>Footer Text</p>
        </footer>
        
>>>>>>> 81d8bdbdd30a6f62850251114d2511076fa8e47e
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