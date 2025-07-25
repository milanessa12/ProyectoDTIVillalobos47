<%-- 
    Document   : eliminar
    Created on : 11/07/2025, 11:42:44 AM
    Author     : vanes
--%>

<jsp:include page="includes/header.jsp"/>
<jsp:include page="includes/nav.jsp"/>
<%@include file="conexion.jsp"%>

<%
            int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        %>    
<!----------------------------- FORMULARIO IS ALUMNO -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <form method="post" action="eliminarUsuario.jsp">
            <!-- row -->
            <div class="row">
                <!-- Order Details -->
                <div class="col-md-4">

                </div>
                <div class="col-md-4 order-details">
                    <div class="section-title text-center">
                        <a class="logo">
                            <img src="./img/icon/inisesionalum2.jpg" alt="">
                        </a>
                        <br>
                        <h3 class="title">Eliminar Alumno</h3>
                    </div>
                    <div class="form-group">
                        <label>Confirma Id usuario a Borrar</label>
                        <input class="input" type="text" value="<%= id_usuario%>" required name="id_usuario">
                    </div>
                    <center><input type="submit" class="primary-btn order-submit" name="btnEliminar" value="Eliminar"></center>
                </div>
                <!-- /Order Details -->
            </div>
            <!-- /row -->
        </form>
    </div>
    <!-- /container -->
    <div>
        <p><center>¿Quieres cancelar? Presiona <a href="index.jsp">Aquí</a></center></p>
    </div>
</div>
<!-- /SECTION -->

<!----------------------------- / FORMULARIO IS ALUMNO -->
<br><!-- comment -->
<center>  <h4>Fecha y hora del sistema : <%= new java.util.Date() %></h4></center> 


<jsp:include page="includes/footer.jsp"/>