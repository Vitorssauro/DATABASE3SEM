package webapp.escola_crud_review.Repository;

import org.aspectj.apache.bcel.util.ClassLoaderRepository;

import webapp.escola_crud_review.Model.VerificaCadastroAdm;

public class VerificaCadastroAdmRepository extends CrudRepository<VerificaCadastroAdm, String>{
    VerificaCadastroAdm findByCpf(String cpf);
}
