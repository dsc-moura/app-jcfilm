package br.com.app.jcfilm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.app.jcfilm.model.ItemVenda;
import br.com.app.jcfilm.model.Venda;
import br.com.app.jcfilm.service.VendaService;



@RestController
@RequestMapping("/api")
public class VendaCommandController {
	@Autowired
	VendaService vendaService;
	
	@PostMapping("/venda/registrar")
	public ResponseEntity<Venda> inicarVenda(@RequestBody Venda venda){
		Venda sale = vendaService.save(venda);
		if(sale == null) {
			return ResponseEntity.badRequest().build();
		}		
		return ResponseEntity.ok(sale);			
	}
	
	@PostMapping("/venda/adicionar/produto/carrinho")
	public ResponseEntity<ItemVenda> carrinho(@RequestBody List<ItemVenda> carrinho){
		List<ItemVenda> itens = vendaService.findItensVendidos(carrinho.get(0).getVenda().getId());
		
		if(itens.size() > 0) {
			vendaService.limpaCarrinho(itens.get(0).getVenda().getId());
		}
		
		ItemVenda venda = null;
		
		for(ItemVenda item: carrinho) {
			venda = vendaService.save(item);
		}
		
		if(venda == null) {
			return ResponseEntity.badRequest().build();
		}		
		return ResponseEntity.ok(venda);			
	}
	
	@PostMapping("/venda/altera/quantidade/produto")
	public ResponseEntity<ItemVenda> updateQuantidade(@RequestBody ItemVenda itemVenda){		

		ItemVenda venda = vendaService.updateItemVenda(itemVenda);	
		
		if(venda == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
		}	
		
		return ResponseEntity.ok(venda);			
	}
	
	@PostMapping("/venda/finalizar")
	public ResponseEntity<String> finalizarVenda(@RequestBody Venda venda){		

		Venda sale = vendaService.updateVenda(venda);	
		
		if(sale == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
		}	
		
		return ResponseEntity.ok("Venda finalizada com Sucesso!!");			
	} 
	
	@DeleteMapping("venda/remover/produto/carrinho/{id}")
	public ResponseEntity<Integer> removeProdutoCarrinho(@PathVariable int id){
		ItemVenda itemVenda = vendaService.findByIdItemVenda(id);
		
		if(itemVenda == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();	
		}
		
		int id_venda = itemVenda.getVenda().getId();
		
		vendaService.deleteItemVenda(itemVenda);
		
		List<ItemVenda> itens = vendaService.findByItemVendaIdVenda(id_venda);
		
		if(itens.size() == 0) {
			vendaService.excluirVenda(itemVenda.getVenda().getId());
			
			return	ResponseEntity.ok().body(0);
		}
				
		return ResponseEntity.ok().body(id_venda);
	}
	
	@DeleteMapping("venda/cancelar/{id}")
	public ResponseEntity<String> cancelarVenda(@PathVariable int id){
		
		vendaService.limpaCarrinho(id);
		vendaService.excluirVenda(id);
		
		List<ItemVenda> itens = vendaService.findByItemVendaIdVenda(id);
		
		if(itens.size() == 0) {
			if(vendaService.findById(id) == null) {
				return ResponseEntity.ok("Venda cancelada com Sucesso!!");	
			}
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();	
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();		
	}
	
}
