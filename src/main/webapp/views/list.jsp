<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.danimotors.model.Repuesto" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Lista de Repuestos - Danimotors</title>
</head>
<body>
  <h2>Repuestos Registrados</h2>

  <!-- Enlace para abrir formulario de nuevo repuesto -->
  <p><a href="<%= request.getContextPath() %>/repuestos?action=form">Agregar nuevo repuesto</a></p>

  <%
    List<Repuesto> lista = (List<Repuesto>) request.getAttribute("listaRepuestos");
    if (lista == null || lista.isEmpty()) {
  %>
    <p>No hay repuestos registrados.</p>
  <%
    } else {
  %>
    <table border="1" cellpadding="6">
      <tr>
        <th>ID</th><th>Nombre</th><th>Precio</th><th>Cantidad</th><th>Acciones</th>
      </tr>
      <%
        for (Repuesto r : lista) {
      %>
      <tr>
        <td><%= r.getId() %></td>
        <td><%= r.getNombre() %></td>
        <td><%= r.getPrecio() %></td>
        <td><%= r.getCantidad() %></td>
        <td>
          <a href="<%= request.getContextPath() %>/repuestos?action=edit&id=<%= r.getId() %>">Editar</a> |
          <a href="<%= request.getContextPath() %>/repuestos?action=delete&id=<%= r.getId() %>" onclick="return confirm('¿Eliminar repuesto?');">Borrar</a>
        </td>
      </tr>
      <%
        }
      %>
    </table>
  <%
    }
  %>

  <br>
  <a href="<%= request.getContextPath() %>/index.html">Volver al inicio</a>
</body>
</html>
