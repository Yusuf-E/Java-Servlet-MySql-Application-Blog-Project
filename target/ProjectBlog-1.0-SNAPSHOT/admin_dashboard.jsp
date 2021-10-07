<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm =util.isLogin(request,response);%>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>


<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>

        .text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
    <title>Admin Dashboard</title>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <h1>Makale Editör</h1>
                <ul class=" mb-2 mb-lg-0" style="float: right; list-style-type: none">
                    <li class="nav-item dropdown" style="float: right;">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="float: right; color:#333333 ">
                            <%=adm.getName()%>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="change_password.jsp">Şifre Değiştir</a></li>
                            <li><a class="dropdown-item" href="logout">Çıkış Yap</a></li>
                        </ul>
                    </li>
                </ul>
        </div>
    </nav>
    <hr />
    <div class="row">
        <div class="col-sm-6">
            <form action="article-insert" method="post">
                <div class="mb-3">
                    <input name="title" class="form-control" placeholder="Haber Başlık" required/>
                </div>
                <div class="mb-3">
                    <div class="form-floating">
                        <textarea name="detail" class="form-control" placeholder="Haber Detay" id="floatingTextarea2" style="height: 100px"required></textarea>
                        <label for="floatingTextarea2">Haber Detay</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Kaydet</button>
            </form>
        </div>
        <div class="col-sm-6" style="overflow: auto; height:220px;">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Nid</th>
                    <th scope="col">Başlık</th>
                    <th scope="col">Detay</th>
                    <th scope="col">Sil/Düzenle</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int aid = adm.getAid();
                %>
                <c:if test="${ dbUtil.allArticles(aid).size() > 0 }">
                    <c:forEach items="${ dbUtil.allArticles(aid) }" var="article" >
                        <tr>
                            <th style="overflow: hidden"><c:out value="${article.id}"></c:out></th>


                            <td  style="overflow: hidden;"><div class="text" style="width: 100px;"><c:out value="${article.title}"></c:out></div></td>
                                <td  style="overflow: hidden;"><div class="text" style="width: 250px;"><c:out value="${article.detail}"></c:out></div></td>


                            <td>
                                <a onclick="return show_alert()" href="article-insert?id=${article.id}" class="btn btn-danger btn-sm">Sil</a>
                                <a href="article-update?id=${article.id}" class="btn btn-primary btn-sm">Düzenle</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>
        </div>
    </div>
    <h1>Yazar Editör</h1>
    <%
        Object insertErrorObject = request.getAttribute("insertError");
        if ( insertErrorObject != null ) {
            String errorMessage = ""+insertErrorObject;
    %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Hata!</strong> <%=errorMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>
    <hr/>
    <div class="row mb-5">
        <div class="col-sm-6">
            <form action="admin-insert" method="post">
                <div class="mb-3">
                    <input type="text" name="name" class="form-control" placeholder="Admin İsim" required/>
                </div>
                <div class="mb-3">
                    <input type="email" name="email" class="form-control" placeholder="Admin Email" required/>
                </div>
                <div class="mb-3">
                    <input type="password" name="password" class="form-control" placeholder="Admin password" required/>
                </div>

                <button type="submit" class="btn btn-success">Kaydet</button>
            </form>
        </div>
        <div class="col-sm-6" style="overflow: auto; height:220px;">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Aid</th>
                    <th scope="col">İsim</th>
                    <th scope="col">Email</th>
                </tr>
                </thead>
                <tbody>
            <c:if test="${ dbUtil.allAdmin().size() > 0 }">
                <c:forEach items="${ dbUtil.allAdmin() }" var="item" >
                <tr>
                    <th><c:out value="${item.aid}"></c:out></th>
                    <td><c:out value="${item.name}"></c:out></td>
                    <td><c:out value="${item.email}"></c:out></td>
                </tr>
                </c:forEach>
            </c:if>
                </tbody>
            </table>
        </div>

    </div>
    <h1>Mesajlar</h1>
    <hr/>
    <div class="row">
        <div class="col-sm-12" style="overflow: auto; height:220px;">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Aid</th>
                    <th scope="col">İsim</th>
                    <th scope="col">Email</th>
                    <th scope="col">Mesaj</th>
                    <th scope="col">Detay</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${ dbUtil.allMessages().size() > 0 }">
                    <c:forEach items="${ dbUtil.allMessages() }" var="message" >
                        <tr>
                            <th style="overflow: hidden"><c:out value="${message.cid}"></c:out></th>


                            <td  style="overflow: hidden;"><div class="text" style="width: 100px;"><c:out value="${message.name}"></c:out></div></td>
                            <td  style="overflow: hidden;"><div class="text" style="width: 250px;"><c:out value="${message.email}"></c:out></div></td>
                            <td  style="overflow: hidden;"><div class="text" style="width: 400px;"><c:out value="${message.message}"></c:out></div></td>

                            <td>
                                <a href="message-detail?cid=${message.cid}" class="btn btn-success btn-sm">Detay</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    function show_alert() {
        return confirm("Silmek istediğinizden emin misniz?")
    }
</script>
</body>
</html>
