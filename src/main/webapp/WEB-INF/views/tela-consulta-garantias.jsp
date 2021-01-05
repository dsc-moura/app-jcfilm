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

<title>Lista Vendas & Garantias</title>

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
					    	<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Lista Vendas & Garantias</a>
					  </li>					
				</ul>		
				<br><br>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<div id="tabela-resultado-pesquisa" style="display:none;"></div>		
	                
	                	</br>
	                
	                	<span class="badge badge-light">Lengenda:</span>
				  		<span class="badge badge-success"><i class="fas fa-check"></i> Venda Finalizada (Paga)</span>
						<span class="badge badge-danger"><i class="fas fa-times"></i> Venda em Aberto (Não Paga)</span>		
			  		</div>				  
				</div>
			</div>				
		
		</main>
	</div>
	
	<!-- MODAL LISTA DE SERVIÇOS -->
	<div class="modal fade" id="lista-itens-produtos-servicos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Serviços Realizados</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		<div id="itens-garantia-cliente"> 
	      			<jsp:include page="tabela-lista-itens-vendidos.jsp"></jsp:include>	
	      		</div>	     	 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>	
	
	<script type="text/javascript" src="${jsPath}/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${jsPath}/bootstrap.min.js"></script>
	<script type="text/javascript" src="${jsPath}/menu.js"></script>
	<script type="text/javascript" src="${jsPath}/site.js"></script>			
	<script type="text/javascript" src="${jsPath}/garantias.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	
	<script type="text/javascript">	
		 $(() => {
	         Inicializar();
	     });
	
	     function Inicializar() {
	    	 TabelaListaVendas('tabela-lista-vendas');  
	     }	
	</script>
</body>
</html>