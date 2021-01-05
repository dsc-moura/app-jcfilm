<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<table id="tabela-lista-veiculos"  class="table table-bordered">
	   <thead class="corHeaderveiculo">
			<tr>
				<th class="alinha-cor">Ações</th>
				<th class="alinha-cor">Código</th>
				<th class="alinha-cor">Marca</th>
				<th class="alinha-cor">Modelo/Veículo</th>				
			</tr>
		</thead>
		<tbody id="tabela-veiculos">	
			<c:forEach items="${veiculos}" var="veiculo">
				<tr class="veiculo" id="veiculo-${veiculo.id}">						
					<td id="acoes">							
						<button type="button" class="btn btn-primary" id="visualizar" onclick="EditarVisualizar('${veiculo.id}','${veiculo.nome}','${veiculo.marca.id}');" data-toggle="tooltip" data-placement="top" title="Visualizar"><i class="far fa-folder-open"></i></button>						
		 			</td>	
					<td id="id">${veiculo.id}</td>	
					<td>
						${veiculo.marca.nome}						
					</td>	
						
					<td>
						${veiculo.nome}							
					</td>
														
				</tr>
			</c:forEach>
		</tbody>
	</table>	
