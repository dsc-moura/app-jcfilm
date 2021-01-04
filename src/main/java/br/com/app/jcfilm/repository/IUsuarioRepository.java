package br.com.app.jcfilm.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.app.jcfilm.model.Usuario;

public interface IUsuarioRepository extends JpaRepository<Usuario, Long>{
	Optional<Usuario> findByEmail(String email);
	List<Usuario> findAll();
	Usuario findById(int id);
	Usuario save(Usuario usuario);
	void delete(Usuario usuario);
	@Query(nativeQuery = true, value ="Select * from jcf_tbl_cad_usuarios where nome LIKE :parametro")
	List<Usuario> findByNome(@Param("parametro") String parametro);
}
