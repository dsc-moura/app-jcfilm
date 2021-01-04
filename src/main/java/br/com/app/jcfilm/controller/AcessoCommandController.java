package br.com.app.jcfilm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.app.jcfilm.model.Acesso;
import br.com.app.jcfilm.service.AcessoService;

@RestController
@RequestMapping("/api")
public class AcessoCommandController {

	@Autowired
	AcessoService acessoService;
	
	@PostMapping("/acesso/save")
	public ResponseEntity<String> save(Acesso acesso) {			
		
		if(acesso.getId() == 0) {					
			return ResponseEntity.badRequest().body("Não foi possível conceder o acesso");
		}else {
			if(acesso.isPermissao()) {
				if(acessoService.update(acesso) == null) {				
					return ResponseEntity.ok().body("Acesso concedido sucesso");		
				}	
				return ResponseEntity.badRequest().body("Não foi possível conceder o acesso");
			}			
			return ResponseEntity.badRequest().body("Não foi possível conceder o acesso");
		}			
	}	
}
