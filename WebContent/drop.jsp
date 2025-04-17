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
<!doctype html>
<html>
<head>
    <title>EMPLOYEE STATUS</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link href="drop/css/jquery.selectbox.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="drop/js/jquery-1.7.2.min.js"> </script>
    <script type="text/javascript" src="drop/js/jquery.selectbox-0.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#country_id").selectbox();
        });

        function SelectRedirect() {
            var selectedValue = document.getElementById('country_id').value;
            switch (selectedValue) {
                case "waste":
                    window.location.href = "wasteprocess.jsp";
                    break;
                case "lipid":
                    window.location.href = "lipidprocess.jsp";
                    break;
                case "lacqure":
                    window.location.href = "lacqureprocess.jsp";
                    break;
                case "testing":
                    window.location.href = "testprocess.jsp";
                    break;
                default:
                    // Do nothing for the default case
                    break;
            }
            // Remove the first option after selection
            document.getElementById('country_id').remove(0);
        }
    </script>
   <style>
        body {
            background: url("images/removed.jpg");
            background-size: cover;
            font-family: 'Open Sans', sans-serif;
            background-color: #105469; /* Fallback background color */
        }
        h1 {
            text-align: center;
            font-size: 3em;
            padding: 10px;
            color: white; /* Changed heading color to white */
        }
        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            margin-top: 20px;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
        select {
            display: block;
            margin: 20px auto;
            padding: 10px;
            font-size: 1em;
        }
    </style>
</head>
<body>
<h1>EMPLOYEE REGISTERED STATUS</h1>
<select name="country_id" id="country_id" tabindex="1" onchange="SelectRedirect()">
     <option value="registered" selected disabled>REGISTERED</option>
    <option value="waste">WASTE PROCESS</option>
    <option value="lipid">LIPID EXTRACTION</option>
    <option value="lacqure">LACQUER FORMATION</option>
    <option value="testing">TESTING</option>
</select>
<center><a href="adminhome.html" class="back-button">Go Back</a></center>
</body>
</html>
