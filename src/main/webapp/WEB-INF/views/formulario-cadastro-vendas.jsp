<form id="form-cliente-vendas"  method="POST">
	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
				<div class="row" id="formulario-info-clientes">
					<input class="form-control" name="id" id="vid-cliente" type="hidden" readonly="true"/>
					<input class="form-control" name="id-codigo-venda" value="0" id="id-codigo-venda" type="hidden" readonly="true"/>
					<div class="col-md-4">						
						<h5>CPF/Telefone:</h5>
						<div class="input-group input-group-lg">
							<input type="text" class="form-control" id="vcpf" name="cpf"/>
							<div class="input-group-prepend">
								<button type="button" class="input-group-text" onclick="ProcurarCliente();"><i class="fas fa-search"></i></button>
							</div>
						</div>					
					</div>		
					<div class="col-md-8">
						<br>
						<div class="btnDireita">	
							<button type="button" class="btn btn-outline-primary btn-lg" data-toggle="modal" data-target="#cliente">
								<i class="fas fa-user-tie"></i> NOVO CLIENTE						
							</button>
						</div>
					</div>	
					
					<div class="col-md-6">
						<h5>Nome:</h5>
						<div class="input-group input-group-lg">
							<input type="text" class="form-control" id="vnome" name="nome" readonly="true"/>
						</div>					
					</div>	
					
					<div class="col-md-6">
						<h5>Sobrenome:</h5>
						<div class="input-group input-group-lg">
							<input type="text" class="form-control" id="vsobrenome" name="sobrenome" readonly="true"/>
						</div>					
					</div>										
					
				</div>						
			</div>		
		</div>	
	</div>				
</form>