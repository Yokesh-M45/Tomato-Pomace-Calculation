<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="com.connect.Dbconn"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View LogStatus - Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);

*, *:before, *:after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: #105469;
  font-family: 'Open Sans', sans-serif;
}
table {
  width: 90%;
  margin: 20px auto;
  border-collapse: collapse;
  border: 1px solid #ccc;
  background: #fff;
  border-radius: 8px;
  overflow: hidden;
}
th, td {
  padding: 15px;
  text-align: center;
}
th {
  background: #014055;
  color: #fff;
  font-weight: bold;
}
td {
  border-top: 1px solid #eee;
}
tbody tr:nth-child(even) {
  background: #f9f9f9;
}
tbody tr:hover {
  background: #f1f1f1;
}
h1 {
  padding-top: 80px;
  text-align: center;
  color: black;
}
body {
    background: url("images/s.jpg");
    background-size: cover;
    font-family: 'Open Sans', sans-serif;
    background-color: #105469;
}


</style>
<script>
function disableButton(buttonId) {
    var button = document.getElementById(buttonId);
    button.disabled = true; // Disable the button
    button.textContent = 'Processing...'; // Change button text to indicate processing
}
</script>
</head>
<body>
<h1>WASTE PROCESS EMPLOYEE STATUS</h1>
<table>
<%
Connection con=Dbconn.getConectionn();
String qry = "select * from wasteresigter";
PreparedStatement ps = con.prepareStatement(qry);
ResultSet rs = ps.executeQuery();
%>
  <thead>
    <tr>
      <th>Employee Name</th>
      <th>Employee Email</th>
      <th>Employee ID</th>
      <th>Phone Number</th>
      <th>Password</th>
      <th>Status</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
   <%
  while(rs.next()) {
  %>
    <tr>
      <td><%=rs.getString(1)%></td>
      <td><%=rs.getString(2)%></td>
      <td><%=rs.getString(4)%></td>
      <td><%=rs.getString(3)%></td>
       <td><%=rs.getString(6)%></td>
      <td><%=rs.getString(5)%></td>
     
      <%
      if(rs.getString(5).equalsIgnoreCase("Accepted")) {
      %>
    	  <td>
            <a href="adm_venacclog.jsp?name=<%= rs.getString(1) %>&email=<%=rs.getString(2) %>&password=<%= rs.getString(6) %>" 
               class="btn btn-dark" style="pointer-events: none; text-decoration: none; color: black;">Accept</a>
            <br><br>
            <a href="adm_venrejlog.jsp?name=<%= rs.getString(1) %>&email=<%= rs.getString(2) %>" class="btn btn-danger">Reject</a>
          </td>
      <% 
      } else {
      %>
    	  <td>
            <a id="accept_<%= rs.getString(2) %>" href="adm_venacclog.jsp?shop_name=<%= rs.getString(4) %>&email=<%= rs.getString(2) %>&password=<%= rs.getString(6) %>" 
               class="btn btn-success" onclick="disableButton('accept_<%= rs.getString(2) %>');">Accept</a>
            <br><br>
            <a href="adm_venrejlog.jsp?name=<%= rs.getString(1) %>&email=<%=rs.getString(2) %>" class="btn btn-danger">Reject</a>
          </td>
      <% 
      }
      %>  
    </tr>
    <%
  }
  %>
  </tbody>
</table>
<br><center><a href="drop.jsp" class="btn btn-primary">Go Back</a></center>
</body>
</html>
