<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<title>Cadastros</title>

	<s:url value="/resources/css" var="cssPath"/>
	<s:url value="/resources/js" var="jsPath"/>
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
	<link rel="stylesheet" href="${cssPath}/menu.css">
	<s:url value="/resources/img" var="imgPath"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css">
	<link rel="stylesheet" href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
	
	<style type="text/css">		
		.botao {		
			text-align: center;
		}
		
		.btnDireita{
			text-align: right;
		}
					
		thead.corHeaderMarca{
			background-color: #00BFFF;
		}	
		
		thead.corHeaderCategoria{
			background-color: #43CD80;
		}	
		
		thead.corHeaderDescarte{
			background-color: #FF6347;
		}
		
		thead.corHeaderPagamento{
			background-color: #4F4F4F;
		}			
			
		th.alinha-cor{
			text-align: center;
			color: #FFFAFA;					
		}		
		td{
			text-align: center;
		}
		
		.scrollTabelas{
		 	max-height:500px;
		  	overflow-x:auto;
		}		
	</style>	

</head>
<body>

	<div class="page-wrapper chiller-theme toggled">
		<jsp:include page="header.jsp"></jsp:include>
		
		<main class="page-content">
			<div class="container-fluid">
				 <form:form id="formCadMarca" action="marca/save" method="POST" modelAttribute="marca">
					  <div class="card shadow mb-4">
					        <div class="card-header py-3">
					            <button type="button" class="btn btn-primary" id="Novo-marca" onclick="Novo();"><i class="far fa-file"></i> <span><br />Novo</span></button>
					            <button type="button" class="btn btn-primary" id="Update-marca" onclick="Alterar();"><i class="far fa-edit"></i> <span><br />Alterar</span></button>
					            <button type="button" class="btn btn-primary" id="salvar-cad-marca"><i class="fas fa-save"></i> <span><br />Salvar</span></button>
					            <button type="button" class="btn btn-primary" id="Excluir-marca" onclick="ExcluirCadastro();"><i class="fas fa-trash"></i> <span><br />Excluir</span></button>
					            <button type="button" class="btn btn-primary" id="Cancelar-marca" onclick="Cancelar();"><i class="fas fa-bolt"></i> <span><br />Cancelar</span></button>
					            <button type="button" class="btn btn-primary" id="Pesquisar-marca" data-toggle="modal" data-target="#pesquisa"><i class="fas fa-search"></i> <span><br />Pesquisar</span></button>
					            <span style="float:right"><a href="${s:mvcUrl('HC#home').build()}" class="btn btn-primary"><i class="fas fa-sign-out-alt"></i> <span><br />Sair</span></a></span>
					        </div>
					        <br>      
		           
					     
							<div class="modal-body">
								<div class="container-fluid">
									<div class="card">
										<div class="card-body">	
											<div class="row">	
												<div class="col-md-2">
													<h5>Código:</h5>			
													<div class="input-group input-group-lg">																					
														<form:input cssClass="form-control" name="id" path="id" id="id" readonly="true"/>								
													</div>
												</div>		
												<div class="col-md-4">												
													<h5>Marca:</h5>
													<div class="input-group input-group-lg">
														<form:input type="text" cssClass="form-control" id="nome" name="nome" path="nome"/>
													</div>	
												</div>
											</div>														
										</div>	
									</div>	
								</div>
					  		</div>						  
			  			</div>	
		  		</form:form>	
			</div>
		</main>
	</div>	
	
	<div class="modal fade" id="pesquisa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Pesquisa Marca</h5>
	                <button type="button" onclick="Fechar();" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <form>
	                    <div class="input-group">
	                        <input type="text" class="form-control" name="parametro" id="parametro" placeholder="Marca">
	                        <div class="input-group-append">
	                            <button type="button" onclick="Pesquisando('tabela-lista-marcas');" class="btn btn-primary"><i class="fas fa-search"></i></button>
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
	<script type="text/javascript" src="${jsPath}/marca.js"></script>
	<script type="text/javascript" src="${jsPath}/menu.js"></script>
	<script type="text/javascript" src="${jsPath}/site.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>	
	
	<script type="text/javascript">
	
	 $(() => {
         Inicializar();
        
     });

     function Inicializar() {
        $("#salvar-cad-marca").on("click", () => $('#formCadMarca').submit()); 
        HabilitarDesabilitarBotoes(true);
        SubmitCadastroMarca();
     }
	
     function HabilitarDesabilitarBotoes(view){
    	LiberaBloqueiaCamposFormulario(true);
 		$('#Update-marca').prop("disabled",view);
		$('#salvar-cad-marca').prop("disabled",view);
 		$('#Excluir-marca').prop("disabled",view);
 		$('#Cancelar-marca').prop("disabled",view);
     }
	
	
	</script>
</body>
</html>