package com.example.mvccpool;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class Database {

    public static Connection getConnection() throws NamingException, SQLException {
        DataSource ds;
        Context context;

        context = new InitialContext();
        Context env = (Context) context.lookup("java:/comp/env");
        ds = (DataSource) env.lookup("mvc294");
        return ds.getConnection();
    }

}
