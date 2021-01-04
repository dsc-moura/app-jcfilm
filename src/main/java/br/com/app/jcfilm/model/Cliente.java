package br.com.app.jcfilm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="jcf_tbl_cad_clientes")
public class Cliente {
	
	@Id
	@GeneratedValue
	private int id;
	@Column(length=20,nullable=false)
	@NotEmpty
	private String nome;
	@Column(length=50,nullable=false)
	@NotEmpty
	private String sobrenome;
	@Column(length=20,nullable=false)
	@NotEmpty
	private String cpf;
	@Column(length=12,nullable=false)
	@NotEmpty
	private String telefone;
	@Column(length=10,nullable=true)
	private String cep;
	@Column(length=50,nullable=true)
	private String endereco;
	@Column(nullable=true)
	private Integer numero;
	@Column(length=50,nullable=true)
	private String complemento;
	@Column(length=50,nullable=true)
	private String email;
	@Column(length=30,nullable=true)
	private String bairro;
	
	public Cliente() {}
	
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

	public String getSobrenome() {
		return sobrenome;
	}

	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	@Override
	public String toString() {
		return "Cliente [id=" + id + ", nome=" + nome + ", sobrenome=" + sobrenome + ", cpf=" + cpf + ", telefone="
				+ telefone + ", cep=" + cep + ", endereco=" + endereco + ", numero=" + numero + ", complemento="
				+ complemento + ", email=" + email + ", bairro=" + bairro + "]";
	}
}
