<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.connect.Dbconn"%>
<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Multipart multipart = new MimeMultipart();
MimeBodyPart textPart = new MimeBodyPart();
try {
//String id = request.getParameter("id");
String email = request.getParameter("empmail");
String pas= request.getParameter("password");
String nn="provided";
textPart.setText("<html><head>"+
        "<style type=\"text/css\">" +

        "</style>"
      + "</head>"
      + "<p>"+"Your company by the name of <b>'"+email+"'</b> profile has been accepted successfully. Your password is <b>'"+pas+"'</b>. Make sure you enter this password while login."+"</p>"
      + "</html>",
      "ascii", "html");
multipart.addBodyPart(textPart);
String message1="Your Profile Accepted Successfully.Your password is '"+pas+"'.";
String host="", user="", pass="";
host ="smtp.gmail.com";
user ="yokeshpm45@gmail.com"; 
pass ="tjypqcjkcsczniko"; 
String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
String to ="yokeshpm45@gmail.com";
String from ="yokeshpm45@gmail.com";
String subject="Employee Acceptance Information";
String messageText = message1;

boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host",host);
props.put("mail.transport.protocol.","smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props,null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO,address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html");
msg.setContent(multipart);
Transport transport = mailSession.getTransport("smtp");
transport.connect(host,user,pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());
}
catch (Exception err) {
out.println("message not successfully sended"); 
} 
transport.close();
String pstatus="Accepted";

Connection con=Dbconn.getConectionn();
String sql="update protectivetesting set empstatus='"+pstatus+"' where password='"+pas+"'";
PreparedStatement ps=con.prepareStatement(sql);
int status = ps.executeUpdate();

if(status>0){
	%>
	<script>
	alert("Acceptance details successfully sent to mail");
	window.location="adminhome.html";
	</script>
	<% 
}
else{
	%>
	<script>
	alert("Acceptance details not successfully sent");
	window.location="adminhome.html";
	</script>
<% 	
}
	
}catch(Exception ex){
	ex.printStackTrace();
}
%>
</body>
</html>