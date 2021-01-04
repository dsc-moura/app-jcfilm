package br.com.app.jcfilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.app.jcfilm.model.Cliente;
import br.com.app.jcfilm.model.Venda;
import br.com.app.jcfilm.service.UsuarioService;
import br.com.app.jcfilm.service.VeiculoService;
import br.com.app.jcfilm.service.VendaService;

@RestController
@RequestMapping("/api")
public class VendaQueryController {

	@Autowired
	UsuarioService usuarioService;
	@Autowired
	VendaService vendaService;
	@Autowired
	VeiculoService veiculoService;
	

	@GetMapping("/venda")
	public ModelAndView venda(Cliente cliente) {
		ModelAndView model = new ModelAndView("tela-cadastro-vendas");
		model.addObject("veiculos", veiculoService.findAll());
		model.addObject("usuarios", usuarioService.findAll());
		
		return model;
	}
	
	@GetMapping("/garantias")
	public ModelAndView garantias() {
		ModelAndView model = new ModelAndView("tela-consulta-garantias");		
		return model;
	}
	
	@GetMapping("/garantias/vendas")
	public ModelAndView findGarantias(){
		ModelAndView model =  new ModelAndView("tabela-lista-servicos-garantias");
		model.addObject("vendas", vendaService.findAll());
		return model;
	}
	
	@GetMapping("/garantias/lista/servicos/{id}")
	public ModelAndView findGarantiasServicos( @PathVariable("id") int id){
		ModelAndView model =  new ModelAndView("tabela-lista-itens-vendidos");
		model.addObject("itens",vendaService.findItensVendidos(id));
		return model;	
	}
	
	@GetMapping("venda/{tipo}/{id}")
	public ModelAndView findVeiculoCliente(@PathVariable("tipo") String tipo, @PathVariable("id") int id){
		ModelAndView model = null;
		
		if(tipo.equalsIgnoreCase("cliente")) {
			model = new ModelAndView("tabela-lista-itens-vendas");
			model.addObject("itens",vendaService.findItensVenda(id));
			return model;				
		}else {
			model = new ModelAndView("tabela-lista-itens-vendas");
			model.addObject("itens",vendaService.findItensVendidos(id));
			return model;		
		}	
	}
	
	@GetMapping("venda/{id}")
	public ResponseEntity<Venda> findVendaById(@PathVariable int id){
		Venda venda = vendaService.findById(id);
		if(venda == null) {
			return ResponseEntity.badRequest().build();
		}		
		return ResponseEntity.ok(venda);
	}
}
