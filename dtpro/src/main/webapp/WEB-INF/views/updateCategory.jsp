<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file = "templates/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="menu1" class="tab-pane fade">
      <div class="container-fluid">
  <form:form action="/dtpro/admin/updateCategory" modelAttribute="cat">
    <div class="form-group">
      <label for="email">Category Name:</label>
      <form:input path="cName" type="text" class="form-control" id="email" placeholder="category name"/>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form:form>
</div>
</div>
<%@ include file = "templates/footer.jsp" %>     
