<%-- 
    Document   : editarClientes
    Created on : 14/08/2025, 11:46:20 AM
    Author     : vanes
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    String nombre = "", telefono = "", edad = "", correo = "";
    int id = 0;

    if(idStr != null) {
        id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement("SELECT * FROM clientes WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            nombre = rs.getString("nombre");
            telefono = rs.getString("telefono");
            edad = rs.getString("edad");
            correo = rs.getString("correo");
        }
        rs.close();
        ps.close();
    }
%>
<br>
<div class="container">
    <h2 class="text-center"><%= (id == 0) ? "Nuevo Cliente" : "Editar Cliente" %></h2>
    
    <form action="guardarClientes.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>" />
        
        <div class="mb-3">
            <label>Nombre:</label>
            <input type="text" name="nombre" class="form-control" value="<%= nombre %>" required />
        </div>
        
        <div class="mb-3">
            <label>Teléfono:</label>
            <input type="text" name="telefono" class="form-control" value="<%= telefono %>" required />
        </div>
        
        <div class="mb-3">
            <label>Edad:</label>
            <input type="text" name="edad" class="form-control" value="<%= edad %>" required />
        </div>
        
        <div class="mb-3">
            <label>Correo:</label>
            <input type="email" name="correo" class="form-control" value="<%= correo %>" required />
        </div>
        
        <div class="container mt-3 text-center">
            <button type="submit" class="btn btn-primary">Guardar</button> 
        </div>
    </form>
    
    <div class="container mt-3 text-center"> 
        <a href="clientes.jsp" class="btn btn-primary">Regresar</a> 
    </div>
</div>
<jsp:include page ="includes/footer.jsp"/>
