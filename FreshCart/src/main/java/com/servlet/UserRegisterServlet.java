package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.connectionProvider.ConnectionProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection con;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		con = ConnectionProvider.getConnection();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		HttpSession hs = request.getSession();
		hs.setAttribute("loggedIn", email);
		
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into fc_customer(c_name,email,pwd) values(?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, pwd);
			pstmt.executeUpdate();
			String msg = name +" Registered successfully..";
			request.setAttribute("error", msg);
			RequestDispatcher rd = request.getRequestDispatcher("/UserLogin.jsp");
			rd.forward(request, response);
//			PrintWriter pw = response.getWriter();
//			pw.println("<body><center>");
//			pw.println("<h1>You have registered successfully</h1><br>");
//			pw.println("<a href=UserLogin.jsp >Login</a>");
//			pw.println("</center></body>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
