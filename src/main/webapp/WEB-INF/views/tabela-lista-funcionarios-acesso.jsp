<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>



	<table id="tabela-lista-funcionarios-acesso" class="table table-bordered">
		 <thead class="corHeadAddUser">
		    <tr>
		      <th id="coluna-acoes" class="alinha-cor">Ações</th>	
      		  <th class="alinha-cor">Código</th>		     
		      <th class="alinha-cor">Nome</th>
		      <th class="alinha-cor">Sobrenome</th>		
		       <th class="alinha-cor">E-mail</th>	
		      <th class="alinha-cor">Acesso</th>		       		              
		    </tr>
		 </thead>
		 <tbody>
		 	<c:forEach items="${acessos}" var="acesso">
		 		<tr id="funcionario-${acesso.usuario.id}">
		 			<td id="acoes-tabela">					
						<button type="button" class="btn btn-primary" id="visualizar" onclick="EditarVisualizar('${acesso.id}','true');" data-toggle="tooltip" data-placement="top" title="Visualizar"><i class="far fa-folder-open"></i></button>						
		 			</td>	
		 			<td>${acesso.usuario.id}</td>	 			
		 			<td>${acesso.usuario.nome}</td>
		 			<td>${acesso.usuario.sobrenome}</td>	
		 			<td>${acesso.usuario.email}</td>
		 			<td>
		 				<c:choose>
							<c:when test="${acesso.permissao}">
								<i class="fas fa-check"  style="color:green"></i>
							</c:when>
							<c:otherwise>
								<i class="fas fa-times"  style="color:red"></i>
							</c:otherwise>
						</c:choose>			 			
		 			</td>			 				
		 		</tr>
		 	</c:forEach>
		 </tbody>
	</table>
