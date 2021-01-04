package br.com.app.jcfilm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.app.jcfilm.model.ItemVenda;
import br.com.app.jcfilm.model.Produto;

public interface IProdutoRepository extends JpaRepository<Produto, Long>{
	List<Produto> findAll();	
	Produto save(Produto produto);
	void delete(Produto produto);
	Produto findById(int id);
	@Query(nativeQuery = true, value ="Select * from jcf_tbl_cad_produtos where nome LIKE :parametro")
	List<Produto> findByName(@Param("parametro") String parametro);
	Produto findByNome(String parametro);
}
