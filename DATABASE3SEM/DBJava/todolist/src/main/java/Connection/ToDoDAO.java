package Connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.TodoList;

public class ToDoDAO {

    // atributo
    private Connection connection;
    private List<TodoList> todolist;

    // construtor
    public ToDoDAO() {
        this.connection = ConnectionFactory.getConnection();
    }

    // criar Tabela
    public void criaTabela() {
        String sql = "CREATE TABLE IF NOT EXISTS todo_list (ID SERIAL PRIMARY KEY, TAREFA VARCHAR(255), STATUS VARCHAR(255))";
        try (Statement stmt = this.connection.createStatement()) {
            stmt.execute(sql);
            System.out.println("Tabela criada com sucesso.");
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao criar a tabela: " + e.getMessage(), e);
        } finally {
            ConnectionFactory.closeConnection(this.connection);
        }
    }

    // Listar todos os valores cadastrados
    public List<TodoList> listarTodos() {
        PreparedStatement stmt = null;
        // Declaração do objeto PreparedStatement para executar a consulta
        ResultSet rs = null;
        // Declaração do objeto ResultSet para armazenar os resultados da consulta
        todolist = new ArrayList<>();
        // Cria uma lista para armazenar os carros recuperados do banco de dados
        try {
            String sql = "SELECT * FROM todo_list";
            stmt = connection.prepareStatement(sql);
            // Prepara a consulta SQL para selecionar todos os registros da tabela
            rs = stmt.executeQuery();
            // Executa a consulta e armazena os resultados no ResultSet
            while (rs.next()) {
                // Para cada registro no ResultSet, cria um objeto todo com os valores do
                // registro

                TodoList todo = new TodoList(
                        rs.getInt("id"),
                        rs.getString("tarefa"),
                        rs.getString("status"), sql);
                todolist.add(todo); // Adiciona o objeto todo à lista de todo
            }
        } catch (SQLException ex) {
            System.out.println(ex); // Em caso de erro durante a consulta, imprime o erro
        } finally {
            ConnectionFactory.closeConnection(connection, stmt, rs);

            // Fecha a conexão, o PreparedStatement e o ResultSet
        }
        return todolist; // Retorna a lista de todo recuperados do banco de dados
    }

    // Cadastrar Carro no banco
    public void cadastrar(int id, String tarefa, String status) {
        PreparedStatement stmt = null;
        // Define a instrução SQL parametrizada para cadastrar na tabela
        String sql = "INSERT INTO todo_list (id, tarefa, status) VALUES (?, ?, ?)";
        try {
            stmt = connection.prepareStatement(sql);

            stmt.setInt(1, id);
            stmt.setString(2, tarefa);
            stmt.setString(3, status);
            stmt.executeUpdate();
            System.out.println("Dados inseridos com sucesso");
        } catch (

        SQLException e) {
            throw new RuntimeException("Erro ao inserir dados no banco de dados.", e);
        } finally {
            ConnectionFactory.closeConnection(connection, stmt);
        }
    }

    // Atualizar dados no banco
    public void atualizar(int id, String tarefa, String status) {
        PreparedStatement stmt = null;
        // Define a instrução SQL parametrizada para atualizar dados pelo cpf
        String sql = "UPDATE todo_list SET WHERE id = ?, tarefa = ?, status = ?";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setString(2, tarefa);
            stmt.setString(3, status);
            // cpf é a chave primaria não pode ser alterada.
            stmt.setInt(4, id);
            stmt.executeUpdate();
            System.out.println("Dados atualizados com sucesso");
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar dados no banco de dados.", e);
        } finally {
            ConnectionFactory.closeConnection(connection, stmt);
        }
    }

    // Apagar dados do banco
    public void apagar(int cpf) {
        PreparedStatement stmt = null;
        // Define a instrução SQL parametrizada para apagar dados pelo cpf
        String sql = "DELETE FROM todo_list WHERE cpf = ?";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, cpf);
            stmt.executeUpdate(); // Executa a instrução SQL
            System.out.println("Dado apagado com sucesso");
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao apagar dados no banco de dados.", e);
        } finally {
            ConnectionFactory.closeConnection(connection, stmt);
        }
    }
}
