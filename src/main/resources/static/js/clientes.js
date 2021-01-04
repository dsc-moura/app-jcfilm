$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


function Novo(){
	Atualizar();
	LiberaBloqueiaCamposFormulario(false);
	$('#salvar-cad-cliente').prop("disabled",false);	
	$('#Cancelar-cliente').prop("disabled",false);
	$('#Pesquisar-cliente').prop("disabled",true);
}

function Cancelar(){
	Atualizar();	
	HabilitarDesabilitarBotoes(true);
	$('#Novo-cliente').prop("disabled",false);
	$('#Pesquisar-cliente').prop("disabled",false);
}

function Atualizar(){
	 $(':input','#FormCadCliente')
	  .not(':button, :submit, :reset')
	  .val('')
	  .removeAttr('checked')
	  .removeAttr('selected');	
	  $('#id').val(0);  
}

function ExcluirCadastro() {
	var id = $('#id').val();
    swal({
        title: "Excluir Registro?",
        text: "Você deseja realmente excluir o cadastro do Cliente?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.ajax({
                url: 'cliente/delete/'+id,
                type: 'DELETE',
           		statusCode:{
			    	201:function(data){	 
			    		 AlertSucesso(data);
	                
	                	HabilitarDesabilitarBotoes(true);
	               	 	Cancelar();
			    	},
			    	400:function(data){	
			    	 	AlertErro(data.responseText);
			    	},
		    	}
            });
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
        url: 'cliente/pesquisa/'+parametro,        
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

function Alterar(){
	LiberaBloqueiaCamposFormulario(false);
	$('#Update-cliente').prop("disabled",true);
	$('#salvar-cad-cliente').prop("disabled",false);
	$('#Excluir-cliente').prop("disabled",true);
	$('#Cancelar-cliente').prop("disabled",false);
}

function LiberaBloqueiaCamposFormulario(view){
	$('#nome').prop("disabled",view);
	$('#sobrenome').prop("disabled",view);
	$('#cpf').prop("disabled",view);    			
	$('#bairro').prop("disabled",view);    			
	$('#cep').prop("disabled",view);
	$('#endereco').prop("disabled",view);
	$('#numero').prop("disabled",view);
	$('#complemento').prop("disabled",view);
	$('#email').prop("disabled",view);
	$('#telefone').prop("disabled",view);	    
}

 function SubmitCadastroCliente() {
     $('#FormCadCliente').submit(function (e) {
         e.preventDefault();            
         $.ajax({
             type: "POST",
             url: $(this).attr('action'),
             data: $(this).serialize(),
             statusCode:{
		    	201:function(data){	 
		    		 AlertSucesso(data);
                
                	HabilitarDesabilitarBotoes(true);
               	 	Cancelar();
		    	},
		    	400:function(data){	
		    	 	AlertErro(data.responseText);
		    	},
	    	}             
         });

     });
 }
 
function Fechar(){
 	$('#parametro').val();
 	$('#tabela-resultado-pesquisa').hide(); 	
 	$('#pesquisa').modal('hide');
 }
 
function EditarVisualizar(id,view){
	$.ajax({
	    type:  'GET',
	    url:   'cliente/dados/'+id,	  
	    statusCode:{
	    	200:function(data){	 
	    		$('#id').val(data.id);
				$('#nome').val(data.nome).prop("disabled",view);
				$('#sobrenome').val(data.sobrenome).prop("disabled",view);
				$('#cpf').val(data.cpf).prop("disabled",view);    			
				$('#bairro').val(data.bairro).prop("disabled",view);    			
				$('#cep').val(data.cep).prop("disabled",view);
				$('#endereco').val(data.endereco).prop("disabled",view);
				$('#numero').val(data.numero).prop("disabled",view);
				$('#complemento').val(data.complemento).prop("disabled",view);
				$('#email').val(data.email).prop("disabled",view);
				$('#telefone').val(data.telefone).prop("disabled",view);
				
				$('#Update-cliente').prop("disabled",false);			
	 			$('#Excluir-cliente').prop("disabled",false);
	 			$('#Cancelar-cliente').prop("disabled",false);
	 			$('#Novo-cliente').prop("disabled",true);
	 			$('#Pesquisar-cliente').prop("disabled",true);		
	 			
	 			Fechar();		    	
	    	},
	    	400:function(){	
	    	 	AlertErro("Não foi possível resgatar os dados para apresentar!");
	    	},
    	}    
	});
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


