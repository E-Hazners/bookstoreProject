<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adding book</title>
<style><%@include file="/WEB-INF/css/style.css"%></style>
 </head>
    <body>
    	<nav>
    		<a href="admin.jsp" class="link">Back to Admin page</a>
    		<a class="greeting">Currently Adding book</a>
    	</nav>
    	
    	<div class="divAdd">
	    	<form action = "addNew.jsp" method = "GET">
	    		Book name
	    		<input type="text" name="givenBookName" class="givenInput" id="givenBookName" placeholder="Book name...">
	    		<br />
	    		Authors name
	    		<input type="text" name="givenAuthor" class="givenInput" id="givenAuthor" placeholder="Authors name...">
	    		<input type = "submit" value = "Submit" class="submitButton"/>
	    	</form>
    	</div>
	</body>
</html>