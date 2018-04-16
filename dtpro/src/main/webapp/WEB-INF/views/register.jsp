<%@ include file = "templates/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
error{
color:red;
font-style:italic;
}
</style>
		<div class="container-fluid">
		<form:form action="${pageContext.request.contextPath}/saveUser" modelAttribute="user" method="post">
		
    <div class="form-group">
      <label for="name">User Name:</label>
      <form:input path="uName" type="text" class="form-control" id="name" placeholder="User Name"/>
      <form:errors path="uName" cssClass="error"></form:errors>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <form:input path="email" type="text" class="form-control" id="email" placeholder="Email"/>
      <form:errors path="email" cssClass="error"></form:errors>
    </div>
    <div class="form-group">
      <label for="phone">Phone Number</label>
      <form:input path="phone" type="text" class="form-control" id="phone" placeholder="phoneNum"/>
      <form:errors path="phone" cssClass="error"></form:errors>
    </div>
    <div class="form-group">
      <label for="pass">Password:</label>
      <form:input path="password" type="password" class="form-control" id="pass" placeholder="Password"/>
      <form:errors path="password" cssClass="error"></form:errors>
    </div>
        <div class="form-group">
      <label for="role">Role:</label>
      <form:input path="role" type="text" class="form-control" id="role" placeholder="Role"/>
      <form:errors path="role" cssClass="error"></form:errors>
    </div>
    

	<div class="form-group">
      <label for="file">Product Picture:</label>
      <input type="file" class="form-control" id="file" placeholder="image name" name="pfile"/>
    </div>

    <button type="submit" class="btn btn-default">Submit</button>
  </form:form>
		
		</div>

<%@ include file = "templates/footer.jsp" %>