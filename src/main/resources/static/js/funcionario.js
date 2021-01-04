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
	$('#salvar-cad-funcionario').prop("disabled",false);	
	$('#Cancelar-funcionario').prop("disabled",false);
	$('#Pesquisar-funcionario').prop("disabled",true);
}

function Cancelar(){
	Atualizar();	
	HabilitarDesabilitarBotoes(true);
	$('#Novo-funcionario').prop("disabled",false);
	$('#Pesquisar-funcionario').prop("disabled",false);
}

function Atualizar(){
	 $(':input','#FormCadFuncionario')
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
        text: "Você deseja realmente excluir o cadastro do Funcionario?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.ajax({
                url: 'funcionario/delete/'+id,
                type: 'DELETE',
           success: function (data) {
                AlertSucesso(data);
                
                HabilitarDesabilitarBotoes(true);
                Cancelar();
             },error: function(data) {
	    		  AlertErro(data);
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
        url: 'funcionario/pesquisa/'+parametro,        
        dataType: 'html',
        success: function (data) {
            $('#tabela-resultado-pesquisa').show();
            $('#tabela-resultado-pesquisa').html(data);
            TraduzirLinguagemTabela(TABELA);
            $('#' + TABELA).DataTable();           
            $('#load-pesquisa').hide();           
        }
    });
}

function Alterar(){
	LiberaBloqueiaCamposFormulario(false);
	$('#Update-funcionario').prop("disabled",true);
	$('#salvar-cad-funcionario').prop("disabled",false);
	$('#Excluir-funcionario').prop("disabled",true);
	$('#Cancelar-funcionario').prop("disabled",false);
}

function LiberaBloqueiaCamposFormulario(view){
	$('#nome').prop("disabled",view);
	$('#sobrenome').prop("disabled",view);	
	$('#email').prop("disabled",view);	    
}

 function SubmitCadastroCliente() {
     $('#FormCadFuncionario').submit(function (e) {
         e.preventDefault();            
         $.ajax({
             type: "POST",
             url: $(this).attr('action'),
             data: $(this).serialize(),
             success: function (data) {
                AlertSucesso(data);
                
                HabilitarDesabilitarBotoes(true);
                Cancelar();
             },error: function(data) {
	    		  AlertErro(data);
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
	    url:   'funcionario/dados/'+id,	
	     statusCode:{
	    	200:function(data){	 
	    		$('#id').val(data.id);
				$('#nome').val(data.nome).prop("disabled",view);
				$('#sobrenome').val(data.sobrenome).prop("disabled",view);			
				$('#email').val(data.email).prop("disabled",view);			
				
				$('#Update-funcionario').prop("disabled",false);			
	 			$('#Excluir-funcionario').prop("disabled",false);
	 			$('#Cancelar-funcionario').prop("disabled",false);
	 			$('#Novo-funcionario').prop("disabled",true);
	 			$('#Pesquisar-funcionario').prop("disabled",true);		
	 			
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
