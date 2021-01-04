<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>



	<table id="tabela-lista-clientes" class="table table-bordered">
		 <thead class="corHeadAddUser">
		    <tr>
		      <th id="coluna-acoes" class="alinha-cor">Ações</th>					     
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
						<button type="button" class="btn btn-primary" id="visualizar" onclick="EditarVisualizar('${cliente.id}','true');" data-toggle="tooltip" data-placement="top" title="Visualizar"><i class="far fa-eye"></i></button>						
		 			</td>		 			
		 			<td>${cliente.nome}</td>
		 			<td>${cliente.sobrenome}</td>	
		 			<td>${cliente.cpf}</td>	 
		 			<td>${cliente.telefone}</td>	 				
		 		</tr>
		 	</c:forEach>
		 </tbody>
	</table>
