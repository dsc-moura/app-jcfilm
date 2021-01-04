<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form:form id="FormCadCliente" action="cliente/save" method="POST" modelAttribute="cliente">
	<div class="card shadow mb-4">
        <div class="card-header py-3">
            <button type="button" class="btn btn-primary" id="Novo-cliente" onclick="Novo();"><i class="far fa-file"></i> <span><br />Novo</span></button>
            <button type="button" class="btn btn-primary" id="Update-cliente" onclick="Alterar();"><i class="far fa-edit"></i> <span><br />Alterar</span></button>
            <button type="button" class="btn btn-primary" id="salvar-cad-cliente"><i class="fas fa-save"></i> <span><br />Salvar</span></button>
            <button type="button" class="btn btn-primary" id="Excluir-cliente" onclick="ExcluirCadastro();"><i class="fas fa-trash"></i> <span><br />Excluir</span></button>
            <button type="button" class="btn btn-primary" id="Cancelar-cliente" onclick="Cancelar();"><i class="fas fa-bolt"></i> <span><br />Cancelar</span></button>
            <button type="button" class="btn btn-primary" id="Pesquisar-cliente" data-toggle="modal" data-target="#pesquisa"><i class="fas fa-search"></i> <span><br />Pesquisar</span></button>
            <span style="float:right"><a href="${s:mvcUrl('HC#home').build()}" class="btn btn-primary"><i class="fas fa-sign-out-alt"></i> <span><br />Sair</span></a></span>
        </div>
        <br>
	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
				<div class="row">					
					<form:input cssClass="form-control" name="id" path="id" id="id" type="hidden" readonly="true"/>					
					<div class="col-md-3">
						<h5>Nome:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="nome" name="nome" path="nome"/>
						</div>					
					</div>	
					
					<div class="col-md-6">
						<h5>Sobrenome:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="sobrenome" name="sobrenome" path="sobrenome"/>
						</div>					
					</div>	
					
					<div class="col-md-3">						
						<h5>CPF:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="cpf" name="cpf" path="cpf"/>
						</div>					
					</div>
																
					<div class="col-md-2">
						
						<h5>CEP:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="cep" name="cep" path="cep"/>
						</div>					
					</div>
					<div class="col-md-3">
						
						<h5>Bairro:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="bairro" name="bairro" path="bairro"/>
						</div>					
					</div>
					
					<div class="col-md-5">
						
						<h5>Endereço:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="endereco" name="endereco" path="endereco"/>
						</div>					
					</div>
					
					<div class="col-md-2">
						
						<h5>Nº:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="numero" name="numero" path="numero"/>
						</div>					
					</div>
					
					<div class="col-md-6">
					
						<h5>Complemento:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="complemento" name="complemento" path="complemento"/>
						</div>					
					</div>
					
					<div class="col-md-6">
												
						<h5>E-mail:</h5>
						<div class="input-group input-group-lg">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fas fa-at"></i></span>
							</div>
							<form:input type="text" cssClass="form-control" id="email" name="email" path="email"/>
						</div>					
					</div>
					
					<div class="col-md-4">	
											
						<h5>Telefone:</h5>
						<div class="input-group input-group-lg">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fas fa-phone"></i></span>
							</div>
							<form:input type="text" cssClass="form-control" id="telefone" name="telefone" path="telefone"/>
						</div>											
					</div>					
				</div>					
			</div>				
		</div>	
		<br>	
	</div>		
</div>		
</form:form>	