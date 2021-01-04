<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


	<table id="tabela-lista-vendas" class="table table-bordered">
		 <thead class="corHeaderMarca">
		    <tr>
		      	<th class="alinha-cor">Data Serviço</th>
		      	<th class="alinha-cor">Garantia</th>	
		      	<th class="alinha-cor">Venc. Garantia</th>	
		      	<th class="alinha-cor">Situação</th>
		       	<th class="alinha-cor">Func. Responsável</th>	
		       	<th class="alinha-cor">Cliente</th>	
		       	<th class="alinha-cor">Veículo</th>	
		       	<th class="alinha-cor">Placa</th>	
		       	<th class="alinha-cor">R$</th>		     		
		      	<th id="coluna-acoes" class="alinha-cor">Ações</th>						              
		    </tr>
		 </thead>
		 <tbody>
		 	<c:forEach items="${vendas}" var="venda">
		 		<tr class="lista-garantias" id="venda-${venda.id}">		 			
		 			<td><fmt:formatDate pattern="dd/MM/yyyy" value="${venda.data.time}"/></td>	
		 			<td>${venda.prazo} ${venda.descPrazo}</td>
		 			<td><fmt:formatDate pattern="dd/MM/yyyy" value="${venda.vencimento.time}"/></td>		 			
		 			<td>
		 				<c:choose>
							<c:when test="${venda.situacao}">
								<i class="fas fa-check"  style="color:green"></i>
							</c:when>
							<c:otherwise>
								<i class="fas fa-times"  style="color:red"></i>
							</c:otherwise>
						</c:choose>			 			
		 			</td>
		 			<td>${venda.usuario.nome}</td>
		 			<td>${venda.cliente.nome} ${venda.cliente.sobrenome}</td>
		 			<td>${venda.veiculo.veiculo.nome}</td>
		 			<td id="nm-placa-veiculo">${venda.veiculo.placa}</td>
		 			<td><fmt:formatNumber value="${venda.total}" type="currency" minFractionDigits="2"/></td>
		 			<td>
		 				<button type="button" class="btn btn-primary" id="btn-visualizar-servico" onclick="VisualizarServico('${venda.id}');" data-toggle="modal" data-target="#lista-itens-produtos-servicos"><i class="fas fa-clipboard-list"></i></button>
		 				<button type="button" class="btn btn-secondary" id="btn-imprimir-garantia" data-toggle="modal" data-target="#modal-garantia-cliente"><i class="fas fa-print"></i></button>							
		 			</td>
		 				
		 		</tr>
		 	</c:forEach>
		 </tbody>
	</table>
