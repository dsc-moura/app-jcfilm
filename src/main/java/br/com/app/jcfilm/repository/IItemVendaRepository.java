package br.com.app.jcfilm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import br.com.app.jcfilm.model.ItemVenda;

public interface IItemVendaRepository extends JpaRepository<ItemVenda, Long>{
	List<ItemVenda> findAll();
	
	@Query(value="from ItemVenda where id_venda = :id")
	List<ItemVenda> findByItensVendaId(@Param("id")int id);
	@Modifying
	@Transactional
	@Query(nativeQuery = true, value="DELETE FROM jcf_tbl_cad_item_vendas WHERE id_venda = :id")
	void limpaCarrinho(@Param("id") int id);
	@Query(nativeQuery = true, value="Select * FROM jcf_tbl_cad_item_vendas WHERE id_venda = :id")
	List<ItemVenda> findByItemVendaIdVenda(@Param("id") int id);
	void delete(ItemVenda itemVenda);
	ItemVenda save(ItemVenda item);
	ItemVenda findById(int id);
}
