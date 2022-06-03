<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@include file="../navbar.jsp" %>
    <title>Private page</title>
</head>
<body>
    <%
        if (session.getAttribute("user") != null) {
    %>
        <div>Welcome in our private page.</div>
        <p>
            <a href="/logout">Logout</a>
        </p>
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