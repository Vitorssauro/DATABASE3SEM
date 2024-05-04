package webapp.escola_crud_review.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import webapp.escola_crud_review.Model.Aluno;
import webapp.escola_crud_review.Repository.AlunoRepository;

public class AlunoController {

    @Autowired
    private AlunoRepository alr;


    @PostMapping("cadastrar-aluno")
    public ModelAndView cadastrarAlunoBD(Aluno aluno) {

        ModelAndView mv = new ModelAndView("interna/cad-aluno-adm");

        try {
            alr.save(aluno);
            String mensagem = "Cadastro do aluno realizado!!!";
            System.out.println(mensagem);
            mv.addObject("msg", mensagem);
            mv.addObject("classe", "verde");

        } catch (Exception e) {
            String mensagem = "Cadastro do aluno NÃO realizado . . . ";
            System.out.println(mensagem);
            mv.addObject("msg", mensagem);
            mv.addObject("classe", "vermelho");
        }

        return mv;
    }
}
