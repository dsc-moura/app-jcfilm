package br.com.app.jcfilm.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.app.jcfilm.model.Veiculo;
import br.com.app.jcfilm.service.VeiculoService;

@RestController
@RequestMapping("/api")
public class VeiculoCommandController {

	@Autowired
	VeiculoService veiculoService;
	
	@PostMapping("/veiculo/save")
	public ResponseEntity<String> save(@Valid Veiculo Veiculo) {	
				
		if(Veiculo.getId() == 0) {			
			Veiculo verifica = veiculoService.findByNome(Veiculo.getNome());
			
			if(verifica == null) {
				if(veiculoService.save(Veiculo) == null) {				
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível efetuar o cadastro!");
				}
				
				return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro efetuado com Sucesso!");			
			}
			
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Veiculo já cadastrada!");
		}else {
						
			if(veiculoService.update(Veiculo) == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível alterar o cadastro!");				
			}
				
			return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro alterado com Sucesso!");				
		}		
	}
	
	@DeleteMapping("veiculo/{id}")
	public ResponseEntity<String> DeleteVeiculo(@PathVariable int id){
		Veiculo Veiculo = veiculoService.findById(id);
		if(Veiculo == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível excluir o cadastro!");	
		}
		
		veiculoService.delete(Veiculo);
		
		return ResponseEntity.ok().body("Veiculo excluída com sucesso!");
	}
}
