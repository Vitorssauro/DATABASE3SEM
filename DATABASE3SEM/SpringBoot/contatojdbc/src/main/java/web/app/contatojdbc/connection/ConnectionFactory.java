package web.app.contatojdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionFactory {

    private static final String url = "jdbc:postgresql://localhost:5432/vitorNoite";

    private static final String usuario = "postgres";

    private static final String senha = "postgres";

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(url, usuario, senha);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao obter conexão com o banco de dados.", e);
        }
    }

    public static void closeConnection(Connection connection) {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void closeConnection(Connection connection, PreparedStatement stmnt) {
        closeConnection(connection);
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}