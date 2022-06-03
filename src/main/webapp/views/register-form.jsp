<%--
  Created by IntelliJ IDEA.
  User: Filip
  Date: 16. 5. 2022
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
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
<form action="/insert-user" method="post">
    <div class="d-flex justify-content-center align-items-center container">
        <div class="col-md-6 col-md-offset-6">
            <div class="form-group">
                <label for="email">E-mail</label>
                <input type="text" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Heslo</label>
                <input type="password" class="form-control" id="password" name="password" minlength="6" required>
            </div>
            <div class="form-group">
                <label for="name">Meno</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="phone">Tel. Číslo</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>
            <div class="form-group">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
</form>

</body>
</html>
