<%@ page contentType="text/html" %>
<%@ page import="bookstoreProject.*"%>
<%@ page import = "java.sql.*" %>
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bookstore.com</title>
        <style><%@include file="/WEB-INF/css/style.css"%></style>
    </head>
    
    <body>
    	<nav>
    		<a href="admin.jsp" class="link">to Admin page</a>
    		<a class="greeting">Currently in Main Page</a>
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