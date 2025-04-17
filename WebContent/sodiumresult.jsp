<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="com.connect.Dbconn"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
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
    background: url("images/ore.jpg");
    background-size: cover;
    background-color: #105469;
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

table th {
    background-color: #007bff;
    color: #fff;
}

table td {
    background-color: #f9f9f9;
}

table tbody tr:nth-child(even) td {
    background-color: #f2f2f2;
}

table tbody tr:hover td {
    background-color: #e0e0e0;
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

.transparent-button {
    background-color: transparent;
    border: none;
    color: #007bff;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    text-decoration: none;
    display: inline-block;
}

.transparent-button:hover {
    background-color: #007bff;
    color: #fff;
}
.transparent-button.disabled {
    background-color: #e0e0e0; /* Light gray background */
    color: #9e9e9e; /* Gray text color */
    cursor: not-allowed; /* Indicate button is disabled */
    border: 1px solid #ccc; /* Light border */
}

</style>
</head>
<body>
<%
String id = request.getParameter("id");
String cid = request.getParameter("reportid");
Connection con = Dbconn.getConectionn();
String qry = "SELECT * FROM sodiumresult WHERE client_id=? AND reportid=?";
PreparedStatement ps = con.prepareStatement(qry);
ps.setString(1, id);
ps.setString(2, cid);
ResultSet rs = ps.executeQuery();

HttpSession s = request.getSession();
Set<String> disabledTomatoTypes = (Set<String>) s.getAttribute("disabledTomatoTypes");
if (disabledTomatoTypes == null) {
	disabledTomatoTypes = new HashSet<>();
 s.setAttribute("disabledTomatoTypes", disabledTomatoTypes);
}

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
                                <th>REPORT ID</th>
                                <th>TOMATO TYPE</th>
                                <th>POWDER(KG)</th>
                                <th>HEATING TEMPERATURE</th>
                                <th>SODIUM MIXED QUANTITY(KG)</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while(rs.next()) {%>
                            <tr>
                                <td><%= rs.getString(1) %></td>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getString(4) %></td>
                                <td><%= rs.getString(5) %></td>
                                <td>
                                    <form action="LipidExtract" method="post" onsubmit="return disableButton(this);">
                                        <input type="hidden" name="cid" value="<%= cid %>">
                                        <input type="hidden" name="id" value="<%= id %>">
                                        <input type="hidden" name="type" value="<%= rs.getString(3) %>">
                                        <input type="hidden" name="powder" value="<%= rs.getString(4) %>">
                                        <input type="hidden" name="heat" value="<%= rs.getString(5) %>">
                                        <input type="hidden" name="sodium" value="<%= rs.getString(6) %>">
                                     <button type="submit" class="transparent-button <%= disabledTomatoTypes.contains(rs.getString("type")) ? "disabled" : "" %>" <%= disabledTomatoTypes.contains(rs.getString("type")) ? "disabled" : "" %>>
            Extract
        </button>
</form>
                                </td>
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
<script>
function disableButton(form) {
    var button = form.querySelector('button[type="submit"]');
    if (button) {
        button.disabled = true;
        button.innerText = 'Extracting...';
        button.classList.add('disabled');
    }
    return true;
}
</script>
</body>
</html>
