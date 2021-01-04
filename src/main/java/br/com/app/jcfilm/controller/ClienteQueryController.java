package br.com.app.jcfilm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.app.jcfilm.model.Cliente;
import br.com.app.jcfilm.model.ClienteVeiculo;
import br.com.app.jcfilm.repository.IClienteRepository;
import br.com.app.jcfilm.repository.IClienteVeiculoRepository;
import br.com.app.jcfilm.repository.IVeiculoRepository;
import br.com.app.jcfilm.service.ClienteService;

@RestController
@RequestMapping("/api")
public class ClienteQueryController {

	@Autowired
	IClienteRepository clienteRepository;
	
	@Autowired
	ClienteService ClienteService;
	
	@Autowired
	IClienteVeiculoRepository clienteVeiculoRepository;
	
	@Autowired
	IVeiculoRepository veiculoRepository;
	
	@RequestMapping("/cliente")
	public ModelAndView cliente(Cliente Cliente) {
		ModelAndView model = new ModelAndView("tela-cadastro-clientes");
		model.addObject("veiculos", veiculoRepository.findAll());
		model.addObject("clientes", clienteRepository.findAll());
		return model;
	}	
	
	@GetMapping("/cliente/dados/{id}")
	public ResponseEntity<Cliente> findClienteById(@PathVariable int id){
		Cliente cliente = clienteRepository.findById(id);
		
		if(cliente == null) {
			return ResponseEntity.badRequest().build();
		}		
		return ResponseEntity.ok(cliente);			
	}
		
	@GetMapping("/cliente/pesquisa/{parametro}")
	public ModelAndView findCliente(@PathVariable String parametro){
		ModelAndView model = new ModelAndView("tabela-lista-clientes");
		if(parametro.equalsIgnoreCase("0")) {
			model.addObject("clientes", ClienteService.findAll());
		}else {
			model.addObject("clientes", ClienteService.findByNomeCpfTelefone(parametro));
		}	
		
		return model;
	}
	
	@GetMapping("/cliente/{parametro}")
	public ResponseEntity<Cliente> findClienteByCpf(@PathVariable String parametro){
		Cliente cliente = ClienteService.findByCpfTelefone(parametro);
		
		if(cliente == null) {
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();			
		}
		
		return  ResponseEntity.ok(cliente);		
	}
	
	@GetMapping("/cliente/buscar/{parametro}")
	public ModelAndView findClienteByNomeCpfTelfonePlaca(@PathVariable String parametro){
		ModelAndView model = new ModelAndView("tabela-lista-clientes-pesquisa");
		
		if(parametro.equalsIgnoreCase("0")) {
			model.addObject("clientes", ClienteService.findAll());
		}else {
			model.addObject("clientes", ClienteService.findByNomeCpfTelefonePlaca(parametro));
		}	
		return model;
	}
		
	@GetMapping
	public ResponseEntity<List<Cliente>> findAllClientes(){
		List<Cliente> clientes = clienteRepository.findAll();
		
		if(clientes == null) {
			return ResponseEntity.badRequest().build();
		}
		return ResponseEntity.ok(clientes);
	}
	
	@GetMapping("/cliente/veiculo/{id}")
	public ModelAndView findVeiculoCliente(@PathVariable int id){
		ModelAndView model = new ModelAndView("formulario-cadastro-veiculos");
		model.addObject("clientes",clienteVeiculoRepository.findById(id));		
		return model;
	}
	
	@GetMapping("/cliente/detalhes/cliente/veiculo/{id}")
	public ClienteVeiculo findDetalheVeiculoCliente(@PathVariable int id){
		return clienteVeiculoRepository.findByVeiculoId(id);
	}
	
}
