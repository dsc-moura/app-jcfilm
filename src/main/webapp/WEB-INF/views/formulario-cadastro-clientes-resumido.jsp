<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   		  
	     		      		
	 
<form:form id="FormCadClienteResumido" action="cliente/save" method="POST" modelAttribute="cliente">
	<div class="modal-body">
		<div class="container-fluid">
			<div class="card">
				<div class="card-body">
					<div class="row">					
						<form:input class="form-control" name="id" id="id" type="hidden" path="id" readonly="true"/>					
						
						<div class="col-md-6">						
							<h5>CPF:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" class="form-control" id="cpf" name="cpf" path="cpf"/>
							</div>					
						</div>	
						
						<div class="col-md-6">
							<h5>Nome:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" class="form-control" id="nome" name="nome" path="nome"/>
							</div>					
						</div>	
						
						<div class="col-md-6">
							<h5>Sobrenome:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" class="form-control" id="sobrenome" name="sobrenome" path="sobrenome"/>
							</div>					
						</div>	
									
						<div class="col-md-6">						
							<h5>E-mail:</h5>
							<div class="input-group input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fas fa-at"></i></span>
								</div>
								<form:input type="text" class="form-control" id="email" name="email" path="email"/>
							</div>					
						</div>
						
						<div class="col-md-6">					
							<h5>Telefone:</h5>
							<div class="input-group input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fas fa-phone"></i></span>
								</div>
								<form:input type="text" class="form-control" id="telefone" name="telefone" path="telefone"/>
							</div>					
						</div>
					</div>							
				</div>		
			</div>	
		</div>	
	 </div>
	 <div class="modal-footer">
	 	<button type="button" id="btn-cad-cliente-resumido" class="btn btn-success" ><i class="far fa-save"></i> Salvar</button>				
	   	<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
	 </div>			
</form:form>	