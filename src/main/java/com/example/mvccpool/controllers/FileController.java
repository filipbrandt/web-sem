package com.example.mvccpool.controllers;

import com.example.mvccpool.Database;
import com.example.mvccpool.models.File;
import com.example.mvccpool.models.User;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FileController {

    public int insertFile(File file) throws SQLException, NamingException {
        Connection connection = Database.getConnection();
        String sql = "INSERT INTO images (image, carId) VALUES (?, ?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, file.getImage());
        preparedStatement.setInt(2, file.getCarId());

        return preparedStatement.executeUpdate();
    }

    public File getFileByCarId(int carId_) throws SQLException, NamingException {
        File file = null;
        Connection connection = Database.getConnection();
        System.out.println("getFileByCarId after connection");
        System.out.println("CarId:" + carId_);

        String sql = "SELECT * FROM images WHERE carId = ? LIMIT 1;";

        System.out.println("Som za sql");

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, carId_);
        ResultSet resultSet = preparedStatement.executeQuery();

        System.out.println("som pred while");
        while(resultSet.next()){
            file = new File(
                    resultSet.getInt("id"),
                    resultSet.getString("image"),
                    resultSet.getInt("carId")

            );
        }
        System.out.println("Image Id:" + file.getId());
        System.out.println("FILE SI RETURNED");
        connection.close();
        return file;
    }



}
