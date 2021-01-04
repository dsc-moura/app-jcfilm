package br.com.app.jcfilm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="jcf_tbl_cad_marcas")
public class Marca {
	
	@Id
	@GeneratedValue
	private int id;
	@Column(length=20,nullable = false)
	private String nome;
	
	public Marca(int id, String nome) {
		this.id = id;
		this.nome = nome;
	}
	
	public Marca() {}
	
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

	@Override
	public String toString() {
		return "Marca [id=" + id + ", nome=" + nome + "]";
	}
}
