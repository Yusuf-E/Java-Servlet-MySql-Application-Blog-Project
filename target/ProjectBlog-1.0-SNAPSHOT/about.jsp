<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<html>
<head>
    <title>About</title>
  <link rel="stylesheet" href="navbar.css">
  <style>
  body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
  }

  html {
  box-sizing: border-box;
  }

  *, *:before, *:after {
  box-sizing: inherit;
  }

  .column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
  }

  .card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
  }

  .about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
  }

  .container {
  padding: 0 16px;
  }

  .container::after, .row::after {
  content: "";
  clear: both;
  display: table;
  }

  .title {
  color: grey;
  }

  .button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  }

  .button:hover {
  background-color: #555;
  }

  @media screen and (max-width: 650px) {
  .column {
  width: 100%;
  display: block;
  }
  }
  </style>
</head>
<body>
<div class="row">
  <div class="topnav">
    <a  href="index.jsp">Home</a>
    <a  href="contact.jsp">Contact</a>
    <a class="active" href="about.jsp">About</a>
  </div>
</div>


<div class="about-section">
  <h1>About Us Page</h1>
  <p>Some text about who we are and what we do.</p>
  <p>Resize the browser window to see that this page is responsive by the way.</p>
</div>

<h2 style="text-align:center">Our Team</h2>

  <c:if test="${ dbUtil.allAdmin().size() > 0 }">
  <c:forEach items="${ dbUtil.allAdmin() }" var="item" >
  <div class="column">
    <div class="card">
      <img src="images/profile.jpg" alt="Mike" style="width:100%">
      <div class="container">
        <h2><c:out value="${item.name}"></c:out></h2>
        <p class="title">Yazar</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p><c:out value="${item.email}"></c:out></p>
        <a href="mailto:<c:out value="${item.email}"></c:out>"><button class="button">Contact</button></a>
      </div>
    </div>
  </div>

  </c:forEach>
      </c:if>
</body>
</html>
