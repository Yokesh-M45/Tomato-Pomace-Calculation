<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="com.connect.Dbconn"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Random" %>
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
    if (button) {
        button.disabled = true; // Disable the button
        button.textContent = 'Processing...'; // Change button text to indicate processing
    }
}
</script>
</head>
<body>
<h1>LACQUER FORMATION EMPLOYEE STATUS</h1>
<table>
<%
Connection con = Dbconn.getConectionn();
String qry = "select * from lacquerregister";
PreparedStatement ps = con.prepareStatement(qry);
ResultSet rs = ps.executeQuery();
%>
  <thead>
    <tr>
      <th style="text-align: center;">Employee Name</th>
      <th style="text-align: center;">Employee Email</th>
      <th style="text-align: center;">Employee ID</th>
      <th style="text-align: center;">Phone Number</th>
      <th style="text-align: center;">Password</th>
      <th style="text-align: center;">Status</th>
      <th style="text-align: center;">Action</th>
    </tr>
  </thead>
  <tbody>
   <%
  while(rs.next()) {
      String empName = rs.getString(1);
      String empMail = rs.getString(2);
      String password = rs.getString(6);
      String status = rs.getString(5);
  %>
    <tr style="text-align: center;">
      <td><%= empName %></td>
      <td><%= empMail %></td>
      <td><%= rs.getString(4) %></td>
      <td><%= rs.getString(3) %></td>
      <td><%= password %></td>
      <td><%= status %></td>

      <% if (status.equalsIgnoreCase("Accepted")) { %>
        <td>
          <form action="lacqure_view.jsp" method="get" style="display:inline;" onsubmit="disableButton('accept_<%= empName %>');">
            <input type="hidden" name="empname" value="<%= empName %>">
            <input type="hidden" name="empmail" value="<%= empMail %>">
            <input type="hidden" name="password" value="<%= password %>">
            <button type="submit" id="accept_<%= empName %>" class="btn btn-dark" style="pointer-events: none; text-decoration: none; color: black;">Accept</button>
          </form>
          <br><br>
          <a href="lacqure_reject.jsp?empname=<%= empName %>&empmail=<%= empMail %>" class="btn btn-danger">Reject</a>     
        </td>
      <% } else { %>
        <td>
          <form action="lacqure_view.jsp" method="get" style="display:inline;" onsubmit="disableButton('accept_<%= empName %>');">
            <input type="hidden" name="empname" value="<%= empName %>">
            <input type="hidden" name="empmail" value="<%= empMail %>">
            <input type="hidden" name="password" value="<%= password %>">
            <button type="submit" id="accept_<%= empName %>" class="btn btn-success">Accept</button>
          </form>
          <br><br>
          <a href="lacqure_reject.jsp?empname=<%= empName %>&empmail=<%= empMail %>" class="btn btn-danger">Reject</a>     
        </td>
      <% } %>  
    </tr>
   <% } %>
  </tbody>
</table>
<br>
<center><a href="drop.jsp" class="btn btn-primary">Go Back</a></center>
</body>
</html>
