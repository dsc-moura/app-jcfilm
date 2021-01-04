
 $(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
 

var linhaEdit = null;
function update(id,vlrLinha){
	if(linhaEdit == null || linhaEdit == vlrLinha){
		linhaEdit = vlrLinha;
	}else{
		if($('#'+vlrLinha).find($('#confirma').is(':visible'))){
			cancelarAlteracao(linhaEdit);
			linhaEdit = vlrLinha;
		}	
	}
	$('#'+vlrLinha).find('#update,#delete,span').hide();
	$('#'+vlrLinha).find('#save,#cancela,.form-control').show();
}

function cancelarAlteracao(vlrLinha){
	$('#'+vlrLinha).find('#update,#delete,span').show();
	$('#'+vlrLinha).find('#confirma,#save,#cancela,.form-control').hide();
}

function excluir(id,vlrLinha){
	$('#'+vlrLinha).find('#update,#delete').hide();
	$('#'+vlrLinha).find('#confirma,#cancela').show();
}

function salvar(modo,id,vlrLinha){	
	verificar(modo);
	
	var nome = $('#'+vlrLinha).find('#nome').val().trim();
	
	if(modo = 4){
		var marca = $('#id_marca-'+id+' option:selected').val();
		
		url = url+"/"+id+"/"+nome+"/"+marca;
		
	}else{
		url = url+"/"+id+"/"+nome;
	}
	
	if(nome == ""){
		setTimeout(function() {
	        $.bootstrapGrowl('<i class="fas fa-times"></i> INFORME O NOME', {
	            type: 'danger',
	            width: 300,
	            align: 'right',
	            stackup_spacing: 30
	        });
	    }, 300);
	}else{
		$.ajax({
		    type:  'PUT',
		    url: url,	
		    statusCode:{
		    	200:function(){
		    		setTimeout(function() {
				        $.bootstrapGrowl('<i class="fas fa-check"></i> Cadastro alterado com sucesso!', {
				            type: 'success',
				            width: 350,
				            align: 'right',
				            stackup_spacing: 30
				        });
				    }, 300);
		    	}		
		    } 
		
		}); 
		
		
		$('#'+vlrLinha).find('#id_marca').html($('#id_marca-'+id+' option:selected').text());
		$('#'+vlrLinha).find('#id_veiculo').html(nome);
    	$('#'+vlrLinha).find('.form-control').hide();
		$('#'+vlrLinha).find('span').show();
		cancelarAlteracao(vlrLinha);
	}	
}

var url = null;
function confirmar(modo,id,vlrLinha){	
	verificar(modo);
	var tr = $('#'+vlrLinha).closest('tr');	
	
	$.ajax({
	    type:  'PUT',
	    url:   url+id,	   
	    statusCode:{
	    	200:function(){
	    		setTimeout(function() {
	    			tr.fadeOut(400, function(){tr.remove();});
			        $.bootstrapGrowl('<i class="fas fa-check"></i> Cadastro excluído com sucesso!', {
			            type: 'success',
			            width: 350,
			            align: 'right',
			            stackup_spacing: 30
			        });
			    }, 300);
	    	}
	    }
	}); 
}

function verificar(modo){
	url = null;
	switch (modo) {
	    case 1:
	    	url="excluir-marca/";
	        break;
	    case 2:
	    	url="excluir-veiculo/"
	        break;
	    case 3:
	    	url="update-marca"
	        break;
	    case 4:
	    	url="update-veiculo"
	        break;
	    case 5:
	    	url="update-marca";
	        break;
	    case 6:
	    	url="update-categoria"
	        break;
	    case 7:
	    	url="update-pagamento"
	        break;
	    case 8:
	    	url="update-motivo-descarte";
	        break;
	    default:
	        alert('ERRO');
	}	
}