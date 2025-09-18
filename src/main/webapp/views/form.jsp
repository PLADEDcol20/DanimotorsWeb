<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.danimotors.model.Repuesto" %>
<%
    // El servlet puede enviar un atributo "repuesto" para editar
    Repuesto repuesto = (Repuesto) request.getAttribute("repuesto");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Agregar / Editar Repuesto - Danimotors</title>
</head>
<body>
  <h2><%= (repuesto == null) ? "Agregar Repuesto" : "Editar Repuesto" %></h2>

  <!-- Formulario envía por POST al servlet /repuestos -->
  <form action="<%= request.getContextPath() %>/repuestos" method="post">
    <!-- Si existe id (editar), se envía en hidden -->
    <input type="hidden" name="id" value="<%= (repuesto != null) ? repuesto.getId() : "" %>">

    <label>Nombre:<br>
      <input type="text" name="nombre" required value="<%= (repuesto != null) ? repuesto.getNombre() : "" %>">
    </label><br><br>

    <label>Precio:<br>
      <input type="number" step="0.01" name="precio" required value="<%= (repuesto != null) ? repuesto.getPrecio() : "" %>">
    </label><br><br>

    <label>Cantidad:<br>
      <input type="number" name="cantidad" required value="<%= (repuesto != null) ? repuesto.getCantidad() : "" %>">
    </label><br><br>

    <button type="submit">Guardar</button>
    <a href="<%= request.getContextPath() %>/repuestos">Cancelar</a>
  </form>
</body>
</html>
