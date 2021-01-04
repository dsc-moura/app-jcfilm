$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


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

function PrintGarantiaCliente(){	 
    //send the div to PDF
    html2canvas($("#garantia-servico-cliente"), { // DIV ID HERE
        onrendered: function(canvas) {
            var imgData = canvas.toDataURL('image/png'); 
            var doc = new jsPDF('portrait');
            doc.addImage(imgData, 'PDF', 6.7, 2); // defini o posicionameto da div na tela de impressão
            doc.setProperties({
                title: "Garantia Cliente"
            });
                     
            //doc.output('dataurlnewwindow');
            doc.save("Garantia-Serviço.pdf");
        }
    });
}


function ImprimirGarantia(id){	
	$.ajax({
	    type:  'PUT',
	    url:   'imprimir-relario/venda',
	    statusCode:{
	    	200:function(){	   	    		
	    		tr.fadeOut(300, function(){tr.remove();});
	    		
	    	},error:function(){
	    		setTimeout(function() {	  		  	  		  		  
		  			$.bootstrapGrowl('<i class="fas fa-times"></i>  Não foi possível excluir o item!', { type: 'danger', width: 450, align: 'right', stackup_spacing: 30});
	    		}, 300);
	    	}			
	    }
	});
}

function VisualizarServico(id){
	$.ajax({
	    type:  'GET',
	    url:   'garantias/lista/servicos/'+id,
	    dataType: 'html',	     
	    success: function(data){
	    	$('#itens-garantia-cliente').html(data);
			TraduzirLinguagemTabela('tabela-lista-itens-vendas');
	        $('#tabela-lista-itens-vendas').DataTable();    
	    
	     }		    
	}); 
}

function TabelaListaVendas(TABELA) {   
    $.ajax({
        type: 'GET',
        url: 'garantias/vendas',        
        dataType: 'html',
       	statusCode:{
	    	200:function(data){	 
    			$('#tabela-resultado-pesquisa').show();
	            $('#tabela-resultado-pesquisa').html(data);
	            TraduzirLinguagemTabela(TABELA);
	            $('#' + TABELA).DataTable();             
	    	},
	    	400:function(){	
	    	 	AlertErro("Nenhum registro encontrado!");
	    	},
    	}       
    });
}