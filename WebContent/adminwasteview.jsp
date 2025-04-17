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
    border-radius: 8px;
}

table th, table td {
    padding: 10px;
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
    background: url("images/pi.jpg");
    background-size: cover;
    font-family: 'Open Sans', sans-serif;
    background-color: #105469;
}

.end-form {
    text-align: right; /* Aligns buttons to the right */
    margin-top: 20px;
}

.end-form .back-button {
    float: left; /* Floats the back button to the left */
    margin-right: 20px; /* Adds a margin between the buttons */
}
.accept-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #28a745; /* Green background color */
    color: #fff;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.accept-button:hover {
    background-color: #218838;
}
.btn {
    display: inline-block;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    font-family: 'Open Sans', sans-serif;
    font-size: 16px;
}

.btn-primary {
    background-color: #007bff;
    color: #fff;
    border: none;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.btn-success {
    background-color: #28a745;
    color: #fff;
    border: none;
}

.btn-success :hover {
    background-color: #218838;
}
.btn-primary.no-shadow-button:hover {
    background-color: #0056b3 !important; /* Darker blue on hover */
}

.end-form {
    text-align: right; /* Aligns buttons to the right */
    margin-top: 20px;
}

.end-form .btn {
    float: left; /* Floats the back button to the left */
    margin-right: 20px; /* Adds a margin between the buttons */
}



</style>
</head>
<body>
<%
Connection con=Dbconn.getConectionn();
String id=request.getParameter("id");
String idr=request.getParameter("reportid");
String qry="select * from wasteprocessresult where client_id='"+id+"' and reportid='"+idr+"'";
PreparedStatement ps=con.prepareStatement(qry);
ResultSet rs = ps.executeQuery();
%>

<section class="error-page">
    <div class="covers-main w3layouts">
        <div class="wrapper">
            <div class="main-cover w3">
                <div class="section-header">
                    <h1>WASTE PROCESS - FINAL REPORT</h1>
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
                <div class="end-form">
                    <form action="AcceptReport" method="post">
                    <input type="hidden" name="id" value="<%= id %>">
                    <input type="hidden" name="rep" value="<%= idr %>">
                        <a href="adminhome.html" class="btn btn-primary back-button" role="button">Back to Home</a>
                        <button type="submit" class="btn btn-primary no-shadow-button"  style="float: right;display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;">Accept</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
