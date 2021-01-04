$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


 function SubmitCadastroVeiculo() {
     $('#formCadVeiculo').submit(function (e) {
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

function Novo(){
	Atualizar();
	LiberaBloqueiaCamposFormulario(false);
	$('#salvar-cad-veiculo').prop("disabled",false);	
	$('#Cancelar-veiculo').prop("disabled",false);
	$('#Pesquisar-veiculo').prop("disabled",true);	
}

function Cancelar(){
	Atualizar();	
	HabilitarDesabilitarBotoes(true);
	$('#Novo-veiculo').prop("disabled",false);
	$('#Pesquisar-veiculo').prop("disabled",false);
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
        url: 'veiculo/pesquisa/'+parametro,        
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

function Atualizar(){
	 $(':input','#formCadVeiculo')
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
        text: "Você deseja realmente excluir o cadastro?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.ajax({
                url: 'veiculo/'+id,
                type: 'DELETE',
                statusCode:{
			    	200:function(data){	 
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


function LiberaBloqueiaCamposFormulario(view){
	$('#nome').prop("disabled",view);	    
	$('#marca').prop("disabled",view);
}

function Alterar(){
	LiberaBloqueiaCamposFormulario(false);
	$('#Update-veiculo').prop("disabled",true);
	$('#salvar-cad-veiculo').prop("disabled",false);
	$('#Excluir-veiculo').prop("disabled",true);
	$('#Cancelar-veiculo').prop("disabled",false);
}
 
function Fechar(){
 	$('#parametro').val();
 	$('#tabela-resultado-pesquisa').hide(); 	
 	$('#pesquisa').modal('hide');
 }
 

function EditarVisualizar(id,nome,modelo){			    	
	$('#id').val(id);
	$('#nome').val(nome).prop("disabled",true);
	$('#marca').val(modelo).prop("disabled",true);
	
	$('#Update-veiculo').prop("disabled",false);			
	$('#Excluir-veiculo').prop("disabled",false);
	$('#Cancelar-veiculo').prop("disabled",false);
	$('#Novo-veiculo').prop("disabled",true);
	$('#Pesquisar-veiculo').prop("disabled",true);		
	
	Fechar();
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

