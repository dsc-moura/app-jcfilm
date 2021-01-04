package br.com.app.jcfilm.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.app.jcfilm.model.ItemVenda;
import br.com.app.jcfilm.model.Venda;
import br.com.app.jcfilm.repository.IItemVendaRepository;
import br.com.app.jcfilm.repository.IVendaRepository;


@Service
public class VendaService {

	@Autowired
	IVendaRepository vendaRepository;
	
	@Autowired
	IItemVendaRepository itemVendaRepository;
	
	public Venda save(Venda venda) {
		return vendaRepository.save(venda);
	}
	
	public void excluirVenda(int id) {
		vendaRepository.excluirVenda(id);
	}
	
	public void deleteItemVenda(ItemVenda itemVenda) {
		itemVendaRepository.delete(itemVenda);
	}
	
	public void limpaCarrinho(int id) {
		itemVendaRepository.limpaCarrinho(id);
	}
	
	public ItemVenda save(ItemVenda item) {
		return	itemVendaRepository.save(item);
	}
	
	public List<Venda> findAll(){
		return listaVendas(vendaRepository.findAll(),encontrarDatasVencimento(vendaRepository.findAll()),itemVendaRepository.findAll());
	}
	
	public List<ItemVenda> findItensVenda(int id){
		List<ItemVenda> lista = null;
		Venda venda = findVendaByIdCliente(id);
		if(venda != null) {
			lista = findItensVendidos(venda.getId());
		}
		
		return 	lista;	
	}
	
	public Venda findVendaByIdCliente(int id) {
		return vendaRepository.findVendaByIdCliente(id);
	}
	
	public ItemVenda findByIdItemVenda(int id) {
		return itemVendaRepository.findById(id);
	}
	
	public Venda updateVenda(Venda venda) {
		Venda sale = vendaRepository.findById(venda.getId());
		
		BeanUtils.copyProperties(venda, sale,"id");
		
		return vendaRepository.save(venda);
	}
	
	public ItemVenda updateItemVenda(ItemVenda itemVenda) {
		ItemVenda item = itemVendaRepository.findById(itemVenda.getId());
		
		BeanUtils.copyProperties(itemVenda, item,"id");
		
		return itemVendaRepository.save(itemVenda);
	}
		
	public List<ItemVenda> findItensVendidos(int id){
		List<ItemVenda> itensVenda = itemVendaRepository.findByItensVendaId(id);
		return itensVenda;
	}
	
	public List<ItemVenda> findByItemVendaIdVenda(int id){
		return itemVendaRepository.findByItemVendaIdVenda(id);
	}
	
	public Venda findById(int id) {
		return vendaRepository.findById(id);
	}	
	
	public List<Venda> encontrarDatasVencimento(List<Venda> vendas){		
		List<Venda> lista = new ArrayList<>();	
		
		for(int i = 0; i<  vendas.size(); i++) {	
			Venda v = new Venda();
			v.setId(vendas.get(i).getId());
			v.setData(vendas.get(i).getData());
			v.setPrazo(vendas.get(i).getPrazo());
			v.setVencimento(obterVencimento(vendas.get(i).getData(),vendas.get(i).getTempo(),vendas.get(i).getPrazo()));
			
			switch (vendas.get(i).getTempo()) {
			case 0:
				v.setDescPrazo("Dia(s)");					
				break;
			case 1:
				v.setDescPrazo("Semana(s)");					
				break;
			case 2:
				v.setDescPrazo("Mês(es)");										
				break;
			case 3:
				v.setDescPrazo("Ano(s)");					
				break;
			default:
				break;
			}		
			
			lista.add(v);		
		}
		return lista;
	}
	
	public List<Venda> listaVendas(List<Venda> vendas, List<Venda> datas, List<ItemVenda> carrinho){		
		List<Venda> lista = new ArrayList<>();			
		for(int i = 0; i<  vendas.size(); i++) {
			Venda v = new Venda();			
			if(vendas.get(i).getId() == datas.get(i).getId()) {
				v.setId(vendas.get(i).getId());
				v.setVeiculo(vendas.get(i).getVeiculo());
				v.setCliente(vendas.get(i).getCliente());
				v.setUsuario(vendas.get(i).getUsuario());			
				v.setServico(vendas.get(i).isServico());
				v.setData(vendas.get(i).getData());
				v.setOrcamento(vendas.get(i).isOrcamento());
				v.setSituacao(vendas.get(i).isSituacao());
				v.setPrazo(vendas.get(i).getPrazo());
				v.setDescPrazo(datas.get(i).getDescPrazo());
				v.setVencimento(datas.get(i).getVencimento());	
				v.setTotal(obterValorTotalVenda(vendas.get(i).getId(),carrinho));
				lista.add(v);
			}		
		}
		return lista;
	}
	
	public Calendar obterVencimento(Calendar cal,int tempo ,int prazo) {	
		Calendar data = (Calendar) cal.clone();
		switch (tempo) {
		case 0:			
			 data.add(Calendar.DAY_OF_WEEK,prazo);
			break;
		case 1:			
			data.add(Calendar.WEEK_OF_MONTH,prazo);
			break;
		case 2:			
			data.add(Calendar.MONTH,prazo);
			break;
		case 3:			
			 data.add(Calendar.YEAR,prazo);
			break;
		default:
			break;
		}			
		return data;
	}	
	
	public double obterValorTotalVenda(int id, List<ItemVenda> carrinho) {
		double total = 0, valor = 0;
		int quantidade = 0;
		
		for(ItemVenda item : carrinho) {
			if(item.getVenda().getId() == id) {
				valor = item.getValor();
				quantidade = item.getQuantidade();
				valor = valor * quantidade;
				total += valor;
			}
		}
		return total;
	}	
}
