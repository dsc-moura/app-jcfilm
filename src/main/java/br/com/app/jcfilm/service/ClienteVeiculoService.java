package br.com.app.jcfilm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.app.jcfilm.model.ClienteVeiculo;
import br.com.app.jcfilm.repository.IClienteVeiculoRepository;

@Service
public class ClienteVeiculoService {

	@Autowired
	IClienteVeiculoRepository clienteVeiculoRepository;
	
	public void removeVeiculosCliente(int id) {		
		clienteVeiculoRepository.removeVeiculosCliente(id);		
	}
	
	public ClienteVeiculo save(ClienteVeiculo cliente) {
		return clienteVeiculoRepository.save(cliente);
	}
}
