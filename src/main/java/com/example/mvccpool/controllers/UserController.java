package com.example.mvccpool.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.mvccpool.Database;
import com.example.mvccpool.models.Car;
import com.example.mvccpool.models.Student;
import com.example.mvccpool.models.User;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserController {

//    public User getUserByEmail(String email_) throws SQLException, NamingException {
//
//        String sql = "SELECT * FROM users WHERE email=?";
//        Connection connection = Database.getConnection();
//        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setString(1, email_);
//
//        ResultSet resultSet = preparedStatement.executeQuery();
//
//        String email = resultSet.getString("email");
//        String password = resultSet.getString("password");
//        String name = resultSet.getString("name");
//        String phone = resultSet.getString("phone");
//
//        User user = new User(email, password, name, phone);
//        return user;
//    }

    public User getUserById(int id_) throws SQLException, NamingException {
        User user = null;
        Connection connection = Database.getConnection();
        System.out.println("getUserById after connection");

        String sql = "SELECT * FROM users WHERE id = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id_);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            user = new User(
                    resultSet.getInt("id"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getString("name"),
                    resultSet.getString("phone")
            );
        }
        System.out.println("getUserById before return");
        connection.close();
        return user;
    }


    public void updateUser(User user) throws SQLException, NamingException {
        //insert logic for insert student into database.
        System.out.println(user.getName());
        System.out.println(user.getPhone());
        System.out.println("Som v updateUser");

        String sql = "UPDATE users SET email = ?, password = ?, name = ?, phone = ? WHERE id = 1;";
        System.out.println("Som ya sql");
        Connection connection = Database.getConnection();
        System.out.println("Pripojil som sa");
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, user.getEmail());
        preparedStatement.setString(2, user.getPassword());
        preparedStatement.setString(3, user.getName());
        preparedStatement.setString(4, user.getPhone());
//        preparedStatement.setInt(5, user.getId());

        System.out.println("Som pred execute");
//        String sql = "project_name = '" + project.getProject_name() + "', student_name = '" + project.getStudent_name() + "', difficulty = '" + project.getDifficulty() + "', grade = '" + project.getGrade() + "' WHERE id = " + project.getId()"";
        preparedStatement.executeUpdate();
        connection.close();
        System.out.println("Som za execute");
    }

    public int insertUser(User user) throws SQLException, NamingException {
        System.out.println("Som v insertUser");
        //insert logic for insert student into database.
        Connection connection = Database.getConnection();
        System.out.println("Pripojil som sa");
        String sql = "INSERT INTO users (email, password, name, phone) VALUES (?, ?, ?, ?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, user.getEmail());
        preparedStatement.setString(2, user.getPassword());
        preparedStatement.setString(3, user.getName());
        preparedStatement.setString(4, user.getPhone());


        return preparedStatement.executeUpdate();
    }


    public User loginUser(User user) throws SQLException, NamingException {
        String sql = "SELECT * FROM users WHERE email=?";
        Connection connection = Database.getConnection();
        PreparedStatement
                preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, user.getEmail());

        ResultSet result = preparedStatement.executeQuery();

//        String Name = result.getString("name");

        while (result.next()) {
            // If we have user with email in our db we have to check pass.
            if (result.getString("password") != null) {
                // User with email from login form exists in our DB

                // Get hashed password from DB
                String hashFromDb =
                        result.getString("password");

                // Check if user with email from login form and password
                // is match -> we have to use verify method from BCrypt
                if (BCrypt.verifyer().verify(
                        user.getPassword().toCharArray(),
                        hashFromDb
                ).verified) {
                    // User with email and password match
                    //User userByEmail = getUserByEmail(result.getString("email"));
                    User userResult = new User(
                            result.getInt("id"),
                            result.getString("email"),
                            "",
                            result.getString("name"),
                            result.getString("phone")
                    );

                    connection.close();
                    return userResult;
                } else {
                    // Password is not match -> wrong password
                    return null;
                }
            } else {
                return null;
            }
        }
        connection.close();
        return null;
    }
//    public int insertStudent(Student student) throws SQLException, NamingException {
//        //insert logic for insert student into database.
//        Connection connection = Database.getConnection();
//
//        String sql = "INSERT INTO students (name, faculty_group, gender, age) VALUES (?, ?, ?, ?);";
//        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//
//        preparedStatement.setString(1, student.getName());
//        preparedStatement.setString(2, student.getFaculty_group());
//        preparedStatement.setString(3, student.getGender());
//        preparedStatement.setInt(4, student.getAge());
//
//        return preparedStatement.executeUpdate();
//    }

    /**
     *
     *
     * @param limit
     * @return
     */


//    public ArrayList<Car> getAllCars(String make_, int limit) throws SQLException, NamingException {
//        ArrayList<Car> cars = new ArrayList<>();
//        Connection connection = Database.getConnection();
//
//        String sql = "SELECT * FROM cars WHERE make = ? LIMIT ?";
//
//
//        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setString(1, make_);
//        preparedStatement.setInt(2, limit);
//        ResultSet resultSet = preparedStatement.executeQuery();
//
//        while(resultSet.next()){
//            cars.add(new Car(
//                    resultSet.getInt("id"),
//                    resultSet.getString("make"),
//                    resultSet.getString("model"),
//                    resultSet.getInt("year"),
//                    resultSet.getString("fuel"),
//                    resultSet.getString("transmission"),
//                    resultSet.getInt("power"),
//                    resultSet.getInt("driven"),
//                    resultSet.getString("description")
//            ));
//        }
//        return cars;
//    }
//    public ArrayList<Student> getAllStudents(int limit) throws SQLException, NamingException {
//        ArrayList<Student> students = new ArrayList<>();
//        Connection connection = Database.getConnection();
//
//        String sql = "SELECT * FROM students LIMIT ?";
//
//
//        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setInt(1, limit);
//        ResultSet resultSet = preparedStatement.executeQuery();
//
//        while(resultSet.next()){
//            students.add(new Student(
//                    resultSet.getInt("id"),
//                    resultSet.getString("name"),
//                    resultSet.getString("faculty_group"),
//                    resultSet.getString("gender"),
//                    resultSet.getInt("age")
//            ));
//        }
//        return students;
//    }

//    public int deleteStudentById(int id) throws SQLException, NamingException {
//        Connection connection = Database.getConnection();
//
//        String sql = "DELETE FROM students WHERE ID = ?";
//        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setInt(1, id);
//
//
//        return preparedStatement.executeUpdate();
//    }
}
