package com.example.mvccpool.controllers;

import com.example.mvccpool.Database;
import com.example.mvccpool.models.Student;

import javax.naming.NamingException;
import java.sql.*;
import java.util.ArrayList;

public class StudentController {
    public int insertStudent(Student student) throws SQLException, NamingException {
        //insert logic for insert student into database.
        Connection connection = Database.getConnection();

        String sql = "INSERT INTO students (name, faculty_group, gender, age) VALUES (?, ?, ?, ?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, student.getName());
        preparedStatement.setString(2, student.getFaculty_group());
        preparedStatement.setString(3, student.getGender());
        preparedStatement.setInt(4, student.getAge());

        return preparedStatement.executeUpdate();
    }

    /**
     *
     * @param limit
     * @return
     */
    public ArrayList<Student> getAllStudents(int limit) throws SQLException, NamingException {
        ArrayList<Student> students = new ArrayList<>();
        Connection connection = Database.getConnection();

        String sql = "SELECT * FROM students LIMIT ?";


        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, limit);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            students.add(new Student(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("faculty_group"),
                    resultSet.getString("gender"),
                    resultSet.getInt("age")
            ));
        }
        return students;
    }

    public int deleteStudentById(int id) throws SQLException, NamingException {
        Connection connection = Database.getConnection();

        String sql = "DELETE FROM students WHERE ID = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);


        return preparedStatement.executeUpdate();
    }
}
