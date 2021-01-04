<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form:form id="form-edit-Produto" action="${s:mvcUrl('PCC#UpdateCadastroProduto').build()}" method="POST" commandName="produto">
	<div class="modal-body">
		<div class="container-fluid">
			<div class="card">
				<div class="card-body">
					<div class="row">
						
						<form:input cssClass="form-control" name="id" path="id" id="edit_id" type="hidden" readonly="true"/>
										
						<div class="col-md-9">						
							<h5>Produto/Serviço:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_nome" name="nome" path="nome"/>
							</div>					
						</div>	
						<div class="col-md-3">
							<h5>Valor:</h5>
							<div class="input-group input-group-lg">
								<form:input type="text" cssClass="form-control" id="edit_preco" name="preco" path="preco"/>
							</div>					
						</div>														
				  	</div>				  				
				</div>		
			</div>	
		</div>	
	</div>
	 <div class="modal-footer">
 		<button type="submit" id="update-salvar" class="btn btn-success"><i class="far fa-save"></i> Salvar</button>							
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
	 </div>				
</form:form>						
