package webapp.escola_crud_review.Controller;

import org.springframework.stereotype.Controller;

import webapp.escola_crud_review.Model.Administrador;
import webapp.escola_crud_review.Repository.AdministradorRepositoy;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdministradorController {

    private AdministradorRepositoy ar;

    @PostMapping("/cadastrar-adm")
    public String cadastrarAdmBD(Administrador adm) {
        // TODO: process POST request
        ar.save(adm);
        System.out.println("Cadastro realizado com sucesso!!!");
        return "login/login-adm";
    }

}
