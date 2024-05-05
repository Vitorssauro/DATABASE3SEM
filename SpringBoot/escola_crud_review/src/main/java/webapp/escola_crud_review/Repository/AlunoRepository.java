package webapp.escola_crud_review.Repository;

import org.springframework.data.repository.CrudRepository;

import webapp.escola_crud_review.Model.Aluno;

public interface AlunoRepository extends CrudRepository<Aluno, String> {
    Aluno findByRa(String ra);
    Aluno findBySenha(String senha);
}
