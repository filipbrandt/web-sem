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
<div class="container-fluid">
    <div class="row justify-content-center align-item-center vh-100">
        <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3 h-100">
            <form action="/login-user" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email"
                           name="email"
                           id="email"
                           class="form-control"
                    >
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password"
                           name="password"
                           id="password"
                           class="form-control"
                    >
                </div>
                <div class="form-group">
                    <input type="submit" value="Login" class="btn btn-primary">
                </div>
            </form>
            <div class="container">
                <a href="/views/register-form.jsp">Don´t have an account? Register here</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
