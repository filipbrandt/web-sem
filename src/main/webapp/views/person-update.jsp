<%@ page import="com.example.mvccpool.models.Person" %>
<%@ page import="com.example.mvccpool.controllers.PersonController" %><%--
  Created by IntelliJ IDEA.
  User: Filip
  Date: 3. 6. 2022
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Person Update</title>
</head>
<body>

<%
    PersonController personController = new PersonController();
    Person person = personController.getPersonById(Integer.parseInt(request.getParameter("id")));
%>

<div class="container-fluid">
    <div class="row justify-content-center align-item-center vh-100">
        <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3 h-100">
            <form action="/update-person" method="post">
                <input type="hidden" name="id" value="<%=person.getId()%>">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text"
                           name="name"
                           id="name"
                           class="form-control"
                           value="<%=person.getName()%>"
                    >
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email"
                           name="email"
                           id="email"
                           class="form-control"
                           value="<%=person.getEmail()%>"
                    >
                </div>
                <div class="form-group">
                    <input type="submit" value="Update" class="btn btn-primary">
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
