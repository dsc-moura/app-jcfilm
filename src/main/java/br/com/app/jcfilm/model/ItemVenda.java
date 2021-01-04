package br.com.app.jcfilm.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="jcf_tbl_cad_Item_Vendas")
public class ItemVenda {
	
	@Id
	@GeneratedValue
	private int id;	
	@ManyToOne
	@JoinColumn(name="id_produto",nullable=false)
	private Produto produto;
	@ManyToOne
	@JoinColumn(name="id_venda",nullable=false)
	private Venda venda;
	private int quantidade;
	private double valor;
	
	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
		
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	@Override
	public String toString() {
		return "ItemVenda [id=" + id + ", produto=" + produto + ", venda=" + venda + ", quantidade=" + quantidade
				+ ", valor=" + valor + "]";
	}
}
