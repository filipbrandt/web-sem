<%@ page import="com.example.mvccpool.controllers.PersonController" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvccpool.models.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <title>All Persons</title>
</head>
<body>

<%
    PersonController personController = new PersonController();
    ArrayList<Person> persons = personController.getAllPersons();
%>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Meno</th>
        <th scope="col">Email</th>
        <th scope="col">Zobraz</th>
        <th scope="col">Uprav</th>
        <th scope="col">Vymaž</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Person person : persons) {
    %>
    <tr>
        <td><%=person.getId()%>
        </td>
        <td><%=person.getName()%>
        </td>
        <td><%=person.getEmail()%>
        <td><a href="person-summary.jsp?id=<%=person.getId()%>" class="btn btn-outline-secondary">Zobraz</a></td>
        <td><a href="person-update.jsp?id=<%=person.getId()%>" class="btn btn-outline-primary">Uprav</a></td>
        <td><a href="/delete-person?id=<%=person.getId()%>" class="btn btn-outline-danger">Vymaž</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
