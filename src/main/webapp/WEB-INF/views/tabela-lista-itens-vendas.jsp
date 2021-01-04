<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="scrollTabelas">
	<table id="tabela-itens-vendas" class="table table-bordered">
		 <thead class="corHeaderMarca">
		    <tr>
		      <th class="alinha-cor">Serviço/Produto</th>
		      <th class="alinha-cor">Preço</th>	
		      <th class="alinha-cor">Quantidade</th>			
		      <th id="coluna-acoes" class="alinha-cor">Ações</th>						              
		    </tr>
		 </thead>
		 <tbody>
		 	<c:forEach items="${itens}" var="item">
		 		<tr class="produtos-servicos-carrinho" id="item-${item.id}">
		 			<td id="codigo-id-venda" style="display: none;">${item.venda.id}</td>
		 			<td id="codigo-id-produto" style="display: none;">${item.produto.id}</td>
		 			<td>${item.produto.nome}</td>
		 			<td><fmt:formatNumber  type="currency" value="${item.valor}" minFractionDigits="2"/>
		 				<input type="text" class="form-control" value="${item.valor}" id="valor-item" size="8" style="display: none;">
		 			</td>
		 			<td id="qtde-produto-servico">
		 				<span id="qtd-produto-${item.id}">${item.quantidade}</span>
		 				<div class="input-group input-group-lg">
							<input type="text" class="form-control" id="qtd-venda-produto" disabled="disabled" size="2" style="display: none;"/>
							<div class="input-group-append">
				 				<button class="btn btn-outline-secondary" id="aumentar" onclick="aumentar('item-${item.id}');" type="button" style="display: none;"><i class="fas fa-angle-up"></i></button>
				 				<button class="btn btn-outline-secondary" id="diminuir" onclick="diminuir('item-${item.id}');" type="button" style="display: none;"><i class="fas fa-angle-down"></i></button>
							</div>										
						</div>	
		 			</td>			 			
		 			<td id="acoes-tabela">
		 				<button type="button" class="btn btn-success" id="salvar-quantidade" onclick="AlteraQuantidadeProdutoCarrinho(${item.id},'item-${item.id}');" style="display: none;"><i class="far fa-save"></i></button>										        	
			        	<button type="button" class="btn btn-warning" id="update" onclick="update(${item.id},'item-${item.id}');"><i class="fas fa-pencil-alt"></i></button>					
						<button type="button" id="delete" class="btn btn-danger" onclick="excluir(${item.id},'item-${item.id}')"><i class="fas fa-trash-alt"></i></button>
						<button type="button" class="btn btn-success" id="confirmar" onclick="confirmar(${item.id},'item-${item.id}');" style="display: none;" data-toggle="tooltip" data-placement="top" title="Confirmar"><i class="fas fa-check"></i></button>			        	
		        		<button type="button" class="btn btn-danger" id="cancelar" onclick="cancelar('item-${item.id}');" style="display: none;" data-toggle="tooltip" data-placement="top" title="Cancelar"><i class="fas fa-times"></i></button>													
		 			</td>
		 		</tr>
		 	</c:forEach>
		 </tbody>
	</table>
</div>