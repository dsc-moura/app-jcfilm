package br.com.app.jcfilm.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.app.jcfilm.model.Acesso;
import br.com.app.jcfilm.model.Usuario;
import br.com.app.jcfilm.repository.IAcessoRepository;

@Service
public class AcessoService implements UserDetailsService {
	
	@Autowired
	IAcessoRepository acessoRepository;
	
	public Acesso save(Usuario usuario) {	
		Acesso acesso = new Acesso();
		acesso.setUsuario(usuario);
		acesso.setPermissao(true);
		acesso.setSenha(encryptPassword("123"));		
		
		return acessoRepository.save(acesso);
	}
	
	public List<Acesso> findAll(){
		return acessoRepository.findAll();
	}
	
	public List<Acesso> findByNomeEmail(String parametro){
		return acessoRepository.findByNomeEmail("%"+parametro+"%");
	}
	
	public Acesso update(Acesso acesso) {		
		Acesso acess = acessoRepository.findById(acesso.getId());
		
		acesso.setSenha(encryptPassword(acesso.getSenha()));
		BeanUtils.copyProperties(acesso, acess,"id");
		
		return acessoRepository.save(acesso);
	}
	
	public String encryptPassword(String password) {
		BCryptPasswordEncoder encoderPassword = new BCryptPasswordEncoder();
		return encoderPassword.encode(password);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		 Optional<Acesso> acesso = acessoRepository.findByUsername(username);
		 if(acesso.isPresent()) {
			 return acesso.get();
		 }else {
			 throw new UsernameNotFoundException(String.format("Username[%s] not found"));
		 }
	}
	
	public Acesso findAcessoById(int id) {
		return acessoRepository.findById(id);
	}
}
