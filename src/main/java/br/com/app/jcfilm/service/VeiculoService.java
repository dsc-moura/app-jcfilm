package br.com.app.jcfilm.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import br.com.app.jcfilm.model.Veiculo;
import br.com.app.jcfilm.repository.IVeiculoRepository;

@Service
public class VeiculoService {
	@Autowired
	IVeiculoRepository veiculoRepository;
	
	public List<Veiculo> findAll(){
		return veiculoRepository.findAll();
	}
	
	public Veiculo save(Veiculo veiculo) {
		return veiculoRepository.save(veiculo);
	}
	
	public List<Veiculo> findByName(String parametro){
		return veiculoRepository.findByName("%"+parametro+"%");
	}
	
	public Veiculo findById(int id) {
		return veiculoRepository.findById(id);
	}
	
	public Veiculo findByNome(String parametro) {
		return veiculoRepository.findByNome(parametro);
	}
	
	public Veiculo update(Veiculo veiculo) {
		Veiculo vl = veiculoRepository.findById(veiculo.getId());
		
		BeanUtils.copyProperties(veiculo, vl,"id");
		
		return veiculoRepository.save(veiculo);
	}
	
	public Veiculo remove(int id) {
		return veiculoRepository.removeById(id);
	}
	
	public void delete(Veiculo veiculo) {
		veiculoRepository.delete(veiculo);
	}
}
