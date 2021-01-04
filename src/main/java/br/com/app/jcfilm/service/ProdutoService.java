package br.com.app.jcfilm.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.app.jcfilm.model.Produto;
import br.com.app.jcfilm.repository.IProdutoRepository;

@Service
public class ProdutoService {

	@Autowired
	IProdutoRepository produtoRepository;
	
	public List<Produto> findAll(){
		return produtoRepository.findAll();
	}
	
	public List<Produto> findByName(String parametro){
		return produtoRepository.findByName("%"+parametro+"&");
	}
	
	public void delete(Produto produto) {
		produtoRepository.delete(produto);
	}
	
	public Produto findById(int id) {
		return produtoRepository.findById(id);
	}
	
	public Produto save(Produto produto) {
		return produtoRepository.save(produto);
	}
	
	public Produto findByNome(String parametro) {
		return produtoRepository.findByNome(parametro);
	}
	
	public Produto update(Produto produto) {
		Produto prod = produtoRepository.findById(produto.getId());
		
		BeanUtils.copyProperties(produto, prod,"id");
		
		return produtoRepository.save(produto);
	}
	
}
