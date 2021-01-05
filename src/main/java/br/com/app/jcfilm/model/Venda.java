package br.com.app.jcfilm.model;

import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;


@Entity
@Table(name="jcf_tbl_cad_vendas")
public class Venda {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name="id_usuario",nullable=false)
	private Usuario usuario;
	@ManyToOne
	@JoinColumn(name="id_cliente",nullable=false)
	private Cliente cliente;	
	private boolean orcamento;
	private boolean servico;
	private boolean situacao;
	
	//@Column(name="data",nullable=true,columnDefinition="TIMESTAMP default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP")
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	//@Column(name="data",insertable=false, updatable=false,columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")	
	private Calendar data;
	@Column(nullable=true)
	private int prazo;
	@Column(nullable=true)
	private int tempo;
	@ManyToOne
	@JoinColumn(name="id_veiculo",nullable=false)
	private ClienteVeiculo veiculo;
	@Transient
	private String descPrazo;
	@Transient
	private Calendar vencimento;
	@Transient
	private double total;
	@Column(nullable=true,name="parcelado")
	private int parcelado;
	@Column(nullable=true,name="filipeta")
	private String filipeta;
	@Column(nullable=true, name="forma_pagamento")
	private int forma_pagamento;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public boolean isOrcamento() {
		return orcamento;
	}

	public void setOrcamento(boolean orcamento) {
		this.orcamento = orcamento;
	}

	public boolean isServico() {
		return servico;
	}

	public void setServico(boolean servico) {
		this.servico = servico;
	}

	public boolean isSituacao() {
		return situacao;
	}

	public void setSituacao(boolean situacao) {
		this.situacao = situacao;
	}

	public Calendar getData() {
		return data;
	}

	public void setData(Calendar data) {
		this.data = data;
	}

	public int getPrazo() {
		return prazo;
	}

	public void setPrazo(int prazo) {
		this.prazo = prazo;
	}

	public int getTempo() {
		return tempo;
	}

	public void setTempo(int tempo) {
		this.tempo = tempo;
	}

	public ClienteVeiculo getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(ClienteVeiculo veiculo) {
		this.veiculo = veiculo;
	}

	public String getDescPrazo() {
		return descPrazo;
	}

	public void setDescPrazo(String descPrazo) {
		this.descPrazo = descPrazo;
	}

	public Calendar getVencimento() {
		return vencimento;
	}

	public void setVencimento(Calendar vencimento) {
		this.vencimento = vencimento;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getParcelado() {
		return parcelado;
	}

	public void setParcelado(int parcelado) {
		this.parcelado = parcelado;
	}

	public String getFilipeta() {
		return filipeta;
	}

	public void setFilipeta(String filipeta) {
		this.filipeta = filipeta;
	}

	public int getForma_pagamento() {
		return forma_pagamento;
	}

	public void setForma_pagamento(int forma_pagamento) {
		this.forma_pagamento = forma_pagamento;
	}

	@Override
	public String toString() {
		return "Venda [id=" + id + ", usuario=" + usuario + ", cliente=" + cliente + ", orcamento=" + orcamento
				+ ", servico=" + servico + ", situacao=" + situacao + ", data=" + data + ", prazo=" + prazo + ", tempo="
				+ tempo + ", veiculo=" + veiculo + ", descPrazo=" + descPrazo + ", vencimento=" + vencimento
				+ ", total=" + total + ", parcelado=" + parcelado + ", filipeta=" + filipeta + ", forma_pagamento="
				+ forma_pagamento + "]";
	}



}
