<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Process Status Check</title>
    <style>
        * {
            margin: 0;
            box-sizing: border-box;
            padding: 0;
        }
        
        body {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: rgb(15, 95, 161);
            transition: background 1.2s ease;
            position: relative;
            font-family: 'Raleway', sans-serif;
            background: url("images/background.jpg");
            background-size: cover;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        input {
            font-size: 1.3em;
        }
        h1 {
            color: white;
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.4em;
        }
        .email-field {
            background: white;
            height: 50px;
            width: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 5px;
            transition: all .5s ease;
            padding: 10px;
            margin-bottom: 20px;
        }
        .email-field i {
            padding: 10px;
            font-size: 1.3em;
            color: rgb(126, 126, 131);
        }
        .email-field input {
            color: rgb(126, 126, 131);
            background: none;
            border: none;
            outline: none;
            flex: 1;
            height: 100%;
        }
        .go-back-button {
            display: block;
            margin: 0 auto;
            background-color: #fff;
            color: #000;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .go-back-button:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>

<h1>PROTECTIVE TESTING EMPLOYEE - REGISTERED STATUS</h1>

<form method="get" action="teststs.jsp">
    <div class="email-field">
        <i class="fas fa-at"></i>
        <input type="email" placeholder="Email" autocomplete="off" name="email" required>
        <button type="submit" style="border: none; background: none; cursor: pointer;">
            <i class="fas fa-arrow-down"></i>
        </button>
    </div>
    <button class="go-back-button" type="button" onclick="window.location.href='index.html'">Go Back</button>
</form>

<script src="https://kit.fontawesome.com/6e358658ed.js" crossorigin="anonymous"></script>

</body>
</html>
