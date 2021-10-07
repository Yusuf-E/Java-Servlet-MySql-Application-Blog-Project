<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="login.css" >
  <title>Admin Login</title>

</head>
<body>
<div class="container login-container">
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 login-form-2">
      <h3>Admin Login</h3>
<%
        Object loginObj = request.getAttribute("loginError");
        if ( loginObj != null ) {
          String errorMessage = ""+loginObj;
%>
        <div class="row mb-0 mt-3">
        <div class="col-sm-1"></div>
        <div class="form-group mt-3 col-sm-10">
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Hata!</strong> <%=errorMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
        </div>
        <div class="col-sm-1"></div></div>
<% } %>

      <form action="login" method="post">
        <div class="form-group mb-3">
          <input type="text" class="form-control" name="email" placeholder="Email"  required/>
        </div>
        <div class="form-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="Şifre"  required/>
        </div>
        <div class="form-group mb-3">
          <input name="remember" type="checkbox" class="form-check-input" id="exampleCheck1">
          <label class="form-check-label ForgetPwd" for="exampleCheck1">Remember</label>
        </div>
        <div class="form-group mb-3">
          <input type="submit" class="btnSubmit" value="Gönder" />
        </div>
      </form>
    </div>
    <div class="col-md-3"></div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>