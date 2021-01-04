
$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


function Fechar(){
 	$('#parametro').val();
 	$('#tabela-resultado-pesquisa').hide(); 	
 	$('#pesquisa').modal('hide');
 }

function ProcurarCliente(){
	var cpf = $('#vcpf').val();	
	if(cpf != ""){
		BuscarDadosCliente(cpf);
	}
}

function BuscarDadosCliente(cpf){
	$.ajax({
	    type:  'GET',
	    url:   'cliente/'+cpf,	  
	    statusCode:{
	    	200:function(data){	 
	    		 $('#vid-cliente').val(data.id);
		    	 $('#vnome').val(data.nome);
		    	 $('#vsobrenome').val(data.sobrenome);
		    	 $('#vcpf').val(cpf);
		    	 
		    	 BuscaVeiculosCliente(data.id);
		    	 ListaCarrinhoCompras('cliente',data.id);
		    	
	    	},
	    	204:function(){	
	    	 	AlertErro("Cliente não encontrado, faça o cadastro!");
	    	},
    	}		 	
	});	
	
}

function Pesquisando(TABELA) {
    $('#load-pesquisa').show();
    $('#tabela-resultado-pesquisa').hide();
    var parametro = $('#parametro').val();
    
   	if(parametro == ""){
		parametro = 0;
	}
	
    $.ajax({
        type: 'GET',
        url: 'cliente/buscar/'+parametro,        
        dataType: 'html',
       	statusCode:{
	    	200:function(data){	 
    			$('#tabela-resultado-pesquisa').show();
	            $('#tabela-resultado-pesquisa').html(data);
	            TraduzirLinguagemTabela(TABELA);
	            $('#' + TABELA).DataTable();           
	            $('#load-pesquisa').hide(); 	             
	    	},
	    	400:function(){	
	    	 	AlertErro("Nenhum registro encontrado!");
	    	},
    	}       
    });
}

function TabelaListaProdutos() {	          
    $.ajax({
        type: 'GET',
        url: 'produto/produtos',        
        dataType: 'html',
       	statusCode:{
	    	200:function(data){		           			
	            $('#lista-produtos-selecao-venda').html(data);	               	
         	 	TraduzirLinguagemTabela('tabela-produtos-servicos-pesquisa');    
	            $('#tabela-produtos-servicos-pesquisa').DataTable();   
	            
	    	},
	    	400:function(){	
	    	 	AlertErro("Nenhum registro encontrado!");
	    	},
    	}       
    });
}
	        

function FinalizarVendaServicoCliente(){
	var venda = PreencherObjetoVendaFinalizada();
	var listaVendas = $('.produtos-servicos-carrinho');
	
	if(venda.id == "0" || listaVendas.length <= 0){
		AlertErro("Nenhuma venda foi iniciada!");
	}else{
	
		$.ajax({
		    type:  'POST',
		    contentType: "application/json",
		    url:   'venda/finalizar',	 
		    data: JSON.stringify(venda),
		    dataType: 'json',
		    statusCode:{
		    	200:function(data){	 
		    		 AlertSucesso(data.responseText);
		    		 $('#finalizar-venda').modal('hide');
		    		 Atualizar();
		    		 $('#id-codigo-venda').val(0);
		    	},
		    	400:function(){	
		    	 	AlertErro("Não foi possível finalizar a venda!!");
		    	},
	    	}		    
		});	
	}
}


var registroEdit = null;
function update(id,vlrLinha){
	if(registroEdit == null || registroEdit == vlrLinha){
		registroEdit = vlrLinha;
	}else if($('#'+registroEdit).find($('#salvar-quantidade').is(':visible'))){
		cancelar(registroEdit);
		registroEdit = vlrLinha;
	}
	var qtdproduto = $('#'+vlrLinha).find('#qtde-produto-servico').text().trim();	
	$('#'+vlrLinha).find('span,#update,#delete').hide();	
	$('#'+vlrLinha).find('#cancelar,#salvar-quantidade,#qtd-venda-produto,#aumentar,#diminuir').show();
	$('#'+vlrLinha).find('#qtd-venda-produto').val(qtdproduto);
}

function cancelar(vlrLinha){
	$('#'+vlrLinha).find('#delete,#update,span').show();
	$('#'+vlrLinha).find('#confirmar,#cancelar,#salvar-quantidade,#aumentar,#diminuir,#qtd-venda-produto').hide();
}

function excluir(id,vlrLinha){
	$('#'+vlrLinha).find('#delete,#update').hide();
	$('#'+vlrLinha).find('#confirmar,#cancelar').show();
}

function aumentar(vlrLinha){
	var quantidade = $('#'+vlrLinha).find('#qtd-venda-produto').val();
	quantidade++;
	 $('#'+vlrLinha).find('#qtd-venda-produto').val(quantidade);	
}

