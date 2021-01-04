<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<html>
<head>
	<c:url value="/resources/css" var="cssPath"/>
	<c:url value="/resources/js" var="jsPath"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>	
	
	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
	 
	<link rel="stylesheet" href="${cssPath}/fontawesome.css">
	<link rel="stylesheet" href="${cssPath}/cadastros.css">
	
    <title>JC SOM FILM</title>
	
	<style>
		.centered {
			margin: 0 auto !important;
			float: none !important;
		}
		
		.footer {
			position:absolute;
			bottom:0;
			width:100%;
		}	
	</style>
</head>
<body>
    <nav class="navbar w3-blue">
		<a class="navbar-brand" href="#">	JC SOM </a>
	</nav>
	
	<!-- MODAL ESQUECI A SENHA -->
	<div class="modal fade" id="myModalSenha">
	   <div class="modal-dialog">
	      <div class="modal-content">      
	        <!-- Modal Header -->
	        <div class="modal-header">
		          <h5 id="titulo" class="titutloModal">ESQUECEU A SENHA!</h5>		         
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <div class="container-fluid">
	        	<h4 style="font-family: Arial" align="center">CONTATE O ADMINISTRADOR DO SISTEMA!!</h4>	        
	        </div>		
	       <div class="modal-footer">	       	 
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
	       </div>        
	     </div>
	   </div>
    </div>   
	
	
	<div class="row col-md-12 centered">
		<div class="col-md-9 ">		
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
				<div class="carousel-item active">
				  <img class="d-block w-100" src="https://static1.squarespace.com/static/58df1954d1758e214415ff42/t/5a654663e4966ba2422575b0/1516586643198/Screen+Shot+2018-01-21+at+7.00.55+PM.png?format=1500w" alt="First slide" style="min-height:100%;">				
				</div>					
			  </div>
			</div>	
		</div>
			
        <div class="col-md-3 ">
			 <br>	
			 <form:form servletRelativeAction="/index" method="POST">  
				 <div class="w3-card-4" style="margin-left:-10px;">				
					<header class="w3-container w3-blue">
					  <h5><span class="fas fa-globe-asia"></span> Acesso</h5>
					</header>
					<br>
					<div class="w3-container">
					  <div class="form-row">                         
						<div class="col-md-12 mb-3">
						  <label for="validationDefaultUsername">Login</label>
						  <div class="input-group">
							<div class="input-group-prepend">
							  <span class="input-group-text" ><span class="fa fa-user"></span></span>
							</div>                                                
							 <input type="text" name="username" class="form-control" placeholder="Seu Login">
						  </div>
						</div>
					  </div>
					  <div class="form-row">
						 <div class="col-md-12 mb-3">
						  <label for="validationDefaultUsername">Senha</label>
						  <div class="input-group">
							<div class="input-group-prepend">
							  <span class="input-group-text"><span class="fa fa-lock"></span></span>
							</div>
							<input type="password" name="password" class="form-control" placeholder="Sua Senha">
						  </div>
						</div>					
					  </div>
					  <div class="form-row">
						 <div class="col-md-12 mb-3">
							<input type="checkbox" class="form-check-input" id="exampleCheck1" style="margin-left:0px;">
							<label class="form-check-label" for="exampleCheck1" style="margin-left:20px;">Lembrar identificação de usuário</label>
						 </div>
					  </div>
					  <div class="row col-md-12 centered">
						  <button type="submit" class="btn btn-primary" style="width:100%"><span class="fas fa-arrow-right"></span> Entrar</button>
					  </div>				  
					</div>				
					<br>			
					<footer class="w3-container w3-blue text-center">
						<span data-toggle="modal" data-target="#myModalSenha">Esqueceu a senha, <a href="#">clique aqui</a>!</span>
					</footer>
				 </div>
				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form:form> 
        </div>
    </div>		
	<div class="footer w3-blue text-center">
		DSCM - SOLUÇÕES
	</div>
   	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>	