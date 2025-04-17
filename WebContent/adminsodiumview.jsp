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
.button-container {
    display: flex;
    justify-content: center; /* Center-align buttons */
    gap: 10px; /* Space between buttons */
}

</style>
</head>
<body>
<%
HttpSession s = request.getSession();
String id = (String) s.getAttribute("id");
String rep=request.getParameter("repid");
s.setAttribute("ses",rep);
Connection con=Dbconn.getConectionn();
String qry = "SELECT * FROM sodiumresult WHERE client_id='" + id + "' AND reportid='" + rep + "'";
PreparedStatement ps=con.prepareStatement(qry);
ResultSet rs = ps.executeQuery();
%>

<section class="error-page">
    <div class="covers-main w3layouts">
        <div class="wrapper">
            <div class="main-cover w3">
                <div class="section-header">
                    <h1>SODIUM MIXED RESULT</h1>
                </div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                             <th>CLIENT ID</th>
                                <th>REPORT ID</th>
                                <th>TOMATO TYPE</th>
                                <th>POWDER(KG)</th>
                                <th>HEATING TEMPERATURE(�C)</th>
                                <th>SODIUM MIXED QUANTITY(KG)</th>
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

                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
               <div class="button-container">
    <a href="adminhome.html" class="btn btn-primary back-button" role="button">Back to Home</a>
    <a href="adminlipid.jsp?id=<%= id %>" class="btn btn-primary back-button" role="button">Lipid Report</a>
</div>

            </div>
        </div>
    </div>
</section>
</body>
</html>
