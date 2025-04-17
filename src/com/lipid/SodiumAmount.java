package com.lipid;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connect.Dbconn;

@WebServlet("/SodiumAmount")
public class SodiumAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			Connection con=Dbconn.getConectionn();
			
			PrintWriter out=response.getWriter();
			String path="E:/BPA-AI (FULL)/Project/tomato_pomace/";
    		String newPath=path+"//WebContent//Dataset//sodium_amount.csv";
    		
    		String qry =  "LOAD DATA INFILE '"+newPath+"'" +
        	        "INTO TABLE sodiumamount FIELDS TERMINATED BY ','" +
        	        "OPTIONALLY ENCLOSED by '\"'" +"IGNORE 1 LINES ";
			PreparedStatement st= con.prepareStatement(qry);
			int i = st.executeUpdate();
			 
			if(i>0) {
				out.print("<head><script>alert('Sodium Amount - uploaded successfully');</script></head>");
				RequestDispatcher dd=request.getRequestDispatcher("sodiumh.html");
				dd.include(request, response);
			}
			else {
				out.print("<head><script>alert('Sodium Amount - uploaded unsuccessful');</script></head>");
				RequestDispatcher dd=request.getRequestDispatcher("sodiumh.html");
				dd.include(request, response);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
