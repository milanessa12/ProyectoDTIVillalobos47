<%-- 
    Document   : eliminarClientes
    Created on : 14/08/2025, 12:13:29 PM
    Author     : vanes
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    if(idStr != null) {
        int id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement("DELETE FROM clientes WHERE id = ?");
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
    }
    response.sendRedirect("clientes.jsp");
%>
