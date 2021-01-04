<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
      <div class="sidebar-brand">
        <a href="${s:mvcUrl('HC#home').build()}">JC SOM Film</a>
        <div id="close-sidebar">
          <i class="fas fa-times"></i>
        </div>
      </div>
      <div class="sidebar-header">
        <div class="user-pic">
          <img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg"
            alt="User picture">
        </div>
        <div class="user-info">
          <span class="user-name">
          <security:authentication property="principal" var="usuario"/> ${usuario.usuario.nome}           
            <strong>${usuario.usuario.sobrenome}  </strong>
          </span>
          <span class="user-role">Administrador</span>
          <span class="user-status">
            <i class="fa fa-circle"></i>
            <span>Online</span>
          </span>
        </div>
      </div>

      <!-- sidebar-search  -->
      <div class="sidebar-menu">
        <ul>
          <li class="header-menu">
            <span>Configurações</span>
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fas fa-store"></i>
              <span>Cadastros</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
               
                </li>
                <li>
              	
                </li>
                <li>
               		<a href="${s:mvcUrl('MQC#marca').build()}">Marcas</a>
                </li>
                <li>
               		<a href="${s:mvcUrl('VQC#veiculo').build()}">Veiculos</a>
                </li>
                <li>
                	<a href="${s:mvcUrl('PQC#produto').build()}">Produtos</a>
                </li>
                <li>
                	<a href="${s:mvcUrl('CQC#cliente').build()}">Clientes</a>
                </li>
                <li>
                	<a href="${s:mvcUrl('FQC#funcionario').build()}">Funcionarios</a>
                </li>                 
              </ul>
            </div>
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fa fa-shopping-cart"></i>
              <span>Vendas</span>
              <span class="badge badge-pill badge-danger">3</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
                	<a href="${s:mvcUrl('VQC#venda').build()}">Vendas & Orçamentos</a>
                </li>
                <li>
                  	<a href="#">Orders</a>
                </li>
                <li>
                  	<a href="#">Credit cart</a>
                </li>
              </ul>
            </div>
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fas fa-cogs"></i>
              <span>Parametrização</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
               
                </li>
                <li>
                  <a href="#">Panels</a>
                </li>
                <li>
                  <a href="#">Tables</a>
                </li>
                <li>
                  <a href="#">Icons</a>
                </li>
                <li>
                  <a href="#">Forms</a>
                </li>
              </ul>
            </div>
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fas fa-clipboard-list"></i>
              <span>Consultas</span>
            </a>
            <div class="sidebar-submenu">
              <ul>
                <li>
              		<a href="${s:mvcUrl('VQC#garantias').build()}">Vendas & Garantias</a>
                </li>               
              </ul>
            </div>
          </li>
          <li class="sidebar-dropdown">
            <a href="#">
              <i class="fa fa-globe"></i>
              <span>Acessos</span>
            </a>
             <div class="sidebar-submenu">
              <ul>
              	<li>
              		<a href="${s:mvcUrl('AQC#acesso').build()}">Conceder Acesso</a>
                </li>                
                <li>
             
                </li>
                <li>
               
                </li>
              </ul>
            </div>
          </li>
          <li class="header-menu">
            <span>Extra</span>
          </li>
          <li>
            <a href="#">
              <i class="fa fa-book"></i>
              <span>Documentation</span>
              <span class="badge badge-pill badge-primary">Beta</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fa fa-calendar"></i>
              <span>Calendar</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fa fa-folder"></i>
              <span>Examples</span>
            </a>
          </li>
        </ul>
      </div>
      <!-- sidebar-menu  -->
    </div>
    <!-- sidebar-content  -->
    <div class="sidebar-footer">
      <a href="#">
        <i class="fa fa-bell"></i>
        <span class="badge badge-pill badge-warning notification">3</span>
      </a>
      <a href="#">
        <i class="fa fa-envelope"></i>
        <span class="badge badge-pill badge-success notification">7</span>
      </a>
      <a href="#">
        <i class="fa fa-cog"></i>
        <span class="badge-sonar"></span>
      </a>
      <a href="#">
        <i class="fa fa-power-off"></i>
      </a>
    </div>
  </nav>
