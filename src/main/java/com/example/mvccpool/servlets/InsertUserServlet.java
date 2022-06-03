package com.example.mvccpool.servlets;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.mvccpool.controllers.CarController;
import com.example.mvccpool.controllers.UserController;
import com.example.mvccpool.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "InsertUserServlet", value = "/insert-user")
public class InsertUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hashPassword = BCrypt.withDefaults().hashToString(
                12, request.getParameter("password").toCharArray()
        );
        User user = new User(
                request.getParameter("email"),
                hashPassword,
                request.getParameter("name"),
                request.getParameter("phone")
        );

        try {
            if(new UserController().insertUser(user) > 0) {
                System.out.println("User Inserted");
                response.sendRedirect("/views/login-form.jsp");
            } else {
                System.out.println("User NOT Inserted");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
