<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="com.connect.Dbconn"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sodium Mixed Result</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    padding: 20px;
}

.table-container {
    width: 90%; /* Increased width for better readability */
    margin: 20px auto; /* Centered with more margin */
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    border-radius: 8px; /* Rounded corners for the table */
}

table th, table td {
    padding: 12px 16px; /* Slightly increased padding for better spacing */
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
}

table th {
    background-color: #f2f2f2;
    color: #333;
}

table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tbody tr:hover {
    background-color: #f2f2f2;
}

.section-header {
    text-align: center;
    margin-bottom: 20px;
}

.back-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
}

.back-button:hover {
    background-color: #0056b3;
}

body {
    background: url("images/pi.jpg");
    background-size: cover;
    font-family: 'Open Sans', sans-serif;
    /* Optional: Fallback background color */
    background-color: #105469;
}
.buttons-container {
    text-align: center;
    margin-top: 20px;
}

table th {
    background-color: #007bff; /* Blue background for table headers */
    color: #fff; /* White text for table headers */
}

table td {
    background-color: #f9f9f9; /* Light gray background for table cells */
}

table tbody tr:nth-child(even) td {
    background-color: #f2f2f2; /* Even rows with a slightly darker gray */
}

table tbody tr:hover td {
    background-color: #e0e0e0; /* Hover effect for table rows */
}

.transparent-button {
    background-color: transparent;
    border: none; /* Remove default border */
    color: #007bff;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    text-decoration: none; /* Remove underline */
    display: inline-block; /* Ensure it behaves like a block element */
}

.transparent-button:hover {
    background-color: #007bff;
    color: #fff;
}
.transparent-button.accept-button {
    background-color: #28a745;
    color: #green;
}

.transparent-button.reject-button {
    background-color: #dc3545;
    color: #red;
}

.transparent-button:hover {
    background-color: #0056b3;
    color: #fff;
}
</style>
</head>
<body>
<%
HttpSession s=request.getSession();
String id=(String)s.getAttribute("id");
String rep=(String)s.getAttribute("ses");
Connection con=Dbconn.getConectionn();
String qry="select * from lipidresult where client_id='"+id+"' and reportid='"+rep+"'";
PreparedStatement ps=con.prepareStatement(qry);
ResultSet rs = ps.executeQuery();
%>

<section class="error-page">
    <div class="covers-main w3layouts">
        <div class="wrapper">
            <div class="main-cover w3">
                <div class="section-header">
                    <h1>EXTRACTED LIPID RESULT - FINAL</h1>
                </div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                   <th>CLIENT ID</th>
                                <th>REPORT ID</th>
                                <th>TOMATO TYPE</th>
                                <th>POWDER(KG)</th>
                                <th>SODIUM AMOUNT(KG)</th>
                                <th>LIPID AMOUNT(KG)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while(rs.next()) { %>
                            <tr>
                                <td><%= rs.getString(1) %></td>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getString(5) %></td>
                                <td><%= rs.getString(6) %></td>
                                 <td><%= rs.getString(7) %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="buttons-container">
                    <a href="adminhome.html" class="btn btn-primary back-button" role="button">Back to Home</a>
                    <form action="AcceptLipid" method="post" style="display: inline-block;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <input type="hidden" name="rep" value="<%= rep %>">
                        <input type="submit" value="Accept" class="transparent-button accept-button" style="display: inline-block;
    padding: 11px 20px;
    background-color: green;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;">
                    </form>
                   <!--   <form action="RejectLipid" method="post" style="display: inline-block;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <input type="submit" value="Reject" class="transparent-button reject-button">
                    </form>-->
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
