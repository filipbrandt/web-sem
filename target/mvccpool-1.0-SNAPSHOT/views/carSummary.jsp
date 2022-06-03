<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvccpool.models.Student" %>
<%@ page import="com.example.mvccpool.controllers.StudentController" %>
<%@ page import="com.example.mvccpool.controllers.CarController" %>
<%@ page import="com.example.mvccpool.models.Car" %>
<%@ page import="com.example.mvccpool.models.User" %>
<%@ page import="com.example.mvccpool.controllers.UserController" %>
<%@ page import="com.example.mvccpool.models.File" %>
<%@ page import="com.example.mvccpool.controllers.FileController" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>

    <%@include file="../head.jsp" %>
    <%@include file="../navbar.jsp" %>
    <title>Car List</title>
</head>
<body>
<%
    CarController carController = new CarController();
    Car car = carController.getCarById(Integer.parseInt(request.getParameter("id")));
    UserController userController = new UserController();
    User user = userController.getUserById(car.getUserId());
    FileController fileController = new FileController();
    File file = fileController.getFileByCarId(car.getId());
    String image = file.getImage();
%>

<h2 style="text-align: center; margin-top: 25px; margin-bottom: 25px"><%=car.getMake()%> <%=car.getModel()%></h2>
<div class="card text-center" style="width: 50%; margin: auto">
    <div class="card-header" style="background-color: white">
        <p>Rok: <%=car.getYear()%></p>
        <p>Vykon: <%=car.getPower()%>kw</p>
        <p>Počet km: <%=car.getDriven()%></p>
        <p>Palivo: <%=car.getFuel()%></p>
        <p>Prevodovka: <%=car.getTransmission()%></p>
    </div>
    <div class="card-body">
        <p class="card-text"><%=car.getDescription()%></p>
    </div>
    <div class="card-footer text-muted" style="background-color: white">
        <p>Autor: <%=user.getName()%></p>
        <p>E-mail: <%=user.getEmail()%></p>
        <p>Tel.Čislo: <%=user.getPhone()%></p>
    </div>
    <img class="card-img-top" src="/uploads/<%=image%>" alt="Card image cap">
</div>

</body>
</html>
