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

<title>Vendas | Orçamentos</title>

	<s:url value="/resources/css" var="cssPath"/>
	<s:url value="/resources/js" var="jsPath"/>
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
	<link rel="stylesheet" href="${cssPath}/menu.css">
	
	<s:url value="/resources/img" var="imgPath"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css">
	<link rel="stylesheet" href="${cssPath}/dataTables.min.css">
	
	
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
		
		thead.corHeadAddUser{
			background-color: #EE6363;
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
		
			body{
			background-color: #EE6363;			
		}
		
		#formulario-clientes{
			background-color: #FFFAFA;
			 width: 98%;
		}
		
		.scrollTabelas{
		 	max-height:250px;
		  	overflow-x:auto;
		}	
		
		.scrollTabelasGarantias{
		 	max-height:600px;
		  	overflow-x:auto;
		}			
	</style>	

</head>
<body>

	<div class="page-wrapper chiller-theme toggled">
		<jsp:include page="header.jsp"></jsp:include>
		
		<main class="page-content">				
				<div class="container-fluid" id="formulario-clientes">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						  <li class="nav-item">
						    	<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Vendas & Orçamentos</a>
						  </li>
					</ul>		
				<br><br>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					
						<div class="card shadow mb-4">
					        <div class="card-header py-3">
					            <button type="button" class="btn btn-primary" id="Novo-venda" onclick="Novo();"><i class="far fa-file fa-1x"></i> <span><br />Novo</span></button>
					            <button type="button" class="btn btn-primary" id="salvar-cad-venda" data-toggle="modal" data-target="#finalizar-venda"><i class="fas fa-handshake"></i> <span><br />Finalizar</span></button>
					            <button type="button" class="btn btn-primary" id="Cancelar-venda" onclick="CancelarProcessoVenda();" ><i class="fas fa-times"></i> <span><br />Cancelar</span></button>
					            <button type="button" class="btn btn-primary" id="Pesquisar-venda" data-toggle="modal" data-target="#pesquisa"><i class="fas fa-search fa-1x"></i> <span><br />Pesquisar</span></button>
					            <span style="float:right"><a href="${s:mvcUrl('HC#home').build()}" class="btn btn-primary"><i class="fas fa-sign-out-alt"></i> <span><br />Sair</span></a></span>
					        </div>	
				        	<br>				
							  	
				  			<div id="tabela-clientes">					  			
						  		<jsp:include page="formulario-cadastro-vendas.jsp"></jsp:include>						  			
						  		<br>
						  			
					  			<div id="formulario-veiculos-cliente">
					  				<jsp:include page="formulario-cadastro-veiculos.jsp"></jsp:include>
					  			</div>
					  			<br>
					  			
					  			<div class="container-fluid">
						  			<div class="card">
						  				<div class="card-body">
								  				<div class="row">
									  				<div class="col-md-6">
														<h5>Funcionário Responsável:</h5>
														<div id="combo-funcionarios">
															<div class="input-group input-group-lg">
																<select class="form-control" id="funcionario" >
																	<option value="">Selecione o Responsável pelo Serviço</option>
																	<c:forEach items="${usuarios}" var="usuario">
																		<option value="${usuario.id}">${usuario.nome} ${usuario.sobrenome}</option>
																	</c:forEach>											
																</select>						
															</div>	
														</div>							
													</div>
													<div class="col-md-6">
														<br>
														<div class="btnDireita">	
															<button type="button" class="btn btn-outline-success btn-lg" data-toggle="modal" data-target="#produtos-servicos">
																<i class="fas fa-plus"></i> SERVIÇO/PRODUTO						
															</button>
														</div>
													</div>
												</div>
												<br>
												
												<div id="tabela-carrinho-compras">
					  								<jsp:include page="tabela-lista-itens-vendas.jsp"></jsp:include>				  								
					  							</div>
				  								<div>
						  							<hr></hr>
						  						</div>
					  							<div class="row">					  							
						  							<div class="col-md-7"></div>				  							
						  							<div class="col-md-5">
							  							<div class="input-group input-group-lg">
								  							<div class="input-group-prepend">
																<button type="button" class="input-group-text"><h4>TOTAL:</h4></button>
															</div>
												 			<input type="text" style="font-family: Tahoma; font-size: 26px" class="form-control" id="total" name="total" readonly="true"/>									
														</div>															
													</div>
												</div>
					  						</div>
					  					</div>
				  					</div>
				  				</div>				  				
				  				<div class="card-body">
					  				<div>
					  					<hr></hr>
					  				</div>				  			
				  	    		</div>
				  	    	</div>	
				  		</div>			  		
						  
				</div>
			</div>			
		</main>
	</div>
		
			
	<!-- MODAL NOVO CLIENTE -->
	<div class="modal fade" id="cliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Cadastrar Cliente</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <jsp:include page="formulario-cadastro-clientes-resumido.jsp"></jsp:include>		   
	    </div>
	  </div>
	</div>
	
	<!-- MODAL NOVO VEICULO -->
	<div class="modal fade" id="veiculo-add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Cadastrar Veículo</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	     	 	<jsp:include page="formulario-cadastro-veiculos-cliente.jsp"></jsp:include>	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-success" onclick="CadastrarVeiculoCliente();"><i class="far fa-save"></i> Salvar</button>				
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
		
		<!-- MODAL NOVO PRODUTOS/SERVIÇOS -->
	<div class="modal fade" id="produtos-servicos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Produtos/Serviços</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	     	 	<jsp:include page="formulario-produtos-servicos-selecao.jsp"></jsp:include>	
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-success" onclick="IniciarProcessoVenda();"><i class="fas fa-arrow-down"></i> Adicionar</button>				
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- MODAL FINALIZAR VENDA -->
	<div class="modal fade" data-backdrop="static" id="finalizar-venda" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Finalizar Venda</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	   
	        </button>
	      </div>
	      <div class="modal-body">	     	 	
	     	 	<jsp:include page="formulario-forma-pagamentos.jsp"></jsp:include>     	 	
	      </div>
	      <div class="modal-footer">	      				
	      	<button type="button" class="btn btn-success" id="btn-finalizar-venda" onclick="FinalizarVendaServicoCliente();"><i class="far fa-save"></i> Salvar</button>				
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
		<!-- MODAL PESQUISAR CLIENTE -->
	<div class="modal fade" id="pesquisa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Pesquisar Cliente</h5>
	                <button type="button" onclick="Fechar();" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <form>
	                    <div class="input-group">
	                        <input type="text" class="form-control" name="parametro" id="parametro" placeholder="Nome, CPF, Telefone, Placa">
	                        <div class="input-group-append">
	                            <button type="button" onclick="Pesquisando('tabela-clientes-pesquisa');" class="btn btn-primary"><i class="fas fa-search"></i></button>
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
	<script type="text/javascript" src="${jsPath}/vendas.js"></script>
	<script type="text/javascript" src="${jsPath}/menu.js"></script>
	<script type="text/javascript" src="${jsPath}/site.js"></script>
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>	
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

	<script type="text/javascript">	
		 $(() => {
	         Inicializar();
	     });
	
	     function Inicializar() {
	        $("#btn-cad-cliente-resumido").on("click", () => $("#FormCadClienteResumido").submit()); 	        
	        SubmitCadastroCliente();	
	        TabelaListaProdutos();    
	     }	
	</script>
	
	
</body>
</html>