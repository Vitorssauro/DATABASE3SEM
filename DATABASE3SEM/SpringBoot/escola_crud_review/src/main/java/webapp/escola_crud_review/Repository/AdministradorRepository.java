package webapp.escola_crud_review.Repository;

import org.springframework.data.repository.CrudRepository;

import webapp.escola_crud_review.Model.Administrador;


public interface AdministradorRepository extends CrudRepository<Administrador, String>{
    Administrador findByCpf(String cpf);
    Administrador findBySenha(String senha);
}
