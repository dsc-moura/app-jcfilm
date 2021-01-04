<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>


<title>Cadastro de Funcionarios</title>

	<s:url value="/resources/css" var="cssPath"/>
	<s:url value="/resources/img" var="imgPath"/>
	<s:url value="/resources/js" var="jsPath"/>
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">	
	<link rel="stylesheet" href="${cssPath}/menu.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css">
	<link rel="stylesheet" href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">		

	<style type="text/css">		
		.botao {		
			text-align: right;
		}
		
		.btnDireita{
			text-align: right;
		}
					
		thead.corHeadAddUser{
			background-color: #EE6363;
		}		
		th.alinha-cor{
			text-align: center;
			color: #FFFAFA;					
		}		
		td{
			text-align: center;
		}	
		#formulario-clientes{
			background-color: #FFFAFA;
			 width: 98%;
		}
		body{
			background-color: #EE6363;			
		}	
	</style>

</head>
<body>

	<div class="page-wrapper chiller-theme toggled">
		<jsp:include page="header.jsp"></jsp:include>
		
		<main class="page-content">		
			<div class="container-fluid" id="formulario-funcionario">
				<div id="cadastro-clientes" >
			  			<jsp:include page="formulario-cadastro-funcionario.jsp"></jsp:include>
		 		 </div>
			</div>
		</main>
	</div>
	
<div class="modal fade" id="pesquisa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Pesquisa Funcionarios</h5>
                <button type="button" onclick="Fechar();" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="input-group">
                        <input type="text" class="form-control" name="parametro" id="parametro" placeholder="Nome, CPF, Telefone">
                        <div class="input-group-append">
                            <button type="button" onclick="Pesquisando('tabela-lista-funcionarios');" class="btn btn-primary"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
                <div id="load-pesquisa" style="display:none;">                
                    <div class="alert alert-light text-center" role="alert"><img alt="logo-jcfilm" src="${imgPath}/loading.gif"/> Pesquisando...</div>
                </div>
                <br>
                <br>
                <div id="tabela-resultado-pesquisa" style="display:none;">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="Fechar();" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>
	
	<script type="text/javascript" src="${jsPath}/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrap.min.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrapGrowl.js"></script>
	<script type="text/javascript" src="${jsPath}/funcionario.js"></script>
	<script type="text/javascript" src="${jsPath}/menu.js"></script>
	<script type="text/javascript" src="${jsPath}/site.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>	
	
	<script type="text/javascript">
	
	 $(() => {
         Inicializar();
        
     });

     function Inicializar() {
        $("#salvar-cad-funcionario").on("click", () => $("#FormCadFuncionario").submit()); 
        HabilitarDesabilitarBotoes(true);
        SubmitCadastroCliente();
     }
	
     function HabilitarDesabilitarBotoes(view){
    	LiberaBloqueiaCamposFormulario(true);
 		$('#Update-funcionario').prop("disabled",view);
		$('#salvar-cad-funcionario').prop("disabled",view);
 		$('#Excluir-funcionario').prop("disabled",view);
 		$('#Cancelar-funcionario').prop("disabled",view);
     }
	
	
	</script>
	
</body>
</html>