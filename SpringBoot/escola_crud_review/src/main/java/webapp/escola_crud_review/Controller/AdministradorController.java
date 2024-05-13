package webapp.escola_crud_review.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import webapp.escola_crud_review.Model.Administrador;
import webapp.escola_crud_review.Repository.AdministradorRepository;
import webapp.escola_crud_review.Repository.VerificaCadastroAdmRepository;
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


    // se admin logado acessa a interna
    @GetMapping("login-adm")
    public ModelAndView logadoAdmin(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("login/login-adm");
        if (acessoInternoAdm) {
            System.out.println("Login já foi realizado");
            mv.setViewName("interna/interna-adm");
        }
        return mv;

    }

    @PostMapping("acesso-adm")
    public ModelAndView acessoAdmLogin(@RequestParam String cpf, @RequestParam String senha,
            RedirectAttributes attributes) {

        ModelAndView mv = new ModelAndView("redirect:/interna-adm"); // Página interna de acesso
        try {
            // boolean acessoCPF = cpf.equals(ar.findByCpf(cpf).getCpf());
            boolean acessoCPF = ar.existsById(cpf);
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
                attributes.addFlashAttribute("msg", mensagem);
                attributes.addFlashAttribute("classe", "vermelho");
                mv.setViewName("redirect:/login-adm");
            }
        } catch (Exception e) {
            String mensagem = "Login Não Efetuado";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
            mv.setViewName("redirect:/login-adm");
        }

        return mv;
    }

<<<<<<< HEAD
    @GetMapping("/interna-adm")
    public String acessoPageInternaAdm(RedirectAttributes attributes) {
        String acesso = "";
        ModelAndView mv = new ModelAndView();
=======
    @GetMapping("interna-adm")
    public ModelAndView acessoPageInternaAdm(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("redirect:/interna-adm");
>>>>>>> 693a32df9c8b09a8fd4b19fca6a6502fb79e22af
        if (acessoInternoAdm) {
            System.out.println("Acesso Permitido");
            mv.setViewName("interna/interna-adm");

        } else {
            String mensagem = "Acesso não Permitido - faça Login";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
            mv.setViewName("redirect:/login-adm");
        }

<<<<<<< HEAD
        return acesso;
=======
        return mv;
>>>>>>> 693a32df9c8b09a8fd4b19fca6a6502fb79e22af

    }

    @PostMapping("logout-adm")
    public ModelAndView logoutAdm(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("redirect:/interna-adm");
        attributes.addFlashAttribute("msg", "Logout Efetuado");
        attributes.addFlashAttribute("classe", "vermelho");
        acessoInternoAdm = false;
        return mv;
    }

    

    // cadastro do aluno

    @GetMapping("cad-aluno-adm")
    public ModelAndView acessoCadAluno(RedirectAttributes attributes) {
        
        ModelAndView mv = new ModelAndView("interna/cad-aluno-adm");
        if (acessoInternoAdm) {
            System.out.println("Acesso Permitido");
            

        } else {
            String mensagem = "Acesso não Permitido - faça Login";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
            mv.setViewName("redirect:/login-adm");
        }
    return mv;
    }
}
