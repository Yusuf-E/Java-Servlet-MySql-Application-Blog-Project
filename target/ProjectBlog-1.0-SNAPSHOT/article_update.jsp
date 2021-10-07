
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="props.Admin" %>
<%@ page import="props.Article" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>

<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>

<html>
<head>
  <title>Article Update</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">


  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <h1>Makale Edit</h1>
      <ul class=" mb-2 mb-lg-0" style="float: right; list-style-type: none">
        <li class="nav-item dropdown" style="float: right;">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="float: right; color:#333333 ">
            <%=adm.getName()%>
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="change_password.jsp">Şifre Değiştir</a></li>
            <li><a class="dropdown-item" href="logout">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
  <hr/>

  <div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
      <%
        Article article = (Article) request.getAttribute("article");

      %>

      <form action="article-update" method="post" >

        <div class="mb-3">
          <input value="<%=article.getTitle()%>" type="text" name="title" placeholder="Başlık" class="form-control" required />
        </div>

        <div class="form-floating mb-3">
          <textarea name="detail" class="form-control" placeholder="Haber Detay"required id="floatingTextarea2" style="height: 400px"><%=article.getDetail()%></textarea>
          <label for="floatingTextarea2">Haber Detay</label>
        </div>
        <button class="btn btn-success"> Düzenle </button>
      </form>
    </div>
    <div class="col-sm-3"></div>
  </div>


  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</div>
</body>
</html>
