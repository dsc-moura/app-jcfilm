package br.com.app.jcfilm.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.app.jcfilm.model.Cliente;
import br.com.app.jcfilm.model.ClienteVeiculo;
import br.com.app.jcfilm.model.Venda;
import br.com.app.jcfilm.service.ClienteService;
import br.com.app.jcfilm.service.ClienteVeiculoService;
import br.com.app.jcfilm.service.VendaService;

@RestController
@RequestMapping("/api")
public class ClienteCommandController {
	
	@Autowired
	ClienteService clienteService;
	
	@Autowired
	VendaService vendaService;
	
	@Autowired
	ClienteVeiculoService clienteVeiculoService;
	
	@PostMapping("/cliente/save")
	public ResponseEntity<String> save(@Valid Cliente cliente) {	
				
		if(cliente.getId() == 0) {				
			if(clienteService.save(cliente) == null) {				
				return ResponseEntity.badRequest().body("Não foi possível efetuar o cadastro");
			}
			
			return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro efetuado com Sucesso");			
			
		}else {
						
			if(clienteService.update(cliente) == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível alterar o cadastro");				
			}
				
			return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro alterado com Sucesso");				
		}		
	}
	
	@PostMapping("/cliente/veiculo/save")
	public ResponseEntity<String> SaveClienteVeiculo(@RequestBody ClienteVeiculo veiculo){
		if(veiculo.getCliente().getId() == 0) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Selecione o Cliente dono do veiculo!");
		}
		
		veiculo.setPlaca(veiculo.getPlaca().toUpperCase());
		
		if(clienteVeiculoService.save(veiculo) == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível cadastrar o veiculo!");
		}	
		
		return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro efetuado com Sucesso");		
	}
	
	@DeleteMapping("cliente/delete/{id}")
	public ResponseEntity<String> DeleteCliente(@PathVariable int id){
		Cliente cliente = clienteService.findById(id);
		Venda venda = vendaService.findVendaByIdCliente(id);
		
		if(venda == null) {
			if(cliente == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível excluir o cadastro!");	
			}
			
			clienteService.delete(cliente);
			
			return ResponseEntity.ok().body("Cliente excluído com sucesso");
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível excluir o cadastro o cliente possui vendas cadastradas!!");
	}
		
}
