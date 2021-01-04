package br.com.app.jcfilm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import br.com.app.jcfilm.model.ClienteVeiculo;

public interface IClienteVeiculoRepository extends JpaRepository<ClienteVeiculo, Long>{
	@Query(value = "from ClienteVeiculo where id_cliente = :id")
	List<ClienteVeiculo> findById(@Param("id") int id);
	
	@Query(value="from ClienteVeiculo where id = :id")
	ClienteVeiculo findByVeiculoId(@Param("id") int id);
	
	@Modifying
    @Transactional
	@Query(nativeQuery = true, value="delete from jcf_tbl_cad_clientes_veiculos where id_cliente = :id")
	void removeVeiculosCliente(@Param("id") int id);
	
	ClienteVeiculo save(ClienteVeiculo cliente);
	
}
