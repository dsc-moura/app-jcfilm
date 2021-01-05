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

<title>Acessos</title>

	<s:url value="/resources/css" var="cssPath"/>
	<s:url value="/resources/js" var="jsPath"/>
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
	<link rel="stylesheet" href="${cssPath}/menu.css">
	<s:url value="/resources/img" var="imgPath"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css">
	<link rel="stylesheet" href="${cssPath}/dataTables.min.css">
	
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
			<div class="container-fluid">
				 <form:form id="formCadAcesso" action="acesso/save" method="POST" modelAttribute="acesso">
					  <div class="card shadow mb-4">
					        <div class="card-header py-3">
					            <button type="button" class="btn btn-primary" id="Novo-acesso" onclick="Novo();"><i class="far fa-file"></i> <span><br />Novo</span></button>
					            <button type="button" class="btn btn-primary" id="Update-acesso" onclick="Alterar();"><i class="far fa-edit"></i> <span><br />Alterar</span></button>
					            <button type="button" class="btn btn-primary" id="salvar-cad-acesso"><i class="fas fa-save"></i> <span><br />Salvar</span></button>
					            <button type="button" class="btn btn-primary" id="Excluir-acesso" onclick="ExcluirCadastro();"><i class="fas fa-trash"></i> <span><br />Excluir</span></button>
					            <button type="button" class="btn btn-primary" id="Cancelar-acesso" onclick="Cancelar();"><i class="fas fa-bolt"></i> <span><br />Cancelar</span></button>
					            <button type="button" class="btn btn-primary" id="Pesquisar-acesso" data-toggle="modal" data-target="#pesquisa"><i class="fas fa-search"></i> <span><br />Pesquisar</span></button>
					            <span style="float:right"><a href="${s:mvcUrl('HC#home').build()}" class="btn btn-primary"><i class="fas fa-sign-out-alt"></i> <span><br />Sair</span></a></span>
					        </div>
					        <br>      
		           
							<div class="modal-body">
								<div class="container-fluid">
									<div class="card">
										<div class="card-body">	
											<div class="row">	
												<form:input cssClass="form-control" name="id" path="id" id="id"  type="hidden" readonly="true"/>														
												<form:input cssClass="form-control" id="usuario-cod" name="usuario.id" path="usuario.id"  type="hidden" readonly="true"/>
												<form:input cssClass="form-control" id="permissao" name="permissao" path="permissao"  type="hidden" readonly="true"/>
												<div class="col-md-1">												
													<h5>Acesso:</h5>
													<button type="button" id="usuario-acesso"  class="btn btn-secondary" onclick="AtribuirAcesso(this);">
														<i class="fas fa-check"></i>
													</button>	
												</div>
															
												<div class="col-md-4">												
													<h5>Nome:</h5>
													<div class="input-group input-group-lg">
														<form:input type="text" cssClass="form-control" id="usuario-nome" name="usuario.nome" path="usuario.nome" readonly="true"/>
													</div>	
												</div>	
												<div class="col-md-7">												
													<h5>Sobrenome:</h5>
													<div class="input-group input-group-lg">
														<form:input type="text" cssClass="form-control" id="usuario-sobrenome" name="usuario.sobrenome" path="usuario.sobrenome" readonly="true"/>
													</div>	
												</div>	
												<div class="col-md-6">												
													<h5>E-mail:</h5>
													<div class="input-group input-group-lg">
														<form:input type="text" cssClass="form-control" id="usuario-email" name="usuario.email" path="usuario.email" readonly="true"/>
													</div>	
												</div>			
												<div class="col-md-6">												
													<h5>Senha:</h5>
													<div class="input-group input-group-lg">
														<form:input type="password" cssClass="form-control" id="usuario-senha" name="senha" path="senha"/>
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
	                <h5 class="modal-title" id="exampleModalLabel">Pesquisa Funcionarios</h5>
	                <button type="button" onclick="Fechar();" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <form>
	                    <div class="input-group">
	                        <input type="text" class="form-control" name="parametro" id="parametro" placeholder="Nome">
	                        <div class="input-group-append">
	                            <button type="button" onclick="Pesquisando('tabela-lista-funcionarios-acesso');" class="btn btn-primary"><i class="fas fa-search"></i></button>
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
	<script type="text/javascript" src="${jsPath}/acessos.js"></script>
	<script type="text/javascript" src="${jsPath}/menu.js"></script>
	<script type="text/javascript" src="${jsPath}/site.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>	
	
	<script type="text/javascript">
	
	 $(() => {
         Inicializar();
        
     });

     function Inicializar() {
        $("#salvar-cad-acesso").on("click", () => $('#formCadAcesso').submit()); 
        HabilitarDesabilitarBotoes(true);
        SubmitCadastroAcesso();
     }
	
     function HabilitarDesabilitarBotoes(view){
    	LiberaBloqueiaCamposFormulario(true);
 		$('#Update-acesso').prop("disabled",view);
		$('#salvar-cad-acesso').prop("disabled",view);
 		$('#Excluir-acesso').prop("disabled",view);
 		$('#Cancelar-acesso').prop("disabled",view);
     }
	
	
	</script>
</body>
</html>