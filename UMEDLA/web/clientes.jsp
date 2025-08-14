<%-- 
    Document   : clientes
    Created on : 14/08/2025, 11:25:08 AM
    Author     : vanes
--%>

<%@ include file="conexion.jsp" %>
<jsp:include page ="includes/header.jsp"/>
<jsp:include page ="includes/nav.jsp"/>
<%
    Connection conexion = (Connection)application.getAttribute("conexion");
    java.sql.Statement stmt = conexion.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM clientes");
%>
<div class="container px-0 px-sm-3"> 
    <h2 class="mb-4 text-center">Clientes</h2>
    <div class="table-responsive" style="overflow-x: auto; -webkit-overflow-scrolling: touch;">
        <table class="table table-striped table-bordered table-hover mb-4" style="min-width: 800px;">
            <thead class="thead-dark">
                <tr>
                    <th style="min-width: 50px;">id</th>
                    <th style="min-width: 120px;">nombre</th>
                    <th style="min-width: 150px;">telefono</th>
                    <th style="min-width: 100px;">edad</th>
                    <th style="min-width: 150px;">correo</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td class="text-truncate"><%= rs.getString("nombre") %></td>
                    <td class="text-truncate"><%= rs.getString("telefono") %></td>
                    <td><%= rs.getString("edad") %></td>
                    <td class="text-truncate"><%= rs.getString("correo") %></td>
                    <td>
                        <div class="d-flex flex-nowrap gap-2"> 
                            <a href="editarClientes.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm px-3"> <i class="fas fa-edit"></i> Editar</a>
                            <a href="eliminarClientes.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('¿Seguro que deseas eliminar este cliente?');" class="btn btn-primary btn-sm px-3"> <i class="fas fa-trash-alt"></i> Eliminar</a>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center">
        <a href="editarClientes.jsp" class="btn btn-primary mb-3 mb-sm-0" style="min-width: 140px;">
            <i class="fas fa-plus"></i> Nuevo Cliente
        </a>
        <a href="index.jsp" class="btn btn-primary" style="min-width: 100px;">Salir</a>
    </div>
</div>
<jsp:include page ="includes/footer.jsp"/>
