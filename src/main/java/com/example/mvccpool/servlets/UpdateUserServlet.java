package com.example.mvccpool.servlets;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.mvccpool.Database;
import com.example.mvccpool.controllers.UserController;
import com.example.mvccpool.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "UpdateUserServlet", value = "/update-user")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log("som v Servlete");

        String hashPassword = BCrypt.withDefaults().hashToString(
                12, request.getParameter("password").toCharArray()
        );
        User user = new User(
                request.getParameter("email"),
                hashPassword,
                request.getParameter("name"),
                request.getParameter("phone")
        );
            log("som pred user Controller");
            UserController userController = new UserController();
        try {
            userController.updateUser(user);
            System.out.println("som pred redirect");
            response.sendRedirect("/views/userProfile.jsp");
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
