package br.com.app.jcfilm.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.app.jcfilm.model.Marca;
import br.com.app.jcfilm.repository.IMarcaRepository;

@Service
public class MarcaService {

	@Autowired
	IMarcaRepository marcaRepository;
	
	public List<Marca> findAll(){
		return marcaRepository.findAll();
	}
	
	public Marca findByNome(String nome){
		return marcaRepository.findByNome(nome);
	} 
	
	public Marca findById(int id){
		return marcaRepository.findById(id);
	}
	
	public List<Marca> findByName(String parametro){
		return marcaRepository.findByName("%"+parametro+"%");
	}
	
	public Marca save(Marca marca) {
		return marcaRepository.save(marca);
	}
	
	public void delete(Marca marca) {
		marcaRepository.delete(marca);
	} 
	
	public Marca update(Marca marca) {
		Marca mc = marcaRepository.findById(marca.getId());
		
		BeanUtils.copyProperties(marca, mc,"id");
		
		return marcaRepository.save(marca);
	}
}