function diminuir(vlrLinha){
	var quantidade =  $('#'+vlrLinha).find('#qtd-venda-produto').val();
	if(quantidade > 1){
		quantidade--;
	}	
	 $('#'+vlrLinha).find('#qtd-venda-produto').val(quantidade);	
}

function Novo(){
	Atualizar();
}

function Atualizar(){
	 $(':input')
	  .not(':button, :submit, :reset')
	  .val('')
	  .removeAttr('checked')
	  .removeAttr('selected');	
	  $('#id-codigo-venda').val(0);  
	  
	  $('#tabela-itens-vendas tbody').empty();
	  
}

function AlteraQuantidadeProdutoCarrinho(id,vlrLinha){		
	var ItemVenda =  PreencheObjetoItemVenda(id,vlrLinha);
			
	$.ajax({
	    type:  'POST',
	    contentType: "application/json",
	    url:   'venda/altera/quantidade/produto',	 
	    data: JSON.stringify(ItemVenda),
	    dataType: 'json',
	    statusCode:{
	    	200:function(data){	 
	    		$('#'+vlrLinha).find('#qtd-produto-'+id).html(data.quantidade);	    		
	    		cancelar(vlrLinha);
	    		TotalizarValorServico();
	    	},
	    	400:function(){	
	    	 	AlertErro("Não foi possível alterar a quantidade do produto!!");
	    	},
    	}			 
	});	
}

function RemoveProdutoCarrinho(id,tr){	
	$.ajax({
	    type:  'DELETE',
	    url:   'venda/remover/produto/carrinho/'+id,
	    statusCode:{
	    	200:function(data){	 
	    		$('#id-codigo-venda').val(data);  	    		
	    		tr.fadeOut(300, function(){tr.remove();});	    		
	    	},
	    	400:function(){	
	    	 	AlertErro("Não foi possível remover o(s) produto(s) do carrinho!");
	    	},			
	    }
	});
}


function confirmar(id,vlrLinha){
	var tr = $('#'+vlrLinha).closest('tr');	
	RemoveProdutoCarrinho(id,tr);
	setTimeout(function() {	  		  	  		  		  
		TotalizarValorServico();
	}, 400);
	
}

function SelecionaFormaPagamento(e){
	var tipo = $("#tipo option:selected").val();
	
	if(tipo == "2" || tipo == "3"){
		$('#div-filipeta').show();
	}else{
		$('#div-filipeta').hide();
	}
	
	if(tipo == "2"){
		$('#div-parcelas').show();
	}else{
		$('#div-parcelas').hide();
	}
}

function SelecionaVeiculo(e){
	var id = $("#vveiculo option:selected").val();
	if($.isNumeric(id)){
		$.ajax({
		    type:  'GET',
		    url:   'cliente/detalhes/cliente/veiculo/'+id,	   
		    success: function(data){    			    	
	    		$('#vmarca').val(data.veiculo.marca.nome);
	    		$('#vplaca').val(data.placa);
	    		$('#vano').val(data.ano);		    	
		     } 
		}); 
	}
}

function ListaCarrinhoCompras(modo,id){
	$.ajax({
	    type:  'GET',
	    url:   'venda/'+modo+"/"+id,
	    dataType: 'html',	    
	    success: function(data){
	    	$('#tabela-carrinho-compras').html(data);
	    	CapturaIdVendaAberta();	    	
	    
	    	setTimeout(function() {	  		  	  		  		  
	    		CapturaDadoFuncionarioVeiculo();
	    		TotalizarValorServico();	 
    		}, 100);
	     }		    
	}); 
}

function CapturaDadoFuncionarioVeiculo(){
	var id = $('#id-codigo-venda').val();

	if(id != "0"){
		$.ajax({
		    type:  'GET',
		    url:   'venda/'+id,	   
		    success: function(data){		    		
				  $('#vveiculo').val(data.veiculo.id);
				  $('#funcionario').val(data.usuario.id);
				
				  $("#vveiculo").change();	    	
		     } 
		});
	}	
}

function CapturaIdVendaAberta(){
	var vendas = $('.produtos-servicos-carrinho');
	$(vendas).each(function(i){
		$('#id-codigo-venda').val($('#'+vendas[i].id).find('#codigo-id-venda').text().trim());
	});
}

function ValidaProdutoServicoSelecionado(id){
	var lista = PreencheListaCarrinhoProdutosServicos();
	var carrinho = ListaProdutosCarrinho(lista,id)
	
	return carrinho;
}

