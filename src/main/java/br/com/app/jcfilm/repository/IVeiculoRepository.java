package br.com.app.jcfilm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.app.jcfilm.model.Marca;
import br.com.app.jcfilm.model.Veiculo;

public interface IVeiculoRepository extends JpaRepository<Veiculo, Long>{
	List<Veiculo> findAll();
	Veiculo removeById(int id);
	Veiculo findById(int id);
	Veiculo save(Veiculo veiculo);	
	Veiculo findByNome(String nome);
	void delete(Veiculo veiculo);
	@Query(nativeQuery = true, value ="Select * from jcf_tbl_cad_veiculos where nome LIKE :parametro")
	List<Veiculo> findByName(@Param("parametro") String parametro);
}
