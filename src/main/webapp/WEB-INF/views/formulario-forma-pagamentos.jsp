<div class="card">
	<div class="card-body">
		<div id="finalizar-venda-btn" class="row">		  					
			<div style="display: none;" class="col-md-6">			
				<input type="text" class="form-control" id="pago"  value="true" name="pago"/>										
			</div>
			<div class="col-md-5">
				<h5>Forma de Pagamento:</h5>				
				<div class="input-group input-group-lg">
					<select class="form-control" id="tipo" onchange="SelecionaFormaPagamento(this);">
						<option value="">Forma de Pagamento</option>	
						<option value="1">Dinheiro</option>																							
						<option value="2">Cartão Crédito</option>
						<option value="3">Cartão Debito</option>	
						<option value="4">Cheque</option>																													
					</select>						
				</div>										
			</div>		
			<div class="col-md-4">
				<h5>Prazo/Garantia:</h5>
				<div class="input-group input-group-lg">
					<input type="text" class="form-control" id="prazo" name="prazo"/>
				</div>					
			</div>
			<div class="col-md-3">
				<h5>Tempo/Garantia:</h5>
				<div id="lista-veiculos-cliente">
				<div class="input-group input-group-lg">
					<select class="form-control" id="tempo" >
						<option value="">Tempo</option>															
						<option value="0">Dia(s)</option>
						<option value="1">Semana(s)</option>
						<option value="2">Mês(es)</option>
						<option value="3">Ano(s)</option>																									
					</select>						
				</div>	
				</div>							
			</div>		
			<div class="col-md-6" style="display: none;" id="div-parcelas">
				</br>
				<h5>Parcelas:</h5>				
				<div class="input-group input-group-lg">
					<select class="form-control" id="parcelas">
						<option value="">Parcelas</option>	
						<option value="1">Crédito à Vista</option>																							
						<option value="2">Parcelado - 2x</option>
						<option value="3">Parcelado - 3x</option>	
						<option value="4">Parcelado - 4x</option>		
						<option value="5">Parcelado - 5x</option>		
						<option value="6">Parcelado - 6x</option>		
						<option value="7">Parcelado - 7x</option>		
						<option value="8">Parcelado - 8x</option>		
						<option value="9">Parcelado - 9x</option>		
						<option value="10">Parcelado - 10x</option>																													
					</select>						
				</div>											
			</div>				
			
			
			<div class="col-md-4" style="display: none;" id="div-filipeta">
				</br>
				<h5>Nº Filipeta:</h5>
				<div class="input-group input-group-lg">
					<input type="text" class="form-control" id="filipeta" name="filipeta"/>
				</div>					
			</div>											
		</div>
	</div>
</div>