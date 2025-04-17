<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connect.Dbconn" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Sodium 1</title>
    <style>
        body {
         background: url("images/ore.jpg");
         background-size: cover;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }

        .table-container {
            width: 90%;
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
            padding: 12px 16px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

       table th.client-id-header {
    background-color: #007bff; /* Blue background for CLIENT ID header */
    color: #fff; /* White text for CLIENT ID header */
}

table th.action-header {
    background-color: #007bff; /* Blue background for ACTION header */
    color: #fff; /* White text for ACTION header */
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
         .view-report-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff; 
    text-decoration: none;
    border-radius: 5px;
}

.view-report-button:hover {
    background-color: #0056b3;
}

        
        
    </style>
</head>
<body>
<%

Connection con=Dbconn.getConectionn();
String qry="select distinct client_id from wasteprocess";
PreparedStatement ps=con.prepareStatement(qry);
ResultSet rs = ps.executeQuery();
%>

<section class="error-page">
    <div class="covers-main w3layouts">
        <div class="wrapper">
            <div class="main-cover w3">
                <div class="section-header">
                    <h1>WASTE PROCESS - APPROVED REPORTS</h1>
                </div>
                <div class="table-container">
                    <table style="width: 100%; border-collapse: collapse; background-color: #fff; box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); border-radius: 8px;">
    <thead>
        <tr>
            <th style="background-color: #007bff; color: #fff; padding: 12px 16px; text-align: center; border-bottom: 1px solid #ddd; font-size: 14px;">CLIENT ID</th>
            <th style="background-color: #007bff; color: #fff; padding: 12px 16px; text-align: center; border-bottom: 1px solid #ddd; font-size: 14px;">ACTION</th>
        </tr>
    </thead>

                        <tbody>
                            <% while(rs.next()) { %>
                            <tr>
                                <td style="padding: 12px 16px; text-align: center; border-bottom: 1px solid #ddd; font-size: 14px;"><%= rs.getString(1) %></td>
                                <td style="padding: 12px 16px; text-align: center; border-bottom: 1px solid #ddd; font-size: 14px;">
                                    <a href="sodiumwasteid.jsp?id=<%= rs.getString(1) %>" class="view-report-button">View Report</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <div style="text-align: center; margin-top: 20px;">
                    <a href="sodiumhome.html" class="back-button">Back To Home</a>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
