package webapp.hello_wolrd.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Autor: Rolfi Luz - Senai
 */
@Controller
public class indexController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView abrirIndex() {
        ModelAndView mv = new ModelAndView("index");

        String mensagem = "Olá, seja bem-vinda(o)!";
        mv.addObject("msg", mensagem);

        return mv;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView buscarIndex(@RequestParam("nome") String nome,
                                    @RequestParam("email") String email,
                                    @RequestParam("fone") String fone) {
        ModelAndView mv = new ModelAndView("index");

        String mensagem = "Cadastrdo com Sucesso!";
        mv.addObject("msg", mensagem);
        mv.addObject("buscar1", nome);
        mv.addObject("buscar2", email);
        mv.addObject("buscar3", fone);

        return mv;
    }
}