function AdicionarProdutoNoCarrinho(id){
	var carrinho = ValidaProdutoServicoSelecionado(id);
	
 	$.ajax({
	    type:  'POST',
	    contentType: "application/json",
	    url:   'venda/adicionar/produto/carrinho',	 
	    data: JSON.stringify(carrinho),
	    dataType: 'json',
	    statusCode:{
	    	200:function(data){	 
	    		ListaCarrinhoCompras('compra',id);	    		
	    		$('#produtos-servicos').modal('hide');
	    	},
	    	400:function(){	
	    	 	AlertErro("Não foi possível adicionar o(s) produto(s) no carrinho!");
	    	},
    	}			 
	});	
}


function IniciarProcessoVenda(){
	var cod_compra = $('#id-codigo-venda').val();
	
	if(cod_compra == "0" || cod_compra == ""){
		var venda = PreencherParametrosIniciarVenda();	
		var lista = ValidaProdutoServicoSelecionado(0);
		
		if(venda.usuario.id == "" || venda.veiculo.id == "" || venda.cliente.id == "" || lista.length == 0){
			AlertErro("Informe o funcionario responsável, o cliente, o veículo \n e selecione o(s) produto(s)!");			 
		}else{
			$.ajax({
			    type:  'POST',
			    contentType: "application/json",
			    url:   'venda/registrar',	 
			    data: JSON.stringify(venda),
			    dataType: 'json',
			    statusCode:{
			    	200:function(data){	 
			    		 AdicionarProdutoNoCarrinho(data.id); 
			    		 $('#id-codigo-venda').val(data.id);
			    	},
			    	400:function(){	
			    	 	AlertErro("Não foi possível iniciar a venda!");
			    	},
		    	}			    
			});	
		}
	}else{
		AdicionarProdutoNoCarrinho(cod_compra); 
	}	
}


function SelecionarProdutoServico(e) {
	var valor = $(e).val();
	if(valor == "false"){
		$(e).attr('class', 'btn btn-success');
		$(e).val("true");
	}if(valor == "true"){
		$(e).attr('class', 'btn btn-secondary');
		$(e).val("false");
	}
}


function BuscaVeiculosCliente(id){
	$.ajax({
	    type:  'GET',
	    url:   'cliente/veiculo/'+id,
	    dataType: 'html',	    
	    success: function(data){
	    	$('#formulario-veiculos-cliente').html(data);
	     }		    
	}); 	
}

function SubmitCadastroCliente() {
     $('#FormCadClienteResumido').submit(function (e) {
         e.preventDefault();            
         $.ajax({
             type: "POST",
             url: $(this).attr('action'),
             data: $(this).serialize(),
             statusCode:{
		    	201:function(data){	 
		    		 AlertSucesso(data);
		    	},
		    	400:function(data){	
		    	 	AlertErro(data.responseText);
		    	},
	    	}		 
         });
     });
 }


function CadastrarVeiculoCliente() {
	var veiculo = preencherObjetoVeiculoCliente();
	if(veiculo.cliente.id == ""){
		AlertErro("Selecione o cliente");
	}else{
		if(veiculo.ano == "" || veiculo.placa == "" || veiculo.veiculo.id == ""){
			AlertErro("É necessário preencher todos os campos!");
		}else{
			$.ajax({
			    type:  'POST',
			    contentType: "application/json",
			    url:   'cliente/veiculo/save',	 
			    data: JSON.stringify(veiculo),
			    dataType: 'json',
			    statusCode:{
			    	201:function(data){	 
			    		 AlertSucesso(data.responseText);
			    		 BuscaVeiculosCliente(veiculo.cliente.id);
			    		 $('#veiculo-add').modal('hide');
			    	},
			    	400:function(data){	
			    	 	AlertErro(data.responseText);
			    	},
		    	}		    
			});
		}
	}	
}

function TotalizarValorServico(){
	valorTotal = 0;
	var produtos = $('.produtos-servicos-carrinho');

	$.each(produtos, function(i){
		var valor = parseFloat($('#'+produtos[i].id).find('#valor-item').val());
		var quantidade = parseInt($('#'+produtos[i].id).find('#qtde-produto-servico').text().trim());		
		valor = valor * quantidade;
		valorTotal += valor;			
	});	
	$('#total').val(formatter.format(valorTotal));
}

function CancelarProcessoVenda(){

	var venda = PreencherObjetoVendaFinalizada();
	var listaVendas = $('.produtos-servicos-carrinho');
	
	if(venda.id == "0" || listaVendas.length <= 0){
		AlertErro("Nenhuma venda foi iniciada!");
	}else{
	    swal({
	        title: "Cancelar Venda?",
	        text: "Você deseja realmente cancelar a venda?",
	        icon: "warning",
	        buttons: true,
	        dangerMode: true,
	    }).then((willDelete) => {
	        if (willDelete) {
	            $.ajax({
	                url: 'venda/cancelar/'+venda.id,
	                type: 'DELETE',
	                statusCode:{
				    	200:function(data){	 
			    			AlertSucesso(data);                
			               	Atualizar();
			               
				    	},
				    	400:function(data){	
				    	 	AlertErro(data.responseText);
				    	},
			    	}             	
	            });
	        }
	    });
    }
}


