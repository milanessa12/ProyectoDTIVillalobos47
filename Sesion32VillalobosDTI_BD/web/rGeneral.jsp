<%-- 
    Document   : rGeneral
    Created on : 11/07/2025, 11:19:08 AM
    Author     : vanes
--%>

<jsp:include page="includes/header.jsp"/>
<jsp:include page="includes/nav.jsp"/>
 <%@include file="conexion.jsp"%>
 
 <br><br><br>
  <!--Formulario alta-->
  <div class="container">
      <div class="container">
          <div class="order-details">
              <div class="row"><!--Inicia fila-->
                  <form method="post" action="rUsuario.jsp">
                      <div class="row">
                          <center>
                              <h3>ALTA USUARIO</h3>
                              <img src="./img/icon/inisesionalum2.jpg"/>
                        
                          <div class="col-sm-6">
                              <label>Usuario</label>
                              <input class="input" type="text" placeholder="Usuario" required name="usuario"/>
                              <label>Contraseña</label>
                              <input class="input" type="password" placeholder="Password" required name="contrase"/>
                              <br><br><!-- 2 saltos de linea -->
                              <input type="submit" class="primary-btn order-submit" value="Registrarme"/>
                          </div>
                         </center>  
                      </div>
                      
                  </form>
              </div><!--/Termina fila-->
          </div>
      </div>
  </div>             
<br>   

<jsp:include page="includes/footer.jsp"/>