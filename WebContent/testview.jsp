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
<title>Result Display</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Rate My Website  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="pay/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">
<style>
    body {
        font-family: 'PT Sans', Arial, sans-serif; 
        background: url("images/ph.jpg");
        background-size: cover;
        margin: 0;
        padding: 3em 0;
    }

    .form-container {
        max-width: 500px;
        margin: 0 auto;
        text-align: center;
        padding: 20px;
        background: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-container form {
        margin-top: 20px;
    }

    .form-container input[type="submit"] {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #333;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        text-decoration: none;
        margin-top: 20px; /* Added margin to the submit button */
    }

    .form-container input[type="submit"]:hover {
        background-color: #555;
    }

    h1 {
        text-align: center;
        font-size: 3em;
        padding: 20px;
        color: merun; /* Changed heading color to white */
    }

    .back-button {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #555;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        text-decoration: none;
        margin-top: 20px; /* Adjusted margin for consistency */
        text-align: center; /* Centered text */
    }

    .back-button:hover {
        background-color: #777;
    }
</style>

</head>
<body>
<%
String id = request.getParameter("id");
String rep=request.getParameter("reportid");
%>
<h1>CALCULATE PH</h1>
    <div class="form-container">
        <form action="PhCalculate" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    <input type="hidden" name="rep" value="<%= rep %>">
    <input type="submit" value="CALCULATE PH LEVEL">
</form>
        <div style="margin-top: 20px;">
            <a href="test.html" class="back-button">Back to Home</a>
        </div>
    </div>
</body>
</html>
