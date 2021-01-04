package br.com.app.jcfilm.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="jcf_tbl_cad_empresa")
public class Empresa {
	@Id
	@GeneratedValue
	private int id;
	private String nome;
	private String razao_social;
	private String endereco;
	private int numero;
	private String complemento;
	private String cnpj;
	private String telefone;
	private String email;
	private String ie;
	
	public Empresa() {}	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRazao_social() {
		return razao_social;
	}

	public void setRazao_social(String razao_social) {
		this.razao_social = razao_social;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIe() {
		return ie;
	}

	public void setIe(String ie) {
		this.ie = ie;
	}

	@Override
	public String toString() {
		return "Empresa [id=" + id + ", nome=" + nome + ", razao_social=" + razao_social + ", endereco=" + endereco
				+ ", numero=" + numero + ", complemento=" + complemento + ", cnpj=" + cnpj + ", telefone=" + telefone
				+ ", email=" + email + ", ie=" + ie + "]";
	}
	
	
} 
