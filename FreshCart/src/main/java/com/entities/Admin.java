package com.entities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Admin {
	Connection con;
	private String email;
	private String pwd;
	private String name;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Admin(String email, String pwd) {		
		this.email = email;
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	boolean verifyAdmin() {
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from fc_admin where email=? and pwd=?");
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				this.name = rs.getString("name");
				return true;
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return false;
	}
}
