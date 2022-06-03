package com.example.mvccpool.controllers;

import com.example.mvccpool.Database;
import com.example.mvccpool.models.Car;
import com.example.mvccpool.models.Person;
import com.example.mvccpool.models.User;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PersonController {

    public int insertPerson(Person person) throws SQLException, NamingException {
        System.out.println("Som v insertPerson");
        Connection connection = Database.getConnection();
        System.out.println("Pripojil som sa");
        String sql = "INSERT INTO persons (name, email) VALUES (?, ?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, person.getName());
        preparedStatement.setString(2, person.getEmail());

        int executeReturn = preparedStatement.executeUpdate();
        connection.close();
        return executeReturn;
    }

    public ArrayList<Person> getAllPersons() throws SQLException, NamingException {
        ArrayList<Person> persons = new ArrayList<>();

        System.out.println("Pripajam sa");
        Connection connection = Database.getConnection();
        System.out.println("Som pripojeny");

        String sql = "SELECT * FROM persons ORDER BY id DESC";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            persons.add(new Person(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("email")
            ));
        }
        connection.close();
        return persons;
    }

    public Person getPersonById(int id_) throws SQLException, NamingException {
        Person person = null;
        System.out.println("Pripajam sa");
        Connection connection = Database.getConnection();
        System.out.println("Som pripojeny");

        String sql = "SELECT * FROM persons WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setInt(1, id_);

        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            person = new Person(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("email")
            );
        }
        connection.close();

        return person;
    }

    public int deletePersonById(int id_) throws SQLException, NamingException {
        System.out.println("Pripajam sa");
        Connection connection = Database.getConnection();
        System.out.println("Som pripojeny");

        String sql = "DELETE FROM persons WHERE ID = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id_);

        int executeReturn = preparedStatement.executeUpdate();
        connection.close();
        return executeReturn;
    }

    public void updatePerson(Person person_) throws SQLException, NamingException {
        System.out.println(person_.getId());
        System.out.println(person_.getName());
        System.out.println(person_.getEmail());

        System.out.println("Pripajam sa");
        Connection connection = Database.getConnection();
        System.out.println("Som pripojeny");

        String sql = "UPDATE persons SET name = ?, email = ? WHERE id = ?;";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, person_.getName());
        preparedStatement.setString(2, person_.getEmail());
        preparedStatement.setInt(3, person_.getId());

        preparedStatement.executeUpdate();
        connection.close();
    }

}
