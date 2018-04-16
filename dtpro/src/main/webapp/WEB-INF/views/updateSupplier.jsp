<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ include file = "templates/header.jsp" %>
    
<div id="menu2" class="tab-pane fade">
      <div class="container-fluid">
  <!-- <h2>Vertical (basic) form</h2> -->
  <form:form action="/dtpro/admin/updateSupplier" modelAttribute="sup">
    <div class="form-group">
      <label for="email">Supplier Name:</label>
      <form:input path="sName" type="text" class="form-control" id="email" placeholder="supplier name"/>
    </div>
    
    <button type="submit" class="btn btn-default">Submit</button>
  </form:form>
</div>
</div>
<%@ include file = "templates/footer.jsp" %>     
