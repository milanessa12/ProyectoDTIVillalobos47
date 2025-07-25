<%-- 
    Document   : eliminarUsuario
    Created on : 11/07/2025, 11:51:17 AM
    Author     : vanes
--%>

<%@include file="conexion.jsp"%>
<%
int numeroCodigo=Integer.parseInt(request.getParameter("id_usuario"));
PreparedStatement ps;
ps=conexion.prepareCall("DELETE from t_usuarios WHERE id_usuario = '"+numeroCodigo+"'");
       ps.executeUpdate();
       response.sendRedirect("index.jsp");
%>