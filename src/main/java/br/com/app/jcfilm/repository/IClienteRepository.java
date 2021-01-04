package br.com.app.jcfilm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.app.jcfilm.model.Cliente;

public interface IClienteRepository extends JpaRepository<Cliente, Long>{
	@Query(nativeQuery = true, value ="Select * from jcf_tbl_cad_clientes where nome LIKE :parametro or cpf LIKE :parametro or telefone LIKE :parametro")
	List<Cliente> findByNomeCpfTelefone(@Param("parametro") String parametro);
	@Query(nativeQuery = true, value ="Select * from jcf_tbl_cad_clientes where cpf LIKE :parametro or telefone LIKE :parametro")
	Cliente findByCpfTelefone(@Param("parametro") String parametro);	
	List<Cliente> findAll();
	Cliente findById(int id);
	Cliente save(Cliente cliente);
	void delete(Cliente cliente);	
	@Query(nativeQuery = true, value ="SELECT c.* FROM jcf_tbl_cad_clientes c INNER JOIN jcf_tbl_cad_clientes_veiculos v ON v.id_cliente = c.id WHERE c.nome LIKE :parametro OR c.cpf LIKE :parametro OR c.telefone LIKE :parametro OR	v.placa LIKE :parametro")
	List<Cliente> findByNomeCpfTelefonePlaca(@Param("parametro") String parametro);
	
}
