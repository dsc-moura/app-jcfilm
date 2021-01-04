package br.com.app.jcfilm.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.app.jcfilm.model.Acesso;

public interface IAcessoRepository extends JpaRepository<Acesso, Long>{
	Acesso save(Acesso acesso);
	List<Acesso> findAll();	
	@Query(nativeQuery =true, value = "SELECT a.* from jcf_tbl_cad_usuarios u INNER JOIN jcf_tbl_cad_acessos a ON u.id = a.id_usuario  WHERE u.email = :email AND a.permissao = 1")
	Optional<Acesso> findByUsername(@Param("email")String email);
	@Query(nativeQuery =true, value = "SELECT a.* from jcf_tbl_cad_usuarios u INNER JOIN jcf_tbl_cad_acessos a ON u.id = a.id_usuario  WHERE u.email LIKE :parametro OR u.nome LIKE :parametro")
	List<Acesso> findByNomeEmail(@Param("parametro") String parametro);
	Acesso findById(int id);
	
}
