<%-- 
    Document   : index
    Created on : 7/07/2025, 12:47:53 PM
    Author     : vanes
--%>

<jsp:include page="includes/header.jsp"/>
<jsp:include page="includes/nav.jsp"/>

<br>
        <div class="container">
            <center>
             
                <div class="thumbnail">
                   
                </div>
                <h4>LISTA OFICIAL DE VILLALOBOS</h4>
                <br>
            </center>  
                <%@include file="conexion.jsp"%>
               
                <div class="row col-md-12" >
                <table class="table table-striped table-bordered table-hover" style="text-align: center">
                    <thead>
                        <tr>
                            <th style="text-align: center">ID</th>
                            <th style="text-align: center">Usuario</th>
                            <th style="text-align: center">Password</th>
                           
                            <th style="text-align: center">Operaciones</th>
                            <th style="text-align: center">Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                        <%
                          st=conexion.prepareStatement("select * from t_usuarios");
                          rs=st.executeQuery();
                          while(rs.next()){//inicia while
                        %>  
                        <tr>
                            <td><%=rs.getString("id_usuario")%></td>
                            <td><%=rs.getString("usuario")%></td>
                            <td><%=rs.getString("password")%></td>
                            
                            <td><a class="btn btn-danger" href="eliminar.jsp?id_usuario=<%=rs.getString("id_usuario")%>">Eliminar</a></td>
                            <td><a class="btn btn-info" href="editar.jsp?id_usuario=<%= rs.getString(1)%>&usuario=<%= rs.getString(2)%>&password=<%= rs.getString(3)%>">Editar</a></td>
                        </tr>
                        <%
                          }//termina while  
                        %>
                    </tbody>
                </table>
            </div>
        </div>            
                    
    <center>  <h4>Fecha y hora del sistema : <%= new java.util.Date() %></h4></center>    


<jsp:include page="includes/footer.jsp"/>