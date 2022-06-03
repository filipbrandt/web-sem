package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.StudentController;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteStudentServlet", value = "/delete-student")
public class DeleteStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int isDelete = new StudentController().deleteStudentById(Integer.parseInt(request.getParameter("id")));
            if(isDelete > 0) {
                response.sendRedirect("/views/allStudents.jsp");
            } else {
                System.out.println("Student NOT updated");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
