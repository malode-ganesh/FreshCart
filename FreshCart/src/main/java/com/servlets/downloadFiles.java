package com.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class downloadFiles extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 4096;
	Connection con;
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","devil123");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String fname = request.getParameter("uploadFileName");
 
            // queries the database
            String sql = "SELECT * FROM db WHERE filename = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, fname);
 
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                // gets file name and file blob data
                String fileName = result.getString("filename");
                Blob blob = result.getBlob("PDF");
                InputStream inputStream = blob.getBinaryStream(); //blob.getBlob();
                
                int fileLength =(int) blob.length();
                //file length
                 
                System.out.println("fileLength = " + fileLength);
 
//                ServletContext context = getServletContext();
// 
//                // sets MIME type for the file download
//                String mimeType = context.getMimeType(fileName);
//                if (mimeType == null) {        
//                    mimeType = "application/octet-stream";
//                }              
                 
                // set content properties and header attributes for the response
                response.setContentType("application/pdf");
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close();             
            } else {
                // no file found
            	PrintWriter pw = response.getWriter();
            	pw.print("<br><br><br><Br>");
                pw.print("<body><center><h3 style=color:red>File not found for the id: " + fname +"</h3></center><body>");  
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            response.getWriter().print("IO Error: " + ex.getMessage());
        } finally {
            if (con != null) {
                // closes the database connection
//                try {
//                    con.close();
//                } catch (SQLException ex) {
//                    ex.printStackTrace();
//                }
            	
//            	(int) blob.length();
            }          
        }	}
	}

