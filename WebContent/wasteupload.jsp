<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.*, javax.servlet.annotation.*" %>
<%@ page import="java.util.*, java.nio.file.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>File Upload</title>
    <link href="cre/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="cre/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script src="cre/js/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="File Uploader Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
    <script type="application/x-javascript"> 
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
        function hideURLbar(){ window.scrollTo(0,1); } 
    </script>
    <style>
        body {
            background: url("images/y.jpeg");
            background-size: cover;
            font-family: 'Open Sans', sans-serif;
            background-color: #105469;
        }
       .button {
    display: flex;
   justify-content: space-between;
    gap: 10px;
    margin-top: 20px;
}

.button a, .button input[type="submit"] {
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 16px;
    text-align: center; /* Center the text inside the button */
    min-width: 100px; /* Set a minimum width for both buttons */
}

.cancel a {
    background-color: #ff4d4d; /* Red background for cancel */
    color: white;
    padding: 5px 10px; /* Adjusted padding for smaller size */
    font-size: 14px;
}

.cancel a:hover {
    background-color: #cc0000; /* Darker red for hover */
}

.upload-button input[type="submit"] {
    background-color: #4CAF50; /* Green background for upload */
    color: white;
    border: none;
    cursor: pointer;
}

.upload-button input[type="submit"]:hover {
    background-color: #45a049; /* Darker green for hover */
}

    </style>
</head>
<body>

<h1>UPLOAD QUANTITIES</h1>

<div class="upload">
    <div class="login-form">
        <form id="uploadForm" method="post" action="WasteUpload" enctype="multipart/form-data">
            <div id="drop">
                <a>Upload File</a>
                <input type="file" name="upl" />
            </div>
            <ul>
                <!-- The file uploads will be shown here -->
            </ul>
            <div class="button">
    <div class="cancel"><a href="wastehome.html" type="button">Cancel</a></div>
    <div class="upload-button"><input type="submit" value="Upload" style="float: left;
    width: 25%;
    background-color: green;
    border: none;
    color: #FFF;
    padding: 11px 0px;
    border-radius: 3px;
    color: #FFF;
    font-family: calibri;
    font-size: 18px;
    outline: none;
    cursor: pointer;
    text-decoration: none;
    margin-right: 20px;"></div>
</div>
        </form>
    </div>
</div>

<!-- JavaScript Includes -->
<script src="cre/js/jquery.knob.js"></script>
<script src="cre/js/jquery.ui.widget.js"></script>
<script src="cre/js/jquery.iframe-transport.js"></script>
<script src="cre/js/jquery.fileupload.js"></script>
<script src="cre/js/script.js"></script>

</body>
</html>
