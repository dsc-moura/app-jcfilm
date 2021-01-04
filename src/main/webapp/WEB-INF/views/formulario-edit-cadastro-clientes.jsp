<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form:form id="FormUpdateCliente" action="cliente/save" method="POST" modelAttribute="cliente">
	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
				<div class="row">					
						<form:input cssClass="form-control" name="id" path="id" id="edit_id" type="hidden" readonly="true"/>					
						<div class="col-md-3">
							<h5>Nome:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_nome" name="nome" path="nome"/>
							</div>					
						</div>	
						
						<div class="col-md-6">
							<h5>Sobrenome:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_sobrenome" name="sobrenome" path="sobrenome"/>
							</div>					
						</div>	
						
						<div class="col-md-3">						
							<h5>CPF:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_cpf" name="cpf" path="cpf"/>
							</div>					
						</div>					
																			
						<div class="col-md-2">
							<br>
							<h5>CEP:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_cep" name="cep" path="cep"/>
							</div>					
						</div>
						
						<div class="col-md-3">
							<br>
							<h5>Bairro:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_bairro" name="bairro" path="bairro"/>
							</div>					
						</div>
						
						<div class="col-md-5">
							<br>
							<h5>Endereço:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_endereco" name="endereco" path="endereco"/>
							</div>					
						</div>
						
						<div class="col-md-2">
							<br>
							<h5>Nº:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_numero" name="numero" path="numero"/>
							</div>					
						</div>
						
						<div class="col-md-6">
						<br>
							<h5>Complemento:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_complemento" name="complemento" path="complemento"/>
							</div>					
						</div>
						
						<div class="col-md-6">
							<br>						
							<h5>E-mail:</h5>
							<div class="input-group input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fas fa-at"></i></span>
								</div>
								<form:input type="text" cssClass="form-control" id="edit_email" name="email" path="email"/>
							</div>					
						</div>
						
						<div class="col-md-4">	
							<br>					
							<h5>Telefone:</h5>
							<div class="input-group input-group-lg">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fas fa-phone"></i></span>
								</div>
								<form:input type="text" cssClass="form-control" id="edit_telefone" name="telefone" path="telefone"/>
							</div>					
						</div>
					</div>
					<div class="botao">
					<br>
					<button type="button" id="update-cliente-cancelar" onclick="cancelar('profile-tab')" class="btn btn-danger btn-lg"><i class="fas fa-times"></i> CANCELAR</button>				
					<button type="button" id="update-cliente-salvar" class="btn btn-success btn-lg"><i class="far fa-save"></i> SALVAR</button>				
				</div>		
				</div>				  
									
			</div>		
		</div>	
				
</form:form>	