package br.com.app.jcfilm.service;

import java.util.List;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.app.jcfilm.model.Usuario;
import br.com.app.jcfilm.repository.IUsuarioRepository;

@Service
public class UsuarioService{
	
	@Autowired
	IUsuarioRepository usuarioRepository;
	
	public List<Usuario> findAll(){
		return usuarioRepository.findAll();
	}
	
	public Usuario save(Usuario usuario) {
		return usuarioRepository.save(usuario);
	}
		
	
	public Usuario update(Usuario usuario) {		
		Usuario resultado = usuarioRepository.findById(usuario.getId());
		
		BeanUtils.copyProperties(usuario, resultado,"id");
		
		return usuarioRepository.save(usuario);
	}
	
	public void delete(Usuario usuario) {
		usuarioRepository.delete(usuario);
	}
	
	public Usuario findById(int id) {
		return usuarioRepository.findById(id);
	}
	
	public List<Usuario> findByNome(String parametro){
		return usuarioRepository.findByNome("%"+parametro+"%");
	}
}
