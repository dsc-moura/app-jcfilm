<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>


<div class="scrollTabelas">
	<table id="tabela-clientes-pesquisa" class="table table-bordered">
		 <thead class="corHeadAddUser">
		    <tr>
		      <th id="coluna-acoes" class="alinha-cor">A��es</th>					     
		      <th class="alinha-cor">Nome</th>
		      <th class="alinha-cor">Sobrenome</th>	
		       <th class="alinha-cor">CPF</th>	
		        <th class="alinha-cor">Telefone</th>	       			              
		    </tr>
		 </thead>
		 <tbody>
		 	<c:forEach items="${clientes}" var="cliente">
		 		<tr id="cliente-${cliente.id}">
		 			<td id="acoes-tabela">					
						<button type="button" class="btn btn-primary" id="visualizar" onclick="BuscarDadosCliente('${cliente.cpf}');" data-toggle="tooltip" data-placement="top" title="Visualizar"><i class="far fa-folder-open"></i></button>						
		 			</td>		 			
		 			<td>${cliente.nome}</td>
		 			<td>${cliente.sobrenome}</td>	
		 			<td>${cliente.cpf}</td>	 
		 			<td>${cliente.telefone}</td>	 				
		 		</tr>
		 	</c:forEach>
		 </tbody>
	</table>
</div>