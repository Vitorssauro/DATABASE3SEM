package webapp.escola_crud_review.Repository;

import org.springframework.data.repository.CrudRepository;

import webapp.escola_crud_review.Model.VerificaCadastroAdm;

public interface VerificaCadastroAdmRepository extends CrudRepository<VerificaCadastroAdm, String>{
    VerificaCadastroAdm findByCpf(String cpf);
}
