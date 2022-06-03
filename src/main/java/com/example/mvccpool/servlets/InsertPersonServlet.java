package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.PersonController;
import com.example.mvccpool.controllers.UserController;
import com.example.mvccpool.models.Person;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "InsertPersonServlet", value = "/insert-person")
public class InsertPersonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Person person = new Person(
                request.getParameter("name"),
                request.getParameter("email")
        );

        try {
            if(new PersonController().insertPerson(person) > 0) {
                System.out.println("Person Inserted");
                response.sendRedirect("/views/all-persons.jsp");
            } else {
                System.out.println("User NOT Inserted");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
