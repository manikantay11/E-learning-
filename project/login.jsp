
<%@ page import="java.sql.*" %>
<%
		String uname = request.getParameter("username");
        String pwd = request.getParameter("password");
		try
        {     
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
			String qry="select * from members where username=? and password=?";
            PreparedStatement pst=con.prepareStatement(qry);
            pst.setString(1,uname);
            pst.setString(2,pwd);
            ResultSet rs=pst.executeQuery();
            if(rs.next())
            {
                %> 
				<jsp:forward page="homepage.html">
					<jsp:param name="username" value="<%= uname %>"/>
					
				</jsp:forward>
				<%
            }
            else
            {
                out.print("<center><h1><font color=\"red\">!!! login failed !!! </font></h1></center>");
				%>
					<jsp:include page="index.html" />
					<%
            }
            con.close();
        }
        catch (Exception e){out.print(e);}
%>