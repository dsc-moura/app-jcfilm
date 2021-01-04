<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form:form id="FormCadFuncionario" action="funcionario/save" method="POST" modelAttribute="usuario">
	<div class="card shadow mb-4">
        <div class="card-header py-3">
            <button type="button" class="btn btn-primary" id="Novo-funcionario" onclick="Novo();"><i class="far fa-file"></i> <span><br />Novo</span></button>
            <button type="button" class="btn btn-primary" id="Update-funcionario" onclick="Alterar();"><i class="far fa-edit"></i> <span><br />Alterar</span></button>
            <button type="button" class="btn btn-primary" id="salvar-cad-funcionario"><i class="fas fa-save"></i> <span><br />Salvar</span></button>
            <button type="button" class="btn btn-primary" id="Excluir-funcionario" onclick="ExcluirCadastro();"><i class="fas fa-trash"></i> <span><br />Excluir</span></button>
            <button type="button" class="btn btn-primary" id="Cancelar-funcionario" onclick="Cancelar();"><i class="fas fa-bolt"></i> <span><br />Cancelar</span></button>
            <button type="button" class="btn btn-primary" id="Pesquisar-funcionario" data-toggle="modal" data-target="#pesquisa"><i class="fas fa-search"></i> <span><br />Pesquisar</span></button>
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
					
					<div class="col-md-4">
						<h5>Sobrenome:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="sobrenome" name="sobrenome" path="sobrenome"/>
						</div>					
					</div>						
					
					<div class="col-md-5">										
						<h5>E-mail:</h5>
						<div class="input-group input-group-lg">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-lg"><i class="fas fa-at"></i></span>
							</div>
							<form:input type="text" cssClass="form-control" id="email" name="email" path="email"/>
						</div>					
					</div>					
									
				</div>					
			</div>				
		</div>	
		<br>	
	</div>		
</div>		
</form:form>	