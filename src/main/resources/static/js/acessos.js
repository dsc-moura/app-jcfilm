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
	$('#salvar-cad-acesso').prop("disabled",false);	
	$('#Cancelar-acesso').prop("disabled",false);
	$('#Pesquisar-acesso').prop("disabled",true);
}

function LiberaBloqueiaCamposFormulario(view){
	$('#usuario-senha').prop("disabled",view);	
}

function Cancelar(){
	Atualizar();	
	HabilitarDesabilitarBotoes(true);
	$('#Novo-acesso').prop("disabled",false);
	$('#Pesquisar-acesso').prop("disabled",false);
}

function Atualizar(){
	 $(':input','#FormCadAcesso')
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
        text: "Você deseja realmente excluir o cadastro do Acesso?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.ajax({
                url: 'acesso/delete/'+id,
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
        url: 'acesso/pesquisa/'+parametro,        
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
	$('#Update-acesso').prop("disabled",true);
	$('#salvar-cad-acesso').prop("disabled",false);
	$('#Excluir-acesso').prop("disabled",true);
	$('#Cancelar-acesso').prop("disabled",false);
}

 function SubmitCadastroAcesso() {
     $('#FormCadAcesso').submit(function (e) {
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
	    url:   'acesso/dados/'+id,	
	     statusCode:{
	    	200:function(data){	 
	    		$('#id').val(data.id);
				$('#usuario-nome').val(data.usuario.nome);
				$('#usuario-sobrenome').val(data.usuario.sobrenome);			
				$('#usuario-email').val(data.usuario.email);		
				$('#usuario-cod').val(data.usuario.id);		
				$('#usuario-senha').val(data.senha).prop("disabled",view);	
					
				if(data.permissao){
					$('#usuario-acesso').attr('class', 'btn btn-success');
					$('#usuario-acesso').val('true');
					$('#permissao').val('true');				
				}else{
					$('#usuario-acesso').attr('class', 'btn btn-secondary');
					$('#usuario-acesso').val('false');	
					$('#permissao').val('false');			
				}
									
				$('#Update-acesso').prop("disabled",false);			
	 			$('#Excluir-acesso').prop("disabled",false);
	 			$('#Cancelar-acesso').prop("disabled",false);
	 			$('#Novo-acesso').prop("disabled",true);
	 			$('#Pesquisar-acesso').prop("disabled",true);		
	 			
	 			Fechar();		    
	    	},
	    	400:function(){	
	    	 	AlertErro("Não foi possível resgatar os dados para apresentar!");
	    	},
    	}   	    
	});
}

function AtribuirAcesso(e) {
	var valor = $(e).val();
	if(valor == 'false'){
		$(e).attr('class', 'btn btn-success');
		$(e).val('true');
		$('#permissao').val('true');
	}if(valor == 'true'){
		$(e).attr('class', 'btn btn-secondary');
		$(e).val('false');	
		$('#permissao').val('false');	
	}
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
