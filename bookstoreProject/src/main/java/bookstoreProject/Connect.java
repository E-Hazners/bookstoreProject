package bookstoreProject;



import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;  
   


public class Connect {  
     
	
	// connects to db
    public Connection connect() {  
        Connection conn = null;
        String url = "jdbc:sqlite:C:\\Users\\User\\eclipse-workspace2\\bookstoreProject\\books.db";
        
        try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        try {  
            
            // create a connection to the database  
            conn = DriverManager.getConnection(url); 
            
              
        } catch (SQLException e) {  
            System.out.println(e.getMessage());  
        } 
        return conn;
    }
    
    
    // creates table if it doesn't exist
    public void createNewTable() {
    	String url = "jdbc:sqlite:books.db";
    	String sql = "CREATE TABLE IF NOT EXISTS bookList (\n"
                + "	id integer PRIMARY KEY,\n"
                + "	name text NOT NULL UNIQUE,\n"
                + "	author text\n"
                + ");";
    	try (Connection conn = DriverManager.getConnection(url);
                Statement stmt = conn.createStatement()) {
            // create a new table
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    	
    }
    
    
    // prints out data from db
    public void selectAll(){
        String sql = "SELECT id, name, author FROM bookList ORDER BY id DESC";
        
        try {
        	Connection conn = this.connect();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            // loop through the result set
            while (rs.next()) {
                System.out.println(rs.getInt("id") +  "\t" + 
                                   rs.getString("name") + "\t" +
                                   rs.getString("author") +  "\t");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    // inserts new row in db with books name and authors name
    public void insert(String name, String author) {
    	String sql = "INSERT INTO bookList(name, author) VALUES(?, ?)";
    	try (Connection conn = this.connect();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, author);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    // inserts new row in only with books name, without authors name
    public void insert(String name) {
    	String sql = "INSERT INTO bookList(name, author) VALUES(?, ?)";
    	try (Connection conn = this.connect();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, "unknown author");
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    // updates table by adding author for a certain book
    public void insertAuthor(int id, String author) {
    	String sql = "UPDATE bookList SET author = ? " 
    			+ "WHERE id = ?";
    	try (Connection conn = this.connect();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // set the corresponding param
            pstmt.setString(1, author);
            pstmt.setInt(2, id);
            // update 
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    // deletes a certain row from db
    public void delete(int id) {
        String sql = "DELETE FROM bookList WHERE id = ?";

        try (Connection conn = this.connect();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // set the corresponding param
            pstmt.setInt(1, id);
            
            // execute the delete statement
            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}

	