<%@ page import="com.example.mvccpool.controllers.CarController" %>
<%@ page import="com.example.mvccpool.models.Car" %>
<%@ page import="com.example.mvccpool.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Filip
  Date: 17. 5. 2022
  Time: 15:18
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
<%
    if (session.getAttribute("user") != null) {
        CarController carController = new CarController();
        Car car = carController.getCarById(Integer.parseInt(request.getParameter("id")));
%>
<form action="/update-car" method="post">
    <div class="d-flex justify-content-center align-items-center container">
        <div class="col-md-6 col-md-offset-6">
            <input type="hidden" name="id" value="<%=car.getId()%>">
            <div class="form-group">
                <label for="make">Make</label>
                <input type="text" class="form-control" id="make" name="make" value="<%=car.getMake()%>">
            </div>
            <div class="form-group">
                <label for="model">Model</label>
                <input type="text" class="form-control" id="model" name="model" value="<%=car.getModel()%>">
            </div>
            <div class="form-group">
                <label for="year">Year</label>
                <input type="number" class="form-control" id="year" name="year" value="<%=car.getYear()%>">
            </div>
<%--            <div class="form-group">--%>
<%--                <label for="fuel">Fuel</label>--%>
<%--                <input type="text" class="form-control" id="fuel" name="fuel" value="<%=car.getFuel()%>">--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="transmission">Transmission</label>--%>
<%--                <input type="text" class="form-control" id="transmission" name="transmission"--%>
<%--                       value="<%=car.getTransmission()%>">--%>
<%--            </div>--%>
            <div class="form-group">
                <label for="fuel">Palivo</label>
                <select class="form-control" id="fuel" name="fuel" onselect="<%=car.getFuel()%>" required>
                    <option>Benzín</option>
                    <option>Dízel</option>
                </select>
            </div>
            <div class="form-group">
                <label for="transmission">Prevodovka</label>
                <select class="form-control" id="transmission" name="transmission" onselect="<%=car.getTransmission()%>" required>
                    <option>Automatická</option>
                    <option>Manuálna</option>
                </select>
            </div>
            <div class="form-group">
                <label for="power">Power</label>
                <input type="number" class="form-control" id="power" name="power" value="<%=car.getPower()%>">
            </div>
            <div class="form-group">
                <label for="driven">Driven</label>
                <input type="number" class="form-control" id="driven" name="driven" value="<%=car.getDriven()%>">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="5"><%=car.getDescription()%></textarea>
            </div>
            <input type="hidden" name="userId" value="<%=((User)session.getAttribute("user")).getId()%>">
            <div class="form-group">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
</form>
<%
        // User is login and we can show content
    } else {
        // User is not login.
        // We have to redirect him/her from this page
        response.sendRedirect("/views/login-form.jsp");
    }
%>
</body>
</html>
