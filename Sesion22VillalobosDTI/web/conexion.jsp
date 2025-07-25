<%-- 
    Document   : conexion
    Created on : 7/07/2025, 12:33:38 PM
    Author     : vanes
--%>

bd_villalobos_dti<%@page language="java" import="java.sql.*" %>

<%
       Connection conexion=null;
       PreparedStatement st=null;
       ResultSet rs=null;
    
       Class.forName("com.mysql.jdbc.Driver");
       conexion=DriverManager.getConnection("jdbc:mysql://localhost/bd_velazquez_dti","root","");

%>