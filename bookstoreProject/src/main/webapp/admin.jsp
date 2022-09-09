<%@ page contentType="text/html" %>
<%@ page import="bookstoreProject.*"%>
<%@ page import = "java.sql.*" %>
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bookstore.com</title>
        <style><%@include file="/WEB-INF/css/style.css"%></style>
        <script src="https://kit.fontawesome.com/a704dec81f.js" crossorigin="anonymous"></script>
    </head>
    <body>
    	<nav>
    		<a href="index.jsp" class="link">to Main page</a>
    		<a class="greeting">Currently in Admin Page</a>
    		<a><button id="demo" class="add" onclick="location.href='add.jsp';"><i class="fa-solid fa-plus"></i> Add new Book</button></a>
    	</nav>
  
        <table align="center">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Book</th>
                    <th>Author</th>
                </tr>
            </thead>
            <tbody>
            <%
            	Connect connect = new Connect();
            	String sql = "SELECT id, name, author FROM bookList ORDER BY id DESC";
                
                try {
                	Connection conn = connect.connect();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    int count = 0;
                    // loop through the result set
                    while (rs.next()) {
                    	%>
                    	<tr>
	                        <td><%= rs.getInt("id") %></td>
	                        <td align=center><%= rs.getString("name") %></td>
	                        <td><%= rs.getString("author") %></td>
                        
                        </tr>
                   		<%
                    }
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
            
            %>
            </tbody>
        </table>
        
       
    </body>
</html>