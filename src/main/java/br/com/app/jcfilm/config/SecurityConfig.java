package br.com.app.jcfilm.config;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import br.com.app.jcfilm.service.AcessoService;


@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter  {
	
	@Autowired
	AcessoService acessoService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth)	throws Exception {
		auth.userDetailsService(acessoService)
			.passwordEncoder(new BCryptPasswordEncoder());		
	}	
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.anyRequest().authenticated()
		.and().formLogin().loginPage("/index").permitAll()
		.failureUrl("/index?error=true").defaultSuccessUrl("/home", true).permitAll()
		.and().rememberMe().userDetailsService(acessoService)
		.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
	}	
	
}