package com.example.mvccpool.controllers;
import com.example.mvccpool.Database;
import com.example.mvccpool.models.Car;
import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarController {

    public int getLastCarByUserId(int userId_) throws SQLException, NamingException {
        Connection connection = Database.getConnection();

        String sql = "SELECT * FROM cars WHERE userId = ? ORDER BY id DESC LIMIT 1";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userId_);

        ResultSet resultSet = preparedStatement.executeQuery();

        Car car = null;
        while(resultSet.next()){
             car = new Car(
                    resultSet.getInt("id"),
                    resultSet.getString("make"),
                    resultSet.getString("model"),
                    resultSet.getInt("year"),
                    resultSet.getString("fuel"),
                    resultSet.getString("transmission"),
                    resultSet.getInt("power"),
                    resultSet.getInt("driven"),
                    resultSet.getString("description"),
                    resultSet.getInt("userId")
            );
        }

        connection.close();
        return car.getId();
    }

    public void deleteCarById(int id_) throws SQLException, NamingException {
        Connection connection = Database.getConnection();

        String sql = "DELETE FROM cars WHERE id = ?;";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id_);

        preparedStatement.executeUpdate();
        connection.close();
    }

    public void updateCar(Car car) throws SQLException, NamingException {
        Connection connection = Database.getConnection();

        String sql = "UPDATE cars SET make = ?, model = ?, year = ?, fuel = ?, transmission = ?, power = ?, driven = ?, description = ? WHERE id = ?;";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, car.getMake());
        preparedStatement.setString(2, car.getModel());
        preparedStatement.setInt(3, car.getYear());
        preparedStatement.setString(4, car.getFuel());
        preparedStatement.setString(5, car.getTransmission());
        preparedStatement.setInt(6, car.getPower());
        preparedStatement.setInt(7, car.getDriven());
        preparedStatement.setString(8, car.getDescription());
        preparedStatement.setInt(9, car.getId());
        preparedStatement.executeUpdate();

        connection.close();
    }

    public int insertCar(Car car) throws SQLException, NamingException {
        Connection connection = Database.getConnection();

        String sql = "INSERT INTO cars (make, model, year, fuel, transmission, power, driven, description, userId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, car.getMake());
        preparedStatement.setString(2, car.getModel());
        preparedStatement.setInt(3, car.getYear());
        preparedStatement.setString(4, car.getFuel());
        preparedStatement.setString(5, car.getTransmission());
        preparedStatement.setInt(6, car.getPower());
        preparedStatement.setInt(7, car.getDriven());
        preparedStatement.setString(8, car.getDescription());
        preparedStatement.setInt(9, car.getUserId());

//        connection.close();

        return preparedStatement.executeUpdate();
    }

    public Car getCarById(int id_) throws SQLException, NamingException {
        Car car = null;
        Connection connection = Database.getConnection();

        String sql = "SELECT * FROM cars WHERE id = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id_);

        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            car = new Car(
                    resultSet.getInt("id"),
                    resultSet.getString("make"),
                    resultSet.getString("model"),
                    resultSet.getInt("year"),
                    resultSet.getString("fuel"),
                    resultSet.getString("transmission"),
                    resultSet.getInt("power"),
                    resultSet.getInt("driven"),
                    resultSet.getString("description"),
                    resultSet.getInt("userId")
            );
        }
        connection.close();
        return car;
    }



    public ArrayList<Car> getCarsByUser(int userId_) throws SQLException, NamingException {
        ArrayList<Car> cars = new ArrayList<>();

        Connection connection = Database.getConnection();

        String sql = "SELECT * FROM cars WHERE userId = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userId_);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            cars.add(new Car(
                    resultSet.getInt("id"),
                    resultSet.getString("make"),
                    resultSet.getString("model"),
                    resultSet.getInt("year"),
                    resultSet.getString("fuel"),
                    resultSet.getString("transmission"),
                    resultSet.getInt("power"),
                    resultSet.getInt("driven"),
                    resultSet.getString("description"),
                    resultSet.getInt("userId")
            ));
        }
        connection.close();
        return cars;
    }

    public ArrayList<Car> getAllCarsLimit(int limit_) throws SQLException, NamingException {
        ArrayList<Car> cars = new ArrayList<>();

        System.out.println("Pripajam sa");
        Connection connection = Database.getConnection();
        System.out.println("som pripojeny");

        String sql = "SELECT * FROM cars ORDER BY id DESC LIMIT ?";



        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, limit_);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            cars.add(new Car(
                    resultSet.getInt("id"),
                    resultSet.getString("make"),
                    resultSet.getString("model"),
                    resultSet.getInt("year"),
                    resultSet.getString("fuel"),
                    resultSet.getString("transmission"),
                    resultSet.getInt("power"),
                    resultSet.getInt("driven"),
                    resultSet.getString("description"),
                    resultSet.getInt("userId")
            ));
        }
        connection.close();
        return cars;
    }



    public ArrayList<Car> getAllCars() throws SQLException, NamingException {
        ArrayList<Car> cars = new ArrayList<>();

        System.out.println("Pripajam sa");
        Connection connection = Database.getConnection();
        System.out.println("som pripojeny");

        String sql = "SELECT * FROM cars ORDER BY id DESC";


        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            cars.add(new Car(
                    resultSet.getInt("id"),
                    resultSet.getString("make"),
                    resultSet.getString("model"),
                    resultSet.getInt("year"),
                    resultSet.getString("fuel"),
                    resultSet.getString("transmission"),
                    resultSet.getInt("power"),
                    resultSet.getInt("driven"),
                    resultSet.getString("description"),
                    resultSet.getInt("userId")
            ));
        }
        connection.close();
        return cars;
    }
}

