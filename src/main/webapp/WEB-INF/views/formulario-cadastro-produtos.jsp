<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form:form id="FormCadProduto" action="produto/save" method="POST" modelAttribute="produto">
	<div class="card shadow mb-4">
        <div class="card-header py-3">
            <button type="button" class="btn btn-primary" id="Novo-produto" onclick="Novo();"><i class="far fa-file"></i> <span><br />Novo</span></button>
            <button type="button" class="btn btn-primary" id="Update-produto" onclick="Alterar();"><i class="far fa-edit"></i> <span><br />Alterar</span></button>
            <button type="button" class="btn btn-primary" id="salvar-cad-produto"><i class="fas fa-save"></i> <span><br />Salvar</span></button>
            <button type="button" class="btn btn-primary" id="Excluir-produto" onclick="ExcluirCadastro();"><i class="fas fa-trash"></i> <span><br />Excluir</span></button>
            <button type="button" class="btn btn-primary" id="Cancelar-produto" onclick="Cancelar();"><i class="fas fa-bolt"></i> <span><br />Cancelar</span></button>
            <button type="button" class="btn btn-primary" id="Pesquisar-produto" data-toggle="modal" data-target="#pesquisa"><i class="fas fa-search"></i> <span><br />Pesquisar</span></button>
            <span style="float:right"><a href="${s:mvcUrl('HC#home').build()}" class="btn btn-primary"><i class="fas fa-sign-out-alt"></i> <span><br />Sair</span></a></span>
        </div>
        <br>
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
					<div class="col-md-5">						
						<h5>Produto/Serviço:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="nome" name="nome" path="nome"/>
						</div>					
					</div>	
					<div class="col-md-3">
						<h5>Valor:</h5>
						<div class="input-group input-group-lg">
							<form:input type="text" cssClass="form-control" id="preco" name="preco" path="preco"/>
						</div>					
					</div>										
				</div>					
			</div>				
		</div>	
		<br>	
	</div>		
</div>		
</form:form>	
