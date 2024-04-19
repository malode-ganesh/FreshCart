package com.entities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.connectionProvider.ConnectionProvider;

public class User {
	Connection con;
	private String email;
	private String name;
	private String pwd;
	
	//constructor email
	public User(String email) {
		this.email = email;
	}
	//constructor email&pwd
	public User(String email, String p) {
		this.email = email;
		this.pwd = p;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	//To get users details from database
	public void userInfo() {
		try {
			con = ConnectionProvider.getConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from fc_customer where email=?");
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				this.name = rs.getString("c_name");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	}
	
	public boolean verifyUser() {
		try {
			con = ConnectionProvider.getConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from fc_customer where email=? and pwd=?");
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				this.name = rs.getString("c_name");
				return true;
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
}
