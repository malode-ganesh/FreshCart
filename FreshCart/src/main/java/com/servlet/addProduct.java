package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import com.connectionProvider.ConnectionProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

//@WebServlet("/addProduct")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	public void init(ServletConfig config) throws ServletException{
		try {
			con = ConnectionProvider.getConnection();
		}catch (Exception e) {
			System.out.println(e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InputStream inputStream = null; // input stream of the upload file
		
		String pName = request.getParameter("p_name");
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		String desc = request.getParameter("desc");
		String stock = request.getParameter("stock");
		// obtains the upload file part in this multipart request
        Part filePart = request.getPart("img");
      //obtain submitted file name
        String fileName = filePart.getSubmittedFileName();
        
        if (filePart != null) {
           // obtains input stream of the upload file
           inputStream = filePart.getInputStream();
        }
        String message = null; 
        
        try {
           
            String sql = "INSERT INTO fc_product(p_id,p_name,category,price,p_desc,available,imgData) values (product_id_sequence.NEXTVAL,?,?,?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(sql);
            //statement.setString(1, "product_id_sequence.NEXTVAL");
            statement.setString(1, pName);
            statement.setString(2, category);
            statement.setInt(3, price);
            statement.setString(4, desc);
            statement.setString(5, stock);
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(6, inputStream);
            }
                        
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                //message = "File uploaded: "+fileName;
            	message ="Product Added Successfully";
            }
        }catch(SQLIntegrityConstraintViolationException e) {
        	 message = "ERROR: "+pName +" product is already uploaded ";
             e.printStackTrace();
        }catch (Exception ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (con != null) {
                // closes the database connection
                try {
//                    con.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             System.out.println(message);       
             // forwards to the message page
             RequestDispatcher rd = request.getRequestDispatcher("/AdminDashboard.jsp");
             rd.forward(request, response);
        }
	}

}
