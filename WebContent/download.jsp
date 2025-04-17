<%@page import="org.apache.poi.hwpf.usermodel.TableCell"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.awt.Window"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@ page import="com.connect.Dbconn" %>
<%@ page import="org.apache.pdfbox.pdmodel.PDDocument"%>
<%@ page import="org.apache.pdfbox.pdmodel.PDPage"%>
<%@ page import="java.util.Random" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Download</title>
<style>
    body {
        font-family: 'Times New Roman', serif;
        margin: 20px;
    }
    h1, h2, h3 {
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<%

try {
	Connection con = Dbconn.getConectionn();
	    String id = request.getParameter("id");
	    String rep =request.getParameter("reportid");
	    HttpSession s=request.getSession();
	    s.setAttribute("id",id);
	    s.setAttribute("rep",rep);
	    
String qry1 = "select * from admin_requiremet";
PreparedStatement ps1 = con.prepareStatement(qry1);
ResultSet rs1 = ps1.executeQuery();

String qry2 = "select * from wasteprocessresult where client_id='"+id+"' and reportid='"+rep+"'";
PreparedStatement ps2 = con.prepareStatement(qry2);
ResultSet rs2 = ps2.executeQuery();

String qry3 = "select * from sodiumresult where  client_id='"+id+"' and reportid='"+rep+"'";
PreparedStatement ps3 = con.prepareStatement(qry3);
ResultSet rs3 = ps3.executeQuery();

String qry4= "select * from lipidresult where  client_id='"+id+"' and reportid='"+rep+"'";
PreparedStatement ps4 = con.prepareStatement(qry4);
ResultSet rs4 = ps4.executeQuery();

String qry5= "select * from ethuylamount where  client_id='"+id+"' and reportid='"+rep+"'";
PreparedStatement ps5 = con.prepareStatement(qry5);
ResultSet rs5 = ps5.executeQuery();

String qry6= "select * from ph_result where  client_id='"+id+"' and reportid='"+rep+"'";
PreparedStatement ps6 = con.prepareStatement(qry6);
ResultSet rs6 = ps6.executeQuery();

String qry7= "select * from migration_result where  client_id='"+id+"' and reportid='"+rep+"'";
PreparedStatement ps7 = con.prepareStatement(qry7);
ResultSet rs7 = ps7.executeQuery();

Document document = new Document();
ServletContext context = getServletContext();
String dirName =context.getRealPath("\\reportmail");
String fname="\\"+id+"-"+rep+".pdf";
String test=dirName+"\\"+id+"-"+rep+".pdf";
PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(test));
document.open();
float fntSize, lineSpacing;
fntSize = 15.0f;
lineSpacing = 40f;
Paragraph p = new Paragraph(new Phrase(lineSpacing,"FINAL REPORT "+id,FontFactory.getFont(FontFactory.COURIER, fntSize)));
p.setAlignment(Element.ALIGN_CENTER);
p.setAlignment(Element.ALIGN_CENTER);
p.setLeading(0,1);
document.add(p);
document.add(Chunk.NEWLINE);
document.add(new Paragraph(" "));
document.add(new Paragraph(" "));
document.add(new Paragraph(" "));
Paragraph p1 = new Paragraph(new Phrase(lineSpacing,"REQUIREMENTS "+id,FontFactory.getFont(FontFactory.COURIER, fntSize)));
p1.setAlignment(Element.ALIGN_CENTER);
p1.setAlignment(Element.ALIGN_CENTER);
p1.setLeading(0,1);
document.add(p1);
document.add(Chunk.NEWLINE);
Font font = new Font(FontFamily.HELVETICA, 10);
PdfPTable table = new PdfPTable(7);
table.setWidthPercentage(110);
table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
table.getDefaultCell().setFixedHeight(70);
table.addCell(new PdfPCell(new Phrase("CLIENT ID",font)));
table.addCell(new PdfPCell(new Phrase("ORDER ID",font)));
table.addCell(new PdfPCell(new Phrase("PRODUCT NAME",font)));
table.addCell(new PdfPCell(new Phrase("PRODUCT TYPE",font)));
table.addCell(new PdfPCell(new Phrase("QUANTITY OF PRODUCTS",font)));
table.addCell(new PdfPCell(new Phrase("POMACE NEEDED",font)));
table.addCell(new PdfPCell(new Phrase("DELIVERY DATE",font)));
while (rs1.next()) {
    String a1 = rs1.getString(1);
    String a2 = rs1.getString(2);
    String a3 = rs1.getString(3);
    String a5 = rs1.getString(4);
    String a6 = rs1.getString(5);
    String a8=  rs1.getString(6);
    String a9 = rs1.getString(7);
    table.addCell(new PdfPCell(new Phrase(a1,font)));
    table.addCell(new PdfPCell(new Phrase(a2,font)));
    table.addCell(new PdfPCell(new Phrase(a3,font)));
    table.addCell(new PdfPCell(new Phrase(a5,font)));
    table.addCell(new PdfPCell(new Phrase(a6,font)));
    table.addCell(new PdfPCell(new Phrase(a8,font)));
    table.addCell(new PdfPCell(new Phrase(a9,font)));
}
document.add(table); 
document.add(new Paragraph(" "));
document.add(new Paragraph(" "));
Paragraph p2 = new Paragraph(new Phrase(lineSpacing,"WASTE PROCESS REPORT "+id,FontFactory.getFont(FontFactory.COURIER, fntSize)));
p2.setAlignment(Element.ALIGN_CENTER);
p2.setAlignment(Element.ALIGN_CENTER);
p2.setLeading(0,1);
document.add(p2);
document.add(Chunk.NEWLINE);
PdfPTable table1 = new PdfPTable(7);
table1.setWidthPercentage(110);
table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
table1.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
table1.getDefaultCell().setFixedHeight(70);
table1.addCell(new PdfPCell(new Phrase("CLIENT ID",font)));
table1.addCell(new PdfPCell(new Phrase("REPORT ID",font)));
table1.addCell(new PdfPCell(new Phrase("TOMATO TYPE",font)));
table1.addCell(new PdfPCell(new Phrase("TOTAL POMACE",font)));
table1.addCell(new PdfPCell(new Phrase("INITIAL MOISTURE",font)));
table1.addCell(new PdfPCell(new Phrase("REMAINING MOISTURE",font)));
table1.addCell(new PdfPCell(new Phrase("POWDER",font)));
while (rs2.next()) {
    String a1 = rs2.getString(1);
	String a2 = rs2.getString(2);
	String a3 = rs2.getString(3);
    String a4 = rs2.getString(4);
    String a5 = rs2.getString(5);
    String a6 = rs2.getString(6);
    String a7 = rs2.getString(7);
    table1.addCell(new PdfPCell(new Phrase(a1,font)));
    table1.addCell(new PdfPCell(new Phrase(a2,font)));
    table1.addCell(new PdfPCell(new Phrase(a3,font)));
    table1.addCell(new PdfPCell(new Phrase(a4,font)));
    table1.addCell(new PdfPCell(new Phrase(a5,font)));
    table1.addCell(new PdfPCell(new Phrase(a6,font)));
    table1.addCell(new PdfPCell(new Phrase(a7,font)));
}
document.add(table1);
document.add(new Paragraph(" "));
document.add(new Paragraph(" "));
Paragraph p3 = new Paragraph(new Phrase(lineSpacing,"SODIUM PROCESS REPORT "+id,FontFactory.getFont(FontFactory.COURIER, fntSize)));
p3.setAlignment(Element.ALIGN_CENTER);
p3.setAlignment(Element.ALIGN_CENTER);
p3.setLeading(0,1);
document.add(p3);
document.add(Chunk.NEWLINE);
PdfPTable table2 = new PdfPTable(6);
table2.setWidthPercentage(110);
table2.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
table2.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
table2.getDefaultCell().setFixedHeight(70);
table2.addCell(new PdfPCell(new Phrase("CLIENT ID",font)));
table2.addCell(new PdfPCell(new Phrase("REPORT ID",font)));
table2.addCell(new PdfPCell(new Phrase("TOMATO TYPE",font)));
table2.addCell(new PdfPCell(new Phrase("POWDER QUANTITY",font)));
table2.addCell(new PdfPCell(new Phrase("TEMPERATURE",font)));
table2.addCell(new PdfPCell(new Phrase("SODIUM QUANTITY",font)));
while (rs3.next()) {
    String a1 = rs3.getString(1);
    String a2 = rs3.getString(2);
    String a3 = rs3.getString(3);
    String a4 = rs3.getString(4);
    String a5 = rs3.getString(5);
    String a6 = rs3.getString(6);
    table2.addCell(new PdfPCell(new Phrase(a1,font)));
    table2.addCell(new PdfPCell(new Phrase(a2,font)));
    table2.addCell(new PdfPCell(new Phrase(a3,font)));
    table2.addCell(new PdfPCell(new Phrase(a4,font)));
    table2.addCell(new PdfPCell(new Phrase(a5,font)));
    table2.addCell(new PdfPCell(new Phrase(a6,font))); 
}
document.add(table2);
document.add(new Paragraph(" "));
document.add(new Paragraph(" "));
Paragraph p4 = new Paragraph(new Phrase(lineSpacing,"LIPID EXTRACTION REPORT "+id,FontFactory.getFont(FontFactory.COURIER, fntSize)));
p4.setAlignment(Element.ALIGN_CENTER);
p4.setAlignment(Element.ALIGN_CENTER);
p4.setLeading(0,1);
document.add(p4);
document.add(Chunk.NEWLINE);
PdfPTable table3 = new PdfPTable(7);
table3.setWidthPercentage(110);
table3.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
table3.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
table3.getDefaultCell().setFixedHeight(70);
table3.addCell(new PdfPCell(new Phrase("CLIENT ID",font)));
table3.addCell(new PdfPCell(new Phrase("REPORT ID",font)));
table3.addCell(new PdfPCell(new Phrase("TOMATO TYPE",font)));
table3.addCell(new PdfPCell(new Phrase("POWDER QUANTITY",font)));
table3.addCell(new PdfPCell(new Phrase("TEMPERATURE",font)));
table3.addCell(new PdfPCell(new Phrase("SODIUM QUANTITY",font)));
table3.addCell(new PdfPCell(new Phrase("LIPID AMOUNT",font)));
while (rs4.next()) {
	String a4 = rs4.getString(1);
	String a5 = rs4.getString(2);
    String a1 = rs4.getString(3);
    String a2 = rs4.getString(4);
    String a3 = rs4.getString(5);
    String a6 = rs4.getString(6);
    String a7 = rs4.getString(7);
    table3.addCell(new PdfPCell(new Phrase(a4,font)));
    table3.addCell(new PdfPCell(new Phrase(a5,font)));
    table3.addCell(new PdfPCell(new Phrase(a1,font)));
    table3.addCell(new PdfPCell(new Phrase(a2,font)));
    table3.addCell(new PdfPCell(new Phrase(a3,font)));
    table3.addCell(new PdfPCell(new Phrase(a6,font)));
    table3.addCell(new PdfPCell(new Phrase(a7,font)));
}
document.add(table3);

document.add(new Paragraph(" "));
document.add(new Paragraph(" "));
Paragraph p5 = new Paragraph(new Phrase(lineSpacing,"ETHUYL ALCOHOL PROCESS REPORT "+id,FontFactory.getFont(FontFactory.COURIER, fntSize)));
p5.setAlignment(Element.ALIGN_CENTER);
p5.setAlignment(Element.ALIGN_CENTER);
p5.setLeading(0,1);
document.add(p5);
document.add(Chunk.NEWLINE);
PdfPTable table4 = new PdfPTable(7);
table4.setWidthPercentage(110);
table4.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
table4.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
table4.getDefaultCell().setFixedHeight(70);
table4.addCell(new PdfPCell(new Phrase("CLIENT ID",font)));
table4.addCell(new PdfPCell(new Phrase("REPORT ID",font)));
table4.addCell(new PdfPCell(new Phrase("TOMATO TYPE",font)));
table4.addCell(new PdfPCell(new Phrase("LIPID AMOUNT",font)));
table4.addCell(new PdfPCell(new Phrase("RATIO",font)));
table4.addCell(new PdfPCell(new Phrase("EXTRACTION EFFICIENCY",font)));
table4.addCell(new PdfPCell(new Phrase("EXTRACTED QUANTITY",font)));
while (rs5.next()) {
	String a4 = rs5.getString(1);
	String a5 = rs5.getString(2);
    String a1 = rs5.getString(3);
    String a2 = rs5.getString(4);
    String a3 = rs5.getString(5);
    String a6 = rs5.getString(6);
    String a7 = rs5.getString(7);
    table4.addCell(new PdfPCell(new Phrase(a4,font)));
    table4.addCell(new PdfPCell(new Phrase(a5,font)));
    table4.addCell(new PdfPCell(new Phrase(a1,font)));
    table4.addCell(new PdfPCell(new Phrase(a2,font)));
    table4.addCell(new PdfPCell(new Phrase(a3,font)));
    table4.addCell(new PdfPCell(new Phrase(a6,font)));
    table4.addCell(new PdfPCell(new Phrase(a7,font)));
}
document.add(table4);

document.add(new Paragraph(" "));
document.add(new Paragraph(" "));
Paragraph p6 = new Paragraph(new Phrase(lineSpacing,"PH RATIO REPORT "+id,FontFactory.getFont(FontFactory.COURIER, fntSize)));
p6.setAlignment(Element.ALIGN_CENTER);
p6.setAlignment(Element.ALIGN_CENTER);
p6.setLeading(0,1);
document.add(p6);
document.add(Chunk.NEWLINE);
PdfPTable table5 = new PdfPTable(7);
table5.setWidthPercentage(110);
table5.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
table5.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
table5.getDefaultCell().setFixedHeight(70);
table5.addCell(new PdfPCell(new Phrase("CLIENT ID",font)));
table5.addCell(new PdfPCell(new Phrase("REPORT ID",font)));
table5.addCell(new PdfPCell(new Phrase("TOMATO TYPE",font)));
table5.addCell(new PdfPCell(new Phrase("BUFFER",font)));
table5.addCell(new PdfPCell(new Phrase("CONCENTRATION",font)));
table5.addCell(new PdfPCell(new Phrase("RESULT",font)));
table5.addCell(new PdfPCell(new Phrase("CONTAINER TYPE",font)));
while (rs6.next()) {
	String a4 = rs6.getString(1);
	String a5 = rs6.getString(2);
    String a1 = rs6.getString(3);
    String a2 = rs6.getString(4);
    String a3 = rs6.getString(6);
    String a6 = rs6.getString(7);
    String a7 = rs6.getString(8);
    table5.addCell(new PdfPCell(new Phrase(a4,font)));
    table5.addCell(new PdfPCell(new Phrase(a5,font)));
    table5.addCell(new PdfPCell(new Phrase(a1,font)));
    table5.addCell(new PdfPCell(new Phrase(a2,font)));
    table5.addCell(new PdfPCell(new Phrase(a3,font)));
    table5.addCell(new PdfPCell(new Phrase(a6,font)));
    table5.addCell(new PdfPCell(new Phrase(a7,font)));
}
document.add(table5);

document.add(new Paragraph(" "));
document.add(new Paragraph(" "));
Paragraph p7 = new Paragraph(new Phrase(lineSpacing,"SAFETY TEST REPORT "+id,FontFactory.getFont(FontFactory.COURIER, fntSize)));
p7.setAlignment(Element.ALIGN_CENTER);
p7.setAlignment(Element.ALIGN_CENTER);
p7.setLeading(0,1);
document.add(p7);
document.add(Chunk.NEWLINE);
PdfPTable table6 = new PdfPTable(7);
table6.setWidthPercentage(110);
table6.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
table6.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
table6.getDefaultCell().setFixedHeight(70);
table6.addCell(new PdfPCell(new Phrase("CLIENT ID",font)));
table6.addCell(new PdfPCell(new Phrase("REPORT ID",font)));
table6.addCell(new PdfPCell(new Phrase("TOMATO TYPE",font)));
table6.addCell(new PdfPCell(new Phrase("MIGRATION AMOUNT",font)));
table6.addCell(new PdfPCell(new Phrase("EXPOSURE AMOUNT",font)));
table6.addCell(new PdfPCell(new Phrase("SAFETY AMOUNT",font)));
table6.addCell(new PdfPCell(new Phrase("SAFETY",font)));
while (rs7.next()) {
	String a4 = rs7.getString(1);
	String a5 = rs7.getString(2);
    String a1 = rs7.getString(3);
    String a2 = rs7.getString(4);
    String a7 = rs7.getString(5);
    String a3 = rs7.getString(6);
    String a6 = rs7.getString(7);

    table6.addCell(new PdfPCell(new Phrase(a4,font)));
    table6.addCell(new PdfPCell(new Phrase(a5,font)));
    table6.addCell(new PdfPCell(new Phrase(a1,font)));
    table6.addCell(new PdfPCell(new Phrase(a2,font)));
    table6.addCell(new PdfPCell(new Phrase(a7,font)));
    table6.addCell(new PdfPCell(new Phrase(a3,font)));
    table6.addCell(new PdfPCell(new Phrase(a6,font)));

}
document.add(table6);
document.close();
response.sendRedirect("reportdownload.jsp");
}catch(DocumentException e1) {
	e1.printStackTrace();
}catch (FileNotFoundException e2) {
	  e2.printStackTrace();  
}

%>
</body>
</html>