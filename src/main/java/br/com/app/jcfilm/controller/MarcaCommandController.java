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

import br.com.app.jcfilm.model.Marca;
import br.com.app.jcfilm.service.MarcaService;

@RestController
@RequestMapping("/api")
public class MarcaCommandController {

	@Autowired
	MarcaService marcaService;
		
	@PostMapping("/marca/save")
	public ResponseEntity<String> save(@Valid Marca marca) {	
				
		if(marca.getId() == 0) {			
			Marca verifica = marcaService.findByNome(marca.getNome());
			
			if(verifica == null) {
				marca.setNome(marca.getNome().toUpperCase());
				
				if(marcaService.save(marca) == null) {				
					return ResponseEntity.badRequest().body("Não foi possível efetuar o cadastro!");
				}
				
				return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro efetuado com Sucesso!");			
			}
			
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Marca já cadastrada!");
		}else {
						
			if(marcaService.update(marca) == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível alterar o cadastro!");				
			}
				
			return ResponseEntity.status(HttpStatus.CREATED).body("Cadastro alterado com Sucesso!");				
		}		
	}
	
	@DeleteMapping("marca/{id}")
	public ResponseEntity<String> DeleteMarca(@PathVariable int id){
		Marca marca = marcaService.findById(id);
		if(marca == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não foi possível excluir o cadastro!");	
		}
		
		marcaService.delete(marca);
		
		return ResponseEntity.ok().body("Marca excluída com sucesso!");
	}
}
