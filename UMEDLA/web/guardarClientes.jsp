<%-- 
    Document   : guardarClientes
    Created on : 14/08/2025, 12:02:40 PM
    Author     : vanes
--%>

<%@ include file="conexion.jsp" %>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    String idStr = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String telefono = request.getParameter("telefono");
    String edad = request.getParameter("edad");
    String correo = request.getParameter("correo");

    if(idStr == null || idStr.equals("0") || idStr.isEmpty()) {

        PreparedStatement ps = conexion.prepareStatement("INSERT INTO clientes(nombre, telefono, edad, correo) VALUES (?, ?, ?, ?)");
        ps.setString(1, nombre);
        ps.setString(2, telefono);
        ps.setString(3, edad);
        ps.setString(4, correo);
        ps.executeUpdate();
        ps.close();
    } else {
       
        int id = Integer.parseInt(idStr);
        PreparedStatement ps = conexion.prepareStatement("UPDATE clientes SET nombre = ?, telefono = ?, edad = ?, correo = ? WHERE id = ?");
        ps.setString(1, nombre);
        ps.setString(2, telefono);
        ps.setString(3, edad);
        ps.setString(4, correo);
        ps.setInt(5, id);
        ps.executeUpdate();
        ps.close();
    }

    response.sendRedirect("clientes.jsp");
%>
