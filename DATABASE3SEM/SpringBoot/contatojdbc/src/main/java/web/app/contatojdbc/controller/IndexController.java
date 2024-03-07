package web.app.contatojdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.app.contatojdbc.connection.EmailDAO;

@Controller
public class IndexController {
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView abrirIndex() {
        ModelAndView mv = new ModelAndView("index");
        EmailDAO obj = new EmailDAO();
        String mensagem = "Olá, seja bem-vinda(o)!";
        mv.addObject("msg", mensagem);
        obj.criaTabela();
        return mv;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView buscarIndex(@RequestParam("email") String email) {
        ModelAndView mv = new ModelAndView("index");

        new EmailDAO().cadastrar(email);

        return mv;
    }
}
