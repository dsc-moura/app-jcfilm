package br.com.app.jcfilm.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.app.jcfilm.model.Cliente;
import br.com.app.jcfilm.repository.IClienteRepository;
import br.com.app.jcfilm.repository.IClienteVeiculoRepository;

@Service
public class ClienteService {
	
	@Autowired
	IClienteRepository clienteRepository;
	
	@Autowired
	IClienteVeiculoRepository clienteVeiculoRepository;
		
	public Cliente save(Cliente cliente) {
		cliente = transformaObjetoToUpperCase(cliente);
		return clienteRepository.save(cliente);
	}
	
	public List<Cliente> findByNomeCpfTelefone(String parametro){
		return clienteRepository.findByNomeCpfTelefone("%"+parametro+"%");
	}
	
	public List<Cliente> findByNomeCpfTelefonePlaca(String parametro){
		return clienteRepository.findByNomeCpfTelefonePlaca("%"+parametro+"%");
	}
	
	public Cliente update(Cliente cliente) {		
		Cliente resultado = clienteRepository.findById(cliente.getId());
		
		BeanUtils.copyProperties(cliente, resultado,"id");
		
		return clienteRepository.save(cliente);
	}
	
	public Cliente findById(int id) {
		return clienteRepository.findById(id);
	}
	
	public List<Cliente> findAll(){
		return clienteRepository.findAll();
	}
	
	public Cliente findByCpfTelefone(String parametro) {
		return clienteRepository.findByCpfTelefone("%"+parametro+"%");
	}
	
	public void delete(Cliente cliente) {
		clienteVeiculoRepository.removeVeiculosCliente(cliente.getId());
		clienteRepository.delete(cliente);		
	}	
	
	public Cliente transformaObjetoToUpperCase(Cliente obj) {
		Cliente cliente = new Cliente();
		cliente = obj;
		cliente.setNome(obj.getNome().toUpperCase());	
		cliente.setSobrenome(obj.getSobrenome().toUpperCase());
		
		if(obj.getBairro()!= null) {
			cliente.setBairro(obj.getBairro().toUpperCase());
		}
		if(obj.getEndereco()!= null) {
			cliente.setEndereco(obj.getEndereco().toUpperCase());
		}
		if(obj.getComplemento() != null) {
			cliente.setComplemento(obj.getComplemento().toUpperCase());
		}		
		
		return cliente;
	}
}
