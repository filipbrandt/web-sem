package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.PersonController;
import com.example.mvccpool.controllers.StudentController;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeletePersonServlet", value = "/delete-person")
public class DeletePersonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int isDeleted = new PersonController().deletePersonById(Integer.parseInt(request.getParameter("id")));
//            int isDelete = new StudentController().deleteStudentById(Integer.parseInt(request.getParameter("id")));
            if (isDeleted > 0) {
                response.sendRedirect("/views/all-persons.jsp");
            } else {
                System.out.println("Person NOT updated");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
