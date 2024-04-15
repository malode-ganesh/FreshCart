package com.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import com.connectionProvider.ConnectionProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177215)
public class UploadNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			con = ConnectionProvider.getConnection();
		}catch (Exception e) {
			System.out.println(e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String course = request.getParameter("course");		
		Part filePart = request.getPart("pdf");
		
		InputStream inputStream =null;
		String fileName = filePart.getSubmittedFileName();		
		LocalDate ld = LocalDate.now();
		
		
		
		if(filePart != null) {
			inputStream = filePart.getInputStream();
		}
		String message = null; 
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into notices(pdf, fileName, uploadDate,course) values(?,?,?,?)");
			if(inputStream != null) {
				pstmt.setBlob(1, inputStream);
			}
			pstmt.setString(2, fileName);
			pstmt.setDate(3, Date.valueOf(ld));
			pstmt.setString(4, course);
			
			int row = pstmt.executeUpdate();
            if (row > 0) {
                message = "File uploaded: "+fileName +"\nDate:" +Date.valueOf(ld);
            }
		
            
         /*   
         // Create and display the alert message
            message = "Name: " + fileName ;
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('" + message + "');</script>");

           
            // Forward to another page
            request.getRequestDispatcher("adminDashboard.jsp").include(request, response);
		*/
         request.setAttribute("msg", message);
      // forwards to the message page
         RequestDispatcher rd = request.getRequestDispatcher("/noticeAlert.jsp");
         rd.forward(request, response);
            
            
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//response.getWriter().print(message + " " + Date.valueOf(ld) );
	}

}
