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
    <script language="javascript">
        function SelectRedirect(){
            switch(document.getElementById('country_id').value)
            {
                case "waste":
                    window.location="adminwaste1.jsp";
                    break;
                case "lipid":
                    window.location="adminsodiumid1.jsp";
                    break;
                case "lacqure":
                    window.location="lacqureid1.jsp";
                    break;
                case "testing":
                    window.location="adphres.jsp";
                    break;
                default:
                    window.location="admlogstatus.jsp"; 
                    break;
            } 
        }
    </script>
    <style>
        body {
            background: url("images/pi.jpg");
            background-size: cover;
            font-family: 'Open Sans', sans-serif;
            /* Optional: Fallback background color */
            background-color: #105469;
        }
        h1 {
            text-align: center;
            font-size: 3em;
            padding: 10px;
            color: black; /* Changed heading color to white */
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
        
    </style>
</head>
<body>
<h1>EMPLOYEE REPORT VIEW</h1>
    <select name="country_id" id="country_id" tabindex="1" onchange="SelectRedirect()">
        <option value="none" selected="" disabled="">REPORT SELECT</option>
        <option value="waste">WASTE PROCESS REPORT</option>
        <option value="lipid">LIPID EXTRACTION REPORT</option>
        <option value="lacqure">LACQUER FORMATION REPORT</option>
        <option value="testing">TESTING REPORT</option>
    </select>
    <div style="text-align: center; margin-top: 20px;">
                    <a href="adminhome.html" class="btn btn-primary back-button" role="button">Back to Home</a>
                </div>
    <script type="text/javascript" src="drop/js/jquery-1.7.2.min.js"> </script>
    <script type="text/javascript" src="drop/js/jquery.selectbox-0.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#country_id").selectbox();
        });
    </script> 
</body>
</html>
