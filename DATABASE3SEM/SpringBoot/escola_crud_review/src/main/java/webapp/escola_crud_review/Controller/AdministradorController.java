package webapp.escola_crud_review.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import webapp.escola_crud_review.Model.Administrador;
import webapp.escola_crud_review.Repository.AdministradorRepository;
import webapp.escola_crud_review.Repository.VerificaCadastroAdmRepository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdministradorController {

    // atributos da classe
    boolean acessoInternoAdm = false;

    @Autowired
    private AdministradorRepository ar;

    @Autowired
    private VerificaCadastroAdmRepository vcar;

    // metodos
    @PostMapping("cadastrar-adm")
    public ModelAndView cadastrarAdmBD(Administrador adm) {

        boolean verificaCpf = vcar.existsById(adm.getCpf());

        ModelAndView mv = new ModelAndView("login/login-adm");

        if (verificaCpf) {

            ar.save(adm);
            String mensagem = "Cadastro realizado com sucesso!!!";
            System.out.println(mensagem);
            mv.addObject("msg", mensagem);
            mv.addObject("classe", "verde");

        } else {
            String mensagem = "Cadastro NÃO realizado . . . ";
            System.out.println(mensagem);
            mv.addObject("msg", mensagem);
            mv.addObject("classe", "vermelho");
        }

        return mv;
    }

    @PostMapping("acesso-adm")
    public ModelAndView acessoAdmLogin(@RequestParam String cpf, @RequestParam String senha,
            RedirectAttributes attributes) {

        ModelAndView mv = new ModelAndView("redirect:/interna-adm"); // Página interna de acesso

        boolean acessoCPF = cpf.equals(ar.findByCpf(cpf).getCpf());
        boolean acessoSenha = senha.equals(ar.findByCpf(cpf).getSenha());

        if (acessoCPF && acessoSenha) {
            String mensagem = "Login Realizado com sucesso";
            System.out.println(mensagem);
            acessoInternoAdm = true;
            mv.addObject("msg", mensagem);
            mv.addObject("classe", "verde");

        } else {
            String mensagem = "Login Não Efetuado";
            System.out.println(mensagem);
            mv.addObject("msg", mensagem);
            mv.addObject("classe", "vermelho");
            mv.setViewName("redirect:/login-adm");
        }

        return mv;
    }

    @GetMapping("/interna-adm")
    public String acessoPageInternaAdm() {
        String acesso = "";
        ModelAndView mv = new ModelAndView();
        if (acessoInternoAdm) {
            System.out.println("Acesso Permitido");
            acesso = "interna/interna-adm";

        } else {
            String mensagem = "Acesso não Permitido - faça Login";
            System.out.println(mensagem);
            mv.addObject("msg", mensagem);
            mv.addObject("classe", "vermelho");
            mv.setViewName("redirect:/login-adm");
        }

        return acesso;
        
    }

}
