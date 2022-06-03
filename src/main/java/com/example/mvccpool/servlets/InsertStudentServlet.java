package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.StudentController;
import com.example.mvccpool.models.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "InsertStudentServlet", value = "/insert-student")
public class InsertStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student = new Student(
                request.getParameter("name"),
                request.getParameter("faculty_group"),
                request.getParameter("gender"),
                Integer.parseInt(request.getParameter("age"))
        );

        try {
            if(new StudentController().insertStudent(student) > 0) {
                System.out.println("Student Inserted");
                response.sendRedirect("/views/allStudents.jsp");
            } else {
                System.out.println("Student NOT Inserted");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
