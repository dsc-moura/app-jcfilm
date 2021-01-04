$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


 function SubmitCadastroMarca() {
     $('#formCadMarca').submit(function (e) {
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
	$('#salvar-cad-marca').prop("disabled",false);	
	$('#Cancelar-marca').prop("disabled",false);
	$('#Pesquisar-marca').prop("disabled",true);
}

function Cancelar(){
	Atualizar();	
	HabilitarDesabilitarBotoes(true);
	$('#Novo-marca').prop("disabled",false);
	$('#Pesquisar-marca').prop("disabled",false);
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
        url: 'marca/pesquisa/'+parametro,        
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
	 $(':input','#formCadMarca')
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
                url: 'marca/'+id,
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


function LiberaBloqueiaCamposFormulario(view){
	$('#nome').prop("disabled",view);	    
}

function Alterar(){
	LiberaBloqueiaCamposFormulario(false);
	$('#Update-marca').prop("disabled",true);
	$('#salvar-cad-marca').prop("disabled",false);
	$('#Excluir-marca').prop("disabled",true);
	$('#Cancelar-marca').prop("disabled",false);
}
 
function Fechar(){
 	$('#parametro').val();
 	$('#tabela-resultado-pesquisa').hide(); 	
 	$('#pesquisa').modal('hide');
 }
 

function EditarVisualizar(id,nome){			    	
	$('#id').val(id);
	$('#nome').val(nome).prop("disabled",true);
	
	$('#Update-marca').prop("disabled",false);			
	$('#Excluir-marca').prop("disabled",false);
	$('#Cancelar-marca').prop("disabled",false);
	$('#Novo-marca').prop("disabled",true);
	$('#Pesquisar-marca').prop("disabled",true);		
	
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
