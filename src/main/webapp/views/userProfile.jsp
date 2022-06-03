<%@ page import="com.mysql.cj.Session" %>
<%@ page import="com.example.mvccpool.models.User" %>
<%@ page import="com.example.mvccpool.controllers.UserController" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="com.example.mvccpool.controllers.CarController" %>
<%@ page import="com.example.mvccpool.models.Car" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvccpool.models.File" %>
<%@ page import="com.example.mvccpool.controllers.FileController" %><%--
  Created by IntelliJ IDEA.
  User: Filip
  Date: 16. 5. 2022
  Time: 21:03
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
    System.out.println("som v user profile");
    User user = new UserController().getUserById(((User) session.getAttribute("user")).getId());
%>
<%--<div class="card-columns mx-auto d-flex justify-content-center col-12">--%>
<div class="card mx-auto d-flex justify-content-center col-12"
     style="width: 25rem; border-radius: 20px; margin-top: 50px; margin-bottom: 50px;">
    <%--  <img class="card-img-top" src="..." alt="Card image cap">--%>
    <div class="card-body">
        <h5 class="card-title"><%=user.getName()%>
        </h5>
        <%--    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">E-mail: <%=user.getEmail()%>
        </li>
        <li class="list-group-item">Phone: <%=user.getPhone()%>
        </li>
    </ul>
    <div class="card-body">
        <a class="btn btn-outline-secondary btn-lg" href="editUserProfile.jsp" role="button">Edit Profile
            Information</a>
    </div>

</div>

<div class="log out" style="padding-bottom: 20px; text-align: center" >
    <a style="color: firebrick;" href="/logout-user">Odhlasit sa</a>
</div>

<%
    CarController carController = new CarController();
    int userId = ((User) session.getAttribute("user")).getId();
    ArrayList<Car> cars = carController.getCarsByUser(userId);
%>

<%
    if (cars.size() > 0) {
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
        <td><a href="carSummary.jsp?id=<%=car.getId()%>" class="btn btn-outline-secondary">Zobraz</a></td>
        <%
            if (session.getAttribute("user") != null) {
                if (((User) session.getAttribute("user")).getId() == 1 || ((User) session.getAttribute("user")).getId() == car.getUserId()) {
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
    <%
        }
    %>


</body>
</html>
