<%-- 
    Document   : index
    Created on : 25/07/2025, 10:55:41 AM
    Author     : vanes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    // Configuración de la conexión a la base de datos
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/ventas_villalobos?useSSL=false&serverTimezone=UTC";
    String usuario = "root";
    String password = "";

    Connection conexion = null;
    PreparedStatement pstmt = null;

    // Procesar el formulario cuando se envía
    if ("POST".equals(request.getMethod())) {
        try {
            // Obtener datos del formulario
            int idProducto = Integer.parseInt(request.getParameter("id_producto"));
            String nombre = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            double total = precio * cantidad;

            // Cargar el driver y establecer conexión
            Class.forName(driver);
            conexion = DriverManager.getConnection(url, usuario, password);

            // Preparar la consulta SQL para INSERT
            String sql = "INSERT INTO producto (id_producto, nombre, precio, cantidad, total) VALUES (?, ?, ?, ?, ?)";
            
            pstmt = conexion.prepareStatement(sql);
            pstmt.setInt(1, idProducto);
            pstmt.setString(2, nombre);
            pstmt.setDouble(3, precio);
            pstmt.setInt(4, cantidad);
            pstmt.setDouble(5, total);

            // Ejecutar la inserción
            int filasAfectadas = pstmt.executeUpdate();
            
            if (filasAfectadas > 0) {
                out.println("<div class='alert alert-success mt-3'>Producto registrado correctamente</div>");
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            out.println("<div class='alert alert-danger mt-3'>Error: El ID de producto ya existe</div>");
        } catch (ClassNotFoundException e) {
            out.println("<div class='alert alert-danger mt-3'>Error: Driver JDBC no encontrado</div>");
        } catch (SQLException e) {
            out.println("<div class='alert alert-danger mt-3'>Error de base de datos: " + e.getMessage() + "</div>");
        } catch (NumberFormatException e) {
            out.println("<div class='alert alert-danger mt-3'>Error: Datos numéricos inválidos</div>");
        } finally {
            // Cerrar recursos
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conexion != null) try { conexion.close(); } catch (SQLException e) {}
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Registro de Productos - Villalobos S.A.</title>
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
        .form-title {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="form-title">Registro de Productos</h2>
        
        <form method="post" class="row g-3">
            <div class="col-md-6">
                <label class="form-label">ID Producto:</label>
                <input type="number" name="id_producto" class="form-control" required>
            </div>
            
            <div class="col-md-6">
                <label class="form-label">Nombre:</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>
            
            <div class="col-md-6">
                <label class="form-label">Precio Unitario:</label>
                <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="number" step="0.01" name="precio" class="form-control" required>
                </div>
            </div>
            
            <div class="col-md-6">
                <label class="form-label">Cantidad:</label>
                <input type="number" name="cantidad" class="form-control" required>
            </div>
            
            <div class="col-12 mt-4">
                <button type="submit" class="btn btn-primary">Guardar Producto</button>
                <a href="listar.jsp" class="btn btn-secondary ms-2">Ver Productos</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

