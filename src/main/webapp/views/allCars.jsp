<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvccpool.controllers.CarController" %>
<%@ page import="com.example.mvccpool.models.Car" %>
<%@ page import="com.example.mvccpool.models.User" %>
<%@ page import="com.example.mvccpool.controllers.FileController" %>
<%@ page import="com.example.mvccpool.models.File" %>
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
    CarController carController = new CarController();
    ArrayList<Car> cars = carController.getAllCars();
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
<%--        <td>--%>
<%--            <a href="/delete-student?id=<%=student.getId()%>">DELETE</a>--%>
<%--        </td>--%>
</body>
</html>
