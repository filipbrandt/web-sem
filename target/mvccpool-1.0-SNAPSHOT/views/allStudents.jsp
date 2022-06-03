
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mvccpool.models.Student" %>
<%@ page import="com.example.mvccpool.controllers.StudentController" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Student List</title>
</head>
<body>
<%

    StudentController studentController = new StudentController();
    ArrayList<Student> students = studentController.getAllStudents(10);
//
//    try{
//        Class.forName("com.mysql.cj.jdbc.Driver");
//    } catch (ClassNotFoundException e){
//        e.printStackTrace();
//    }
//
//    try (
//
//            Connection connection = DriverManager.getConnection(
//                    "jdbc:mysql://localhost:3306/cv422",
//                    "cv422",
//                    "123456"
//            );
//    ) {
//
//        String sql = "SELECT * FROM students;";
//        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//
//
//        ResultSet resultSet = preparedStatement.executeQuery();
//
//        while(resultSet.next()){
//            students.add(new Student(
//                    resultSet.getInt("id"),
//                    resultSet.getString("name"),
//                    resultSet.getInt("age"),
//                    resultSet.getString("faculty_group"),
//                    resultSet.getString("gender")
//            ));
//        }
//
//    } catch (SQLException | NumberFormatException e) {
//        e.printStackTrace();
//    }

%>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Name</th>
        <th scope="col">Group</th>
        <th scope="col">Gender</th>
        <th scope="col">Age</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <%
        for(Student student : students){
    %>
    <tr>
        <td><%=student.getId()%></td>
        <td><%=student.getName()%></td>
        <td><%=student.getAge()%></td>
        <td><%=student.getFaculty_group()%></td>
        <td><%=student.getGender()%></td>
        <td><%=student.getGender()%></td>
        <td>
            <a href="/delete-student?id=<%=student.getId()%>">DELETE</a>
        </td>

    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>