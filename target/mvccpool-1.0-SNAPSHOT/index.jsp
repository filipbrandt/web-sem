<%@ page import="com.example.mvccpool.controllers.CarController" %>
<%@ page import="com.example.mvccpool.models.Car" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvccpool.models.User" %>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <title>Insert car</title>
</head>
<body>
<nav class="navbar navbar-expand-md py-4 navbar-light bg-light">
    <a class="navbar-brand" href="/">BAZAR</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <%--        <div class="navbar-nav">--%>
        <%--            <a class="nav-item nav-link" href="/views/allCars.jsp">Všetky ponuky</a>--%>
        <%--        </div>--%>
    </div>
    <form class="navbar-nav my-2 my-lg-0" style="font-size: large">
        <a class="nav-item nav-link" href="/views/allCars.jsp">Všetky ponuky</a>
        <a class="nav-item nav-link" href="/views/offer-form.jsp">Pridat ponuku</a>
        <% if (session.getAttribute("user") != null) { %>
        <a href="/views/userProfile.jsp" class="btn btn-outline-secondary mr-1">Účet</a>
        <% } else { %>
        <a href="/views/login-form.jsp" class="btn btn-outline-secondary mr-1">Prihlasenie</a>
        <% } %>
    </form>
</nav>

<%
    if (session.getAttribute("isLogin") != null) {
        try {
            boolean isLogin = (boolean) session.getAttribute("isLogin");
            if (isLogin) {
%>
<div>
    This div is show only if we have session with attribute isLogin
</div>
<%
            }
        } finally {
        }
    }
%>

<div class="jumbotron">
    <p class="text-center d-flex justify-content-center align-items-center">
        <a class="btn btn-outline-light btn-lg" href="/views/allCars.jsp" role="button">ZOBRAZ PONUKU ÁUT</a>
    </p>
    <p class="text-center d-flex justify-content-center align-items-center" style="color:white; font-size: large;">
        alebo</p>
    <p class="text-center d-flex justify-content-center align-items-center">
        <a class="btn btn-outline-light btn-lg" href="/views/offer-form.jsp" role="button">VYTVOR VLASTNÝ INZERÁT</a>
    </p>
</div>
<div class="text-center" style="margin-bottom: 30px">
    <h2>POSLEDNÉ PRIDANÉ AUTÁ</h2>
</div>


<%
    CarController carController = new CarController();
    ArrayList<Car> cars = carController.getAllCarsLimit(3);
%>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Fotka</th>
        <th scope="col">Značka</th>
        <th scope="col">Model</th>
        <th scope="col">Rok Výroby</th>
        <th scope="col">Palivo</th>
        <th scope="col">Prevodovka</th>
        <th scope="col">Výkon[kw]</th>
        <th scope="col">Najazdené km</th>
        <th scope="col">Popis</th>
        <th scope="col">Zobraz</th>
        <%
            if (session.getAttribute("user") != null) {
                if (((User) session.getAttribute("user")).getId() == 1) {
        %>
        <th scope="col">Uprav</th>
        <th scope="col">Vymaž</th>
        <%
                }
            }
        %>
    </tr>
    </thead>
    <tbody>
    <%
        for (Car car : cars) {
            File file = new FileController().getFileByCarId(car.getId());
            String image = file.getImage();
    %>
    <tr>
        <td style="width: 5%">
            <div class="image-parent">
                <img src="/uploads/<%=image%>" class="img-fluid" alt="quixote">
            </div>
        </td>
        <td><%=car.getMake()%>
        </td>
        <td><%=car.getModel()%>
        </td>
        <td><%=car.getYear()%>
        </td>
        <td><%=car.getFuel()%>
        </td>
        <td><%=car.getTransmission()%>
        </td>
        <td><%=car.getPower()%>
        </td>
        <td><%=car.getDriven()%>
        </td>
        <td><%=car.getDescription()%>
        </td>
        <%--        <td><a href="/project-edit.jsp?id=<%=project.getId()%>" class="btn btn-primary">MORE</a></td>--%>
        <td><a href="./views/carSummary.jsp?id=<%=car.getId()%>" class="btn btn-outline-secondary">Zobraz</a></td>
        <%
            if (session.getAttribute("user") != null) {
                if (((User) session.getAttribute("user")).getId() == 1) {
        %>
        <td><a href="editCar.jsp?id=<%=car.getId()%>" class="btn btn-outline-primary">Uprav</a></td>
        <td><a href="/delete-car-admin?id=<%=car.getId()%>" class="btn btn-outline-danger">Vymaž</a></td>
        <%
                }
            }
        %>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<div class="container-fluid">
    <div class="row justify-content-center align-item-center vh-100">
        <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3 h-100">
            <form action="/insert-person" method="post">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text"
                           name="name"
                           id="name"
                           class="form-control"
                    >
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email"
                           name="email"
                           id="email"
                           class="form-control"
                    >
                </div>
                <div class="form-group">
                    <input type="submit" value="Login" class="btn btn-primary">
                </div>
            </form>
        </div>
    </div>
</div>



<%--<form action="/insert-student" method="post">--%>
<%--    <div class="col-md-4 col-md-offset-4">--%>
<%--        <div class="form-group">--%>
<%--            <label for="name">Name</label>--%>
<%--            <input type="text" class="form-control" id="name" name="name">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="faculty_group">Group</label>--%>
<%--            <input type="text" class="form-control" id="faculty_group" name="faculty_group">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="gender">Gender</label>--%>
<%--            <input type="text" class="form-control" id="gender" name="gender">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="age">Age</label>--%>
<%--            <input type="number" class="form-control" id="age" name="age">--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--    </div>--%>
<%--</form>--%>

<%--**************************************************Inser Car form********************************--%>
<%--<form action="/insert-car" method="post">--%>
<%--    <div class="col-md-4 col-md-offset-4">--%>
<%--        <div class="form-group">--%>
<%--            <label for="make">Make</label>--%>
<%--            <input type="text" class="form-control" id="make" name="make">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="model">Model</label>--%>
<%--            <input type="text" class="form-control" id="model" name="model">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="year">Year</label>--%>
<%--            <input type="number" class="form-control" id="year" name="year">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="fuel">Fuel</label>--%>
<%--            <input type="text" class="form-control" id="fuel" name="fuel">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="transmission">Transmission</label>--%>
<%--            <input type="text" class="form-control" id="transmission" name="transmission">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="power">Power</label>--%>
<%--            <input type="number" class="form-control" id="power" name="power">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="driven">Driven</label>--%>
<%--            <input type="number" class="form-control" id="driven" name="driven">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="description">Description</label>--%>
<%--            <input type="text" class="form-control" id="description" name="description">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--    </div>--%>
<%--</form>--%>
</body>
</html>