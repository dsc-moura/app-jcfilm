package br.com.app.jcfilm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import br.com.app.jcfilm.model.Venda;

public interface IVendaRepository extends JpaRepository<Venda, Long>{
	List<Venda> findAll();
	Venda findById(int id);
	Venda save(Venda venda);
	@Query(nativeQuery = true, value = "Select * from jcf_tbl_cad_vendas v where v.id_cliente = :id and v.servico = true and v.situacao = false order by v.id desc LIMIT 1")
	Venda findVendaByIdCliente(@Param("id") int id);
	@Modifying
	@Transactional
	@Query(nativeQuery = true, value="DELETE FROM jcf_tbl_cad_vendas WHERE id = :id")
	void excluirVenda(@Param("id") int id);
}
