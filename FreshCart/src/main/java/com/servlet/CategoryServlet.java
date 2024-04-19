package com.servlet;

import java.io.IOException;
import java.sql.Connection;

import com.connectionProvider.ConnectionProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CategoryServlet extends HttpServlet {
	Connection con;
	String category;
	public void init(ServletConfig config) throws ServletException {
		try {
			con = ConnectionProvider.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
	}


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		category = (String) request.getParameter("category");
		System.out.println("Category :"+category);
		request.setAttribute("category", category);
		
		String str = (String) request.getAttribute("email");
		System.out.println("Category :"+str);
		RequestDispatcher rd = request.getRequestDispatcher("/Product.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("category doPost()");
	}

}
