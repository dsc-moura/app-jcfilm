package br.com.app.jcfilm.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="jcf_tbl_cad_clientes_veiculos")
public class ClienteVeiculo {
	@Id
	@GeneratedValue
	private int id;
	@ManyToOne
	@JoinColumn(name="id_cliente",nullable=false)
	private Cliente cliente;
	@ManyToOne
	@JoinColumn(name="id_veiculo",nullable=false)
	private Veiculo veiculo;
	@Column(nullable = false,length=5)
	private String ano;
	@Column(nullable=false,length=10)
	private String placa;
	
	public ClienteVeiculo() {}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Veiculo getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	@Override
	public String toString() {
		return "ClienteVeiculo [id=" + id + ", cliente=" + cliente + ", veiculo=" + veiculo + ", ano=" + ano
				+ ", placa=" + placa + "]";
	}
	
}
