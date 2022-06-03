<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Insert car</title>
</head>
    <%@include file="head.jsp" %>
</head>
<body>
<nav class="navbar navbar-expand-md py-4 navbar-light bg-light">
    <a class="navbar-brand" href="/index.jsp">BAZAR</a>
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
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <a class="navbar-brand" href="#">BAZÁR</a>--%>
<%--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--        <span class="navbar-toggler-icon"></span>--%>
<%--    </button>--%>

<%--    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">--%>
<%--        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">--%>
<%--            <li class="nav-item active">--%>
<%--                <a class="nav-link" href="#">Car List <span class="sr-only">(current)</span></a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--        <form class="form-inline my-2 my-lg-0">--%>
<%--            <input class="form-control mr-sm-2" type="search" placeholder="Search">--%>
<%--            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</nav>--%>
</body>

