<%@ page import="com.example.mvccpool.controllers.UserController" %>
<%@ page import="com.example.mvccpool.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@include file="../head.jsp" %>
    <%@include file="../navbar.jsp" %>
    <title>Car List</title>
</head>
<body>
<%UserController userController = new UserController();%>
<%int userId = ((User) session.getAttribute("user")).getId();%>
<%User user = userController.getUserById(userId);%>
<form action="/update-user" method="post">
    <div class="d-flex justify-content-center align-items-center container">
        <div class="col-md-6 col-md-offset-6">
            <div class="form-group">
                <label for="email">E-mail</label>
                <input type="text" class="form-control" id="email" name="email" value="<%=user.getEmail()%>">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="123">
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<%=user.getName()%>">
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%=user.getPhone()%>">
            </div>
            <div class="form-group">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
</form>
</body>
</html>

