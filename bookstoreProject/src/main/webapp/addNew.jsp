<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookstoreProject.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adding book</title>
<style><%@include file="/WEB-INF/css/style.css"%></style>
</head>
<body>
	<nav>
   		<a href="index.jsp" class="link">to Main page</a>
		
   		<a><button id="demo" class="add" onclick="location.href='add.jsp';"><i class="fa-solid fa-plus"></i> Add new Book</button></a>
   		
    	<a href="admin.jsp" class="link">to Admin page</a>	

   			
   	</nav>
	<%
		Connect connect = new Connect();
	
		String bookname = request.getParameter("givenBookName");
		String author = request.getParameter("givenAuthor");
		String answer = "";
		
		if(bookname.length() <= 3) {
			answer = "Book is not added, book length should be more than 3 characters";
		} else if (author == "") {
			connect.insert(bookname);
			answer = "Book is added but the author is unknown";
		} else {
			connect.insert(bookname, author);
			answer = "Book is added";
			
		}
		
		
		
		
		
		
	%> 
	<p class="answer"><% out.print(answer); %> </p>
	
</body>
</html>