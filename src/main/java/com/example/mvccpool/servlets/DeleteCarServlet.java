package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.CarController;
import com.example.mvccpool.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "DeleteCarServlet", value = "/delete-car")
public class DeleteCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CarController carController = new CarController();
        try {
            carController.deleteCarById(Integer.parseInt(request.getParameter("id")));
//            response.sendRedirect("/views/allCars.jsp");
            HttpSession session = request.getSession();
            int userId = ((User)session.getAttribute("user")).getId();
            response.sendRedirect("/views/userProfile.jsp");
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
