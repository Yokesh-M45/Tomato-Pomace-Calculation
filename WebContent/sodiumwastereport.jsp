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
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Waste Process - Final Report</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    padding: 20px;
}

.table-container {
    width: 100%;
    margin: 20px auto;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    border-radius: 12px;
    border-radius: 10px;
    overflow: hidden;
}

table th, table td {
    padding: 10px; /* Adjusted padding */
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
}

table th {
    background-color: #007bff;
    color: #fff;
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
    background: url("images/ore.jpg");
    background-size: cover;
    font-family: 'Open Sans', sans-serif;
    background-color: #105469;
}

table th {
    background-color: #007bff;
    color: #fff;
}

table td {
    padding: 10px; /* Adjusted padding */
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
    background-color: #f9f9f9;
}

table tbody tr:nth-child(even) td {
    background-color: #f2f2f2;
}

table tbody tr:hover td {
    background-color: #e0e0e0;
}

.accept-button, .reject-button {
    margin: 0 4px; /* Adjusted margin */
}

.accept-button, .reject-button {
    display: inline-block; /* Ensure buttons appear on the same line */
    background-color: green;
    color: white;
    padding: 8px 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.accept-button:hover {
    background-color: darkgreen;
}

.reject-button {
    background-color: red;
}

.reject-button:hover {
    background-color: darkred;
}
</style>
</head>
<body>
<%
String id=request.getParameter("id");
String sid=request.getParameter("reportid");
Connection con=Dbconn.getConectionn();
String qry = "SELECT  * FROM wasteprocessresult WHERE client_id=? and reportid=?";
PreparedStatement ps=con.prepareStatement(qry);

// Set the parameter value
ps.setString(1, id);
ps.setString(2, sid);

ResultSet rs = ps.executeQuery();
%>

<section class="error-page">
    <div class="covers-main w3layouts">
        <div class="wrapper">
            <div class="main-cover w3">
                <div class="section-header">
                    <h1>WASTE PROCESS - ACCEPTED REPORT</h1>
                </div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                             	<th>CLIENT ID</th>
                                <th>REPORT ID</th>
                                <th>TOMATO TYPE</th>
                                <th>TOTAL POMACE(KG)</th>
                                <th>INITIAL MOISTURE(%)</th>
                                <th>REMAINING MOISTURE(%)</th>
                                <th>POWDER(KG)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while(rs.next()) { %>
                            <tr>
                                <td><%= rs.getString(1) %></td>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getString(4) %></td>
                                <td><%= rs.getString(5) %></td>
                                <td><%= rs.getString(6) %></td>
                                <td><%= rs.getString(7) %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <div style="text-align: center; margin-top: 20px;">
                    <a href="sodiumh.html" class="btn btn-primary back-button" role="button">Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
