package com.example.mvccpool.servlets;

import com.example.mvccpool.controllers.CarController;
import com.example.mvccpool.controllers.FileController;
import com.example.mvccpool.models.Car;
import com.example.mvccpool.models.File;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;


@WebServlet(name = "InsertCarServlet", value = "/insert-car")
@MultipartConfig(fileSizeThreshold=1024*1024,
        maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class InsertCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Car car = new Car(
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

        try {
            System.out.println("Som v Try");
            Part part = request.getPart("profile_img");
            System.out.println("Som za request");

            String fileName = part.getSubmittedFileName();
            String randomFileName = UUID.randomUUID().toString();
            String ext = fileName.split("\\.")[1];


            String path = getServletContext().getRealPath("/");
            path += "uploads/";

            String fullPath = path + randomFileName + "." + ext;
            System.out.println("vztvoril som full path");
            System.out.println(fullPath);
            part.write(fullPath);

            System.out.println("writol som full path");

            File file = new File(
                    randomFileName + "." + ext,
                    car.getId()
            );

            System.out.println("before isnerCar");
            CarController carController = new CarController();
            if(carController.insertCar(car) > 0){
                file.setCarId(carController.getLastCarByUserId(car.getUserId()));
                if(new FileController().insertFile(file) > 0){
                    System.out.println("Car Inserted");
                    response.sendRedirect("/views/allCars.jsp");
                }
            } else {
                System.out.println("Car NOT Inserted");
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }
}
