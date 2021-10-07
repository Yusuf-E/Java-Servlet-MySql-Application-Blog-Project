<%@ page import="props.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Article Detail</title>
    <link rel="stylesheet" href="index_css.css">
    <link rel="stylesheet" href="navbar.css">
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <div class="row">
            <div class="topnav">
                <a class="active" href="index.jsp">Home</a>
                <a href="contact.jsp">Contact</a>
                <a href="about.jsp">About</a>
            </div>
        </div>
        <%
            Article article = (Article) request.getAttribute("pro");

        %>
                <div class="row mt-3">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <div class="blog_left_sidebar">
                            <article class="blog_item">
                                <div class="blog_item_img">
                                    <img class="card-img rounded-0" src="images/background.jpg" alt="">
                                </div>

                                <div class="blog_details">
                                    <span>
                                        <h2><c:out value="${article.title}"></c:out></h2>
                                    </span>
                                    <p ><c:out value="${article.detail}"></c:out></p>

                                </div>
                            </article>
                            <ul class="blog-info-link" style="list-style-type: none">
                                <li><span href=""><i class="fa fa-user"></i> <c:out value="${article.date}"></c:out></span></li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-sm-3"></div>
                </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>