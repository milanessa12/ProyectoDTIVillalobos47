<%-- 
    Document   : listar
    Created on : 25/07/2025, 10:48:48 AM
    Author     : vanes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Listado de Productos - Villalobos S.A.</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 25px;
        }
        .table-title {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="table-title">Productos Registrados</h2>
        
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conexion = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    
                    try {
                        // Establecer conexión
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conexion = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/ventas_villalobos?useSSL=false&serverTimezone=UTC",
                            "root",
                            ""
                        );
                        
                        // Consulta SQL para obtener todos los productos
                        stmt = conexion.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM producto ORDER BY id_producto");
                        
                        // Mostrar resultados
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id_producto") %></td>
                    <td><%= rs.getString("nombre") %></td>
                    <td>$<%= String.format("%.2f", rs.getDouble("precio")) %></td>
                    <td><%= rs.getInt("cantidad") %></td>
                    <td>$<%= String.format("%.2f", rs.getDouble("total")) %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='5' class='text-danger'>Error al cargar los productos: " + e.getMessage() + "</td></tr>");
                    } finally {
                        // Cerrar recursos
                        if (rs != null) try { rs.close(); } catch (SQLException e) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                        if (conexion != null) try { conexion.close(); } catch (SQLException e) {}
                    }
                %>
            </tbody>
        </table>
        
        <a href="index.jsp" class="btn btn-primary">Regresar al Formulario</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
