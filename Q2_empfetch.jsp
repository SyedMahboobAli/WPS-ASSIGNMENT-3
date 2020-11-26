<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action =  "empfetch.jsp" method = "post">
		Employee ID : <input type = "text" name = "empid">
		<input type = "submit" value = "Submit">
	</form>
	
	<table border = "1">
		<tr>
			<td>Employee ID</td>
			<td>Name</td>
			<td>Salary</td>
			<td>Department</td>
		</tr>
		<%
			String query = "select * from employees where id =" + request.getParameter("empid") + ";";
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query);
				while(rs.next())
				{
					out.println("<tr>"+ "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>" + rs.getString(3) + "</td>"+ "<td>" + rs.getString(4) + "</td>" + "</tr>");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>