<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<style>
	
</style>

<body>
<center>

	<h2>Add Todo</h2>
	
	<table class="table1">
		<form action="/save" method="post">
		<tr>
		<td align="right">No :- </td>
		<td><input type="number" name="id" value=0></td>
		</tr>
		
		<tr>
		<td align="right">Desciption :- </td>
		<td><input type="text" name="description" ></td>
		</tr>
		
		<tr>
		<td colspan="2" align="center"><input type="submit" name="b1" value="Add"></td>
		</tr>
		</form>
	</table>
	
	<font>
		${msg}
	</font>
	
	
	<br><br><br>
	<hr color="red">

		<h2>Todo List</h2>
		
		<table border="1">
		<tr>
		<td align="center">No</td>
		<td align="center">Desciption</td>
		<td align="center"> Delete</td>
		</tr>
		
		<c:forEach  var="t"  items="${list}">
				<tr>
					<td style="width: 50px;" align="center">${t.id}</td>
					<td  style="width: 200px;" align="center" >${t.description}</td>
					
					<td style="width: 100px; height: 50px" align="center">  
					<form action="/save" method="post">
						<input type="hidden" name="id" value="${t.id}">
						
						<input type="submit" name="b1" value="delete">
					</form>
					</td>
					
					
					
				</tr>
		</c:forEach>
		
		</table>
</center>	
</body>
</html>