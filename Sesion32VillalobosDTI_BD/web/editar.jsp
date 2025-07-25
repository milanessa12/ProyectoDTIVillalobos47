<%-- 
    Document   : editar
    Created on : 11/07/2025, 12:00:06 PM
    Author     : vanes
--%>

<jsp:include page="includes/header.jsp"/>
<jsp:include page="includes/nav.jsp"/>
 <%@include file="conexion.jsp"%>
 
 <%
            int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
        %>
        
        <!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <form method="post" action="editar.jsp">
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
                        <h3 class="title">Editar Alumno</h3>
                    </div>
                     <div class="form-group">
                            <label for="usuario">Usuario modificar</label>
                            <input type="text" class="form-control" id="usuario" value="<%= usuario%>" name="usuario" placeholder="usuario editar" required="required">
                        </div>
                        <div class="form-group">
                            <label for="password">Password Editar</label>
                            <input type="text" class="form-control" id="password" value="<%= password%>"  name="password" placeholder="password editar" required="required">
                        </div>
                    <center><input type="submit" class="primary-btn order-submit" name="enviar" value="Editar"></center>
                 <input type="hidden" name="id_usuario" value="<%= id_usuario%>" >
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
        
        
        
    
        <%
            if (request.getParameter("enviar") != null) {
                try {
                   PreparedStatement ps;
   ps =conexion.prepareStatement("update t_usuarios set usuario='" + usuario + "', password='" + password + "' where id_usuario='"+id_usuario+"';");
                         ps.executeUpdate();
                        response.sendRedirect("index.jsp");        
            //request.getRequestDispatcher("index.jsp").forward(request, response);
               
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
        
 
 <jsp:include page="includes/footer.jsp"/>