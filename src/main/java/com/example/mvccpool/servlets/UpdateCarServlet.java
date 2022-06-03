package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.CarController;
import com.example.mvccpool.controllers.UserController;
import com.example.mvccpool.models.Car;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdateCarServlet", value = "/update-car")
public class UpdateCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Car car = new Car(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("make"),
                request.getParameter("model"),
                Integer.parseInt(request.getParameter("year")),
                request.getParameter("fuel"),
                request.getParameter("transmission"),
                Integer.parseInt(request.getParameter("power")),
                Integer.parseInt(request.getParameter("driven")),
                request.getParameter("description"),
                Integer.parseInt(request.getParameter("userId"))
        );

        System.out.println(Integer.parseInt(request.getParameter("year")));
        System.out.println("id:" + car.getId());

        System.out.println("som pred controllerom");
        CarController carController = new CarController();
        System.out.println("som za controllerom");
        try {
            System.out.println("som pred updateCar");
            carController.updateCar(car);
            System.out.println("som za updateCar");
            response.sendRedirect("/views/carSummary.jsp?id=" + car.getId());
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
