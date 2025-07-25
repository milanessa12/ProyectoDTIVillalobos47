<%-- 
    Document   : conexion
    Created on : 25/07/2025, 10:59:59 AM
    Author     : vanes
--%>

ventas_villalobos<%@page language="java" import="java.sql.*" %>

<%
       Connection conexion=null;
       PreparedStatement st=null;
       ResultSet rs=null;
    
       Class.forName("com.mysql.jdbc.Driver");
       conexion=DriverManager.getConnection("jdbc:mysql://localhost/ventas_villalobos","root","");

%>