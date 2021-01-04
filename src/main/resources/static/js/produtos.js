$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


$('#preco').maskMoney({
	  allowNegative: true,
	  decimal: '.',
	  thousands: '.'
});	


 function SubmitCadastroProduto() {
     $('#FormCadProduto').submit(function (e) {
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
	$('#salvar-cad-produto').prop("disabled",false);	
	$('#Cancelar-produto').prop("disabled",false);
	$('#Pesquisar-produto').prop("disabled",true);
}

function Cancelar(){
	Atualizar();	
	HabilitarDesabilitarBotoes(true);
	$('#Novo-produto').prop("disabled",false);
	$('#Pesquisar-produto').prop("disabled",false);
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
        url: 'produto/pesquisa/'+parametro,        
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

function Atualizar(){
	 $(':input','#FormCadProduto')
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
                url: 'produto/'+id,
                type: 'DELETE',                
                statusCode:{
			    	201:function(data){	 
			    		 AlertSucesso(data.responseText);
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
	$('#preco').prop("disabled",view);	    
}

function Alterar(){
	LiberaBloqueiaCamposFormulario(false);
	$('#Update-produto').prop("disabled",true);
	$('#salvar-cad-produto').prop("disabled",false);
	$('#Excluir-produto').prop("disabled",true);
	$('#Cancelar-produto').prop("disabled",false);
}
 
function Fechar(){
 	$('#parametro').val();
 	$('#tabela-resultado-pesquisa').hide(); 	
 	$('#pesquisa').modal('hide');
 }
 

function EditarVisualizar(id,nome,preco){			    	
	$('#id').val(id);
	$('#nome').val(nome).prop("disabled",true);
	$('#preco').val(preco).prop("disabled",true);
	
	$('#Update-produto').prop("disabled",false);			
	$('#Excluir-produto').prop("disabled",false);
	$('#Cancelar-produto').prop("disabled",false);
	$('#Novo-produto').prop("disabled",true);
	$('#Pesquisar-produto').prop("disabled",true);		
	
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


