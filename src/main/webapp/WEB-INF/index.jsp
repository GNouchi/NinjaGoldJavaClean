<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
 import="java.util.Collections,java.util.ArrayList"   
 %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<meta charset="ISO-8859-1">
<title>Ninja gold clean</title>
<style>
.route{ margin-top: 50px; width: 200px; height: 200px;}
.green{color:green;}
.red{color:red;}
</style>
</head>
<body>
	<h1> This is Ninja Gold with one method</h1>
<div class="container"> 
	<h2>Your Gold <input class="form-control" type="text" value ="${gold}"> </h2>
	<form action="process" method="post">
	<input type="hidden" name= "str" ><input type="hidden" name= "min" value="0"><input type="hidden" name= "max" value="0">
	<input class="form-control" type="hidden" name= "reset" value ="reset">
	<button class="btn btn-danger" type = "submit"> Reset</button>
	</form>
</div>

<div class="container">
	<div class="row">
		<div class="route col-xs-2 offset-xs-1">
		<p>+10-20 Gold</p>
			<form  action="process" method="post" >
			<input type="hidden" name= "str" value ="'>You have entered a farm and ">
			<input type="hidden" name= "min" value ="10">
			<input type="hidden" name= "max" value ="10">
			  <button type="submit" class="btn btn-primary mb-2">Farm</button>
			</form>
		</div>
		<div class="route col-xs-2 offset-xs-1">
		<p>+5-10 Gold</p>
			<form action="process" method="post" >
			<input type="hidden" name= "str" value ="'>You have entered a cave and ">
			<input type="hidden" name= "min" value ="5">
			<input type="hidden" name= "max" value ="5">
			  <button type="submit" class="btn btn-primary mb-2">Cave</button>
			</form>
		</div>
		<div class="route col-xs-2 offset-xs-1">
		<p>+2-5 Gold</p>
			<form action="process" method="post" >
			<input type="hidden" name= "str" value ="'>You have entered a house and ">
			<input type="hidden" name= "min" value ="2">
			<input type="hidden" name= "max" value ="3">
			  <button type="submit" class="btn btn-primary mb-2">House</button>
			</form>
		</div>
		<div class="route col-xs-2 offset-xs-1">
		<p>< (+/-)50 Gold /p>
			<form action="process" method="post" >
			<input type="hidden" name= "str" value ="'>You have entered a casino and ">
			<input type="hidden" name= "min" value ="-50">
			<input type="hidden" name= "max" value ="100">
			  <button type="submit" class="btn btn-primary mb-2">Casino</button>
			</form>
		</div>
	</div>
</div>

<div class="container">
	<h2> Activities: </h2>
	<p> 
		<c:forEach var="item" items="${log}">
	    ${item}<br>
		</c:forEach>
	<p>
</div>
</body>
</html>