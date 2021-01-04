package br.com.app.jcfilm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="jcf_tbl_cad_veiculos")
public class Veiculo {
	
	@Id
	@GeneratedValue
	private int id;
	@ManyToOne
	@JoinColumn(name="id_marca",nullable=false)
	private Marca marca;
	@Column(nullable = false)
	private String nome;
	
	public Veiculo(int id, String nome, Marca marca) {
		this.marca = marca;
		this.id = id;
		this.nome = nome;
	}
	
	public Veiculo() {}
		
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		return "Veiculo [id=" + id + ", marca=" + marca + ", nome=" + nome + "]";
	}
}
