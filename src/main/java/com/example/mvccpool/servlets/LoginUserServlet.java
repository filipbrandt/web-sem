package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.UserController;
import com.example.mvccpool.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginUserServlet", value = "/login-user")
public class LoginUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("email");
        String password = request.getParameter("password");




        User userInput = new User(login, password, "", ""); // novy konstruktor
        try {

            User user = new UserController().loginUser(userInput);

            if (user != null) {
                // User has correct email and password
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("/views/allCars.jsp");
            } else {
                // Email or password is wrong
                response.sendRedirect("/views/login-form.jsp");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
