package webapp.escola_crud_review.Model;

import java.io.Serializable;

import jakarta.persistence.Id;

// fazer entity
public class VerificaCadastroAdm implements Serializable {
    // atributos
    @Id
    String cpf;
    String nome;

    public String getCpf() {
        return cpf;
    }
}
