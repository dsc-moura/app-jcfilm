<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>



	<table id="tabela-lista-funcionarios" class="table table-bordered">
		 <thead class="corHeadAddUser">
		    <tr>
		      <th id="coluna-acoes" class="alinha-cor">Ações</th>	
      		  <th class="alinha-cor">Código</th>		     
		      <th class="alinha-cor">Nome</th>
		      <th class="alinha-cor">Sobrenome</th>			       		              
		    </tr>
		 </thead>
		 <tbody>
		 	<c:forEach items="${funcionarios}" var="usuario">
		 		<tr id="cliente-${usuario.id}">
		 			<td id="acoes-tabela">					
						<button type="button" class="btn btn-primary" id="visualizar" onclick="EditarVisualizar('${usuario.id}','true');" data-toggle="tooltip" data-placement="top" title="Visualizar"><i class="far fa-eye"></i></button>						
		 			</td>	
		 			<td>${usuario.id}</td>	 			
		 			<td>${usuario.nome}</td>
		 			<td>${usuario.sobrenome}</td>			 				
		 		</tr>
		 	</c:forEach>
		 </tbody>
	</table>
