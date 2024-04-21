<body>
<style>
body {
	
	
	background:url('mani.jpg') no-repeat;
	background-size:cover;
	background-position:center;

}
</style>
<center>
<%@ page import="java.sql.*" %>

<%
  String userid = request.getParameter("userid");    
  String name = request.getParameter("name");
  String uname = request.getParameter("username");
  String pwd = request.getParameter("password");
  String gender = request.getParameter("gender");
  String addr = request.getParameter("addr");
  long phno = Long.parseLong(request.getParameter("phone"));   
  Connection con = null;
  PreparedStatement pstmt = null;
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
    String query = "insert into members values(?, ?, ?, ?, ?, ?, ?)";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, userid);
    pstmt.setString(2, name);
    pstmt.setString(3, uname);
    pstmt.setString(4, pwd);
    pstmt.setString(5, gender);
    pstmt.setString(6, addr);
    pstmt.setLong(7, phno);
    pstmt.executeUpdate();
    out.println("<h1><font color=\"red\">E-Learn  Registration Successful</font></h1>");
    out.println("<h1><a href=\"index.html\">Click here to login </a></h1>");
  } catch (Exception e) {
    e.printStackTrace(); 
    out.println("<h1>Registration Failed!</h1>"); 
  } finally {
    if (pstmt != null) {
      pstmt.close();
    }
    if (con != null) {
      con.close();
    }
  }
%>
</center>

</body>