<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<table id="tabela-lista-marcas" class="table table-bordered">
	   <thead class="corHeaderMarca">
			<tr>
				<th class="alinha-cor">Ações</th>
				<th class="alinha-cor">Código</th>			
				<th class="alinha-cor">Marca</th>				
			</tr>
		</thead>
		<tbody id="tabelaDeMarcas">	
			<c:forEach items="${marcas}" var="marca">
				<tr class="marca" id="marca-${marca.id}">						
					<td id="acoes">							
						<button type="button" class="btn btn-primary" id="visualizar" onclick="EditarVisualizar('${marca.id}','${marca.nome}');" data-toggle="tooltip" data-placement="top" title="Visualizar"><i class="far fa-eye"></i></button>						
		 			</td>	
					<td id="id">${marca.id}</td>			
					<td>
						${marca.nome}						
					</td>														
				</tr>
			</c:forEach>
		</tbody>
	</table>	
