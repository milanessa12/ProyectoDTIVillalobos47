<%-- 
    Document   : conexion
    Created on : 14/08/2025, 11:07:44 AM
    Author     : vanes
--%>

<%@ page import="java.sql.*" %>
<%
    if (application.getAttribute("conexion") == null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/umedla", "root", ""); 
            application.setAttribute("conexion", conexion);
        } catch (Exception e) {
            out.println("Error de conexión: " + e.getMessage());
        }
    }
%>