var formatter = new Intl.NumberFormat('pt-BR', {
  style: 'currency',
  currency: 'BRL',
  minimumFractionDigits: 2,
});


function PreencherObjetoVendaFinalizada(){
	var Venda = new Object();	
	
	Venda = {
			situacao :  true,
			orcamento: false,
			servico: true,
			prazo : $('#prazo').val(),
			tempo : $("#tempo option:selected").val(),
			id: $('#id-codigo-venda').val(),
			filipeta: $('#filipeta').val(),
			forma_pagamento:  $("#tipo option:selected").val(),
			parcelado: $('#parcelas').val(),
			cliente : cliente = { id: $('#vid-cliente').val() },
			usuario : usuario = { id: $('#funcionario option:selected').val() },
			veiculo : ClienteVeiculo = {id :$('#vveiculo option:selected').val()},
			
	}	
	return Venda
}


function preencherObjetoVeiculoCliente(){	
	var cliente = new Object();
	var modelo = new Object();	
	var veiculo = new Object();
	
	veiculo = {
		ano:  $('#ano').val(),	
		placa:  $('#placa').val(),	
		cliente: cliente = { id:$('#vid-cliente').val() },
		veiculo: modelo = { id: $('#veiculo').val() },	
	}
	return veiculo;
}

function PreencheListaCarrinhoProdutosServicos(){
	var lista = [];
	var Produto = new Object();	
	var produtos = $('.produtos-servicos');		
	$(produtos).each(function(i){
		Produto = {
			id: $('#'+produtos[i].id).find('#id').text().trim(),
			selecao: $('#'+produtos[i].id).find('#btn-selecao-produtos-servicos').val(),
			preco: $('#'+produtos[i].id).find('#produto-preco').text().trim(),
		};
		lista.push(Produto);		
	});
	return lista;
}

function ListaProdutosCarrinho(lista,id){
	var carrinho = [];
	var ItemVenda = new Object();	
	var Venda = new Object();	
	var Produto = new Object();	
	$(lista).each(function(i){
		if(lista[i].selecao == "true"){
			ItemVenda = {
					produto : Produto = {id : parseInt(lista[i].id),} ,
					venda : Venda = {id: id,},
					quantidade : 1,
					valor: parseFloat(lista[i].preco),
			};
			carrinho.push(ItemVenda);	
		}
	});
	return carrinho;
}

function PreencherParametrosIniciarVenda(){
	var Venda = new Object();
	var cliente = new Object();
	var ClienteVeiculo = new Object();
	var usuario = new Object();
	Venda = {
			orcamento: false,
			servico: true,
			situacao: false,
			cliente : cliente = { id: $('#vid-cliente').val() },
			usuario : usuario = { id: $('#funcionario option:selected').val() },
			veiculo : ClienteVeiculo = {id :$('#vveiculo option:selected').val()},
	}	
	return Venda;
}


function PreencheObjetoItemVenda(id,vlrLinha){
	var ItemVenda = new Object();
	ItemVenda = {
			id: id,
			produto : Produto = {id : $('#'+vlrLinha).find('#codigo-id-produto').text(),} ,
			venda : Venda = {id: $('#'+vlrLinha).find('#codigo-id-venda').text(),},
			quantidade : $('#'+vlrLinha).find('#qtd-venda-produto').val().trim(),
			valor: $('#'+vlrLinha).find('#valor-item').val().trim(),
	}
	
	return ItemVenda;
}


function PreencherObjetoCliente(){
	var cliente = new Object();	
	cliente = {
		nome: $('#nome').val(),
		cpf : $('#cpf').val(),
		sobrenome : $('#sobrenome').val(),
		email : $('#email').val(),
		telefone : $('#telefone').val(),
	}		
	return cliente;
}

function TraduzirLinguagemTabela(TABELA) {
    $('#' + TABELA).DataTable({
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Exibir _MENU_ registros por página",
            "sZeroRecords": "Nenhum resultado encontrado",
            "sEmptyTable": "Nenhum resultado encontrado",
            "sInfo": "Exibindo do _START_ até _END_ de um total de _TOTAL_ registros",
            "sInfoEmpty": "Exibindo do 0 até 0 de um total de 0 registros",
            "sInfoFiltered": "(Filtrado de um total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Próximo",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Ativar para ordenar a columna de maneira ascendente",
                "sSortDescending": ": Ativar para ordenar a columna de maneira descendente"
            }
        }
    });
}


