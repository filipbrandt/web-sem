package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.PersonController;
import com.example.mvccpool.controllers.UserController;
import com.example.mvccpool.models.Person;
import com.example.mvccpool.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdatePersonServlet", value = "/update-person")
public class UpdatePersonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Person person = new Person(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("name"),
                request.getParameter("email")
        );

        PersonController personController = new PersonController();
        try {
            personController.updatePerson(person);
            System.out.println("som pred redirect");
            response.sendRedirect("/views/all-persons.jsp");
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
