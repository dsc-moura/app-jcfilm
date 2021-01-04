package br.com.app.jcfilm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.app.jcfilm.model.Marca;

public interface IMarcaRepository extends JpaRepository<Marca, Long>{
	List<Marca> findAll();
	Marca findById(int id);
	void delete(Marca marca);
	Marca save(Marca marca);
	@Query(nativeQuery = true, value ="Select * from jcf_tbl_cad_marcas where nome LIKE :parametro")
	List<Marca> findByName(@Param("parametro") String parametro);
	Marca findByNome(String nome);
}
