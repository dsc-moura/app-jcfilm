<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<table id="tabela-lista-produtos" class="table table-bordered">
   <thead class="corHeaderProduto">
		<tr>
			<th class="alinha-cor">Ações</th>	
			<th class="alinha-cor">Código</th>	
			<th class="alinha-cor">Serviço/Produto</th>
			<th class="alinha-cor">Preço</th>
			
		</tr>
	</thead>
	<tbody>	
		<c:forEach items="${produtos}" var="produto">
			<tr id="produto-${produto.id}">
				<td id="acoes">							
						<button type="button" class="btn btn-primary" id="visualizar" onclick="EditarVisualizar('${produto.id}','${produto.nome}','${produto.preco}');" data-toggle="tooltip" data-placement="top" title="Visualizar"><i class="far fa-eye"></i></button>						
		 		</td>
		 		<td>${produto.id}</td>				
				<td>${produto.nome}</td>
				<td>
					<fmt:formatNumber  type="currency" value="${produto.preco}" minFractionDigits="2"/>
				</td>									
			</tr>
		</c:forEach>
	</tbody>
</table>	