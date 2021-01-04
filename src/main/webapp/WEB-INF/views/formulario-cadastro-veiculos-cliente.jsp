<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form id="formulario-clientes-veiculos"  method="POST" >
	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-5">
						<h5>Veículo/Modelo:</h5>
						<div class="input-group input-group-lg">
							<select class="form-control" id="veiculo" >
								<option value="">Selecione o Véiculo</option>
								<c:forEach items="${veiculos}" var="veiculo">
									<option value="${veiculo.id}">${veiculo.nome}</option>
								</c:forEach>											
							</select>						
						</div>								
					</div>				
				
					<div class="col-md-4">
						<h5>Placa:</h5>
						<div class="input-group input-group-lg">
							<input type="text" class="form-control" id="placa" name="placa"/>
						</div>					
					</div>					
					<div class="col-md-3">
						<h5>Ano:</h5>
						<div class="input-group input-group-lg">
							<input type="text" class="form-control" id="ano" name="ano"/>
						</div>					
					</div>				
				</div>								
			</div>		
		</div>	
	</div>				
</form>