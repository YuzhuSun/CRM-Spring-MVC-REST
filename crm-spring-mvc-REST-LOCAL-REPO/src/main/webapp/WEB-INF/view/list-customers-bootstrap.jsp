<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
	<!-- reference our style sheet -->

	
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	

</head>

<body>
<div class="container">
	<h3>CRM - Customer Relationship Manager</h3>
	
	<div>
		User:
		<span>
		 	<security:authentication property="principal.username" />
		</span>
		<br>
		Roles:
		<span>
		 	<security:authentication property="principal.authorities" />
		</span>
		<br><br>
	</div>
	<form:form class="col">
		<div>
			<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
				<a href="${pageContext.request.contextPath}/customer/showFormForAdd"
					class="btn btn-primary btn-sm mr-5 mb-"
					id="addButton">Add Customer</a>
			</security:authorize>
		</div>
	</form:form>

	<div class ="container">
	<table class="table table-sm table-bordered table-striped align-middle">
		<thead class="table-dark">
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<security:authorize access="hasAnyRole('MANAGER','ADMIN')">
					<th>Action</th>
				</security:authorize>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tempCustomer" items="${customers}">
				<!-- construct an "update" link with customer id -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>					

				<!-- construct an "delete" link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
				<tr>
					<td>${tempCustomer.firstName}</td>
					<td>${tempCustomer.lastName}</td>
					<td>${tempCustomer.email}</td>
					<td>
						<div class="rol">
							<security:authorize access="hasAnyRole('MANAGER','ADMIN')">
								<a href="${updateLink}" class="btn btn-info btn-sm">Update</a>
							</security:authorize>	
							<security:authorize access="hasRole('ADMIN')">
								<a href="${updateLink}" 
									class="btn btn-danger btn-sm"
									onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
							</security:authorize>	
						</div>
					</td>
				</tr>>
			
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<p></p>
		
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Logout" class="btn btn-outline-primary mt-2" />
	
	</form:form>

</div>
</body>

</html>









