package Controller;

import java.util.List;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import Connection.ToDoDAO;
import Model.TodoList;

public class ToDoControl {

    // atributos
    private List<TodoList> todolist;
    private DefaultTableModel tableModel;
    private JTable table;

    // construtor
    public ToDoControl(List<TodoList> todolist, DefaultTableModel tableModel, JTable table) {
        this.todolist = todolist;
        this.tableModel = tableModel;
        this.table = table;
    }

    // métodos do modelo CRUD
    // Método para atualizar a tabela de exibição com dados do banco de dados
    private void atualizarTabela() {
        tableModel.setRowCount(0); // Limpa todas as linhas existentes na tabela
        todolist = new ToDoDAO().listarTodos();
        // Obtém os clientes atualizados do banco de dados
        for (TodoList todo : todolist) {
            // Adiciona os dados de cada cliente como uma nova linha na tabela Swing
            tableModel.addRow(new Object[] {todo.getTarefa(),
                    todo.getStatus()});
        }
    }

    // Método para cadastrar um novo cliente no banco de dados
    public void cadastrar(int id, String tarefa, String status) {
        new ToDoDAO().cadastrar(id, tarefa, status);
        // Chama o método de cadastro no banco de dados
        atualizarTabela(); // Atualiza a tabela de exibição após o cadastro
    }

    // Método para atualizar os dados de um cliente no banco de dados
    public void atualizar(int i, String tarefa, String status) {
        new ToDoDAO().atualizar(i, tarefa, status);
        // Chama o método de atualização no banco de dados
        atualizarTabela(); // Atualiza a tabela de exibição após a atualização
    }

    // Método para apagar um cliente do banco de dados
    public void apagar(int id) {
        new ToDoDAO().apagar(id);
        // Chama o método de exclusão no banco de dados
        atualizarTabela(); // Atualiza a tabela de exibição após a exclusão
    }

    public void criar(int height, String text, String text2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'criar'");
    }

    public void criar(String text, String text2) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'criar'");
    }
}
