package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entities.Admin;

public class Login {
	private Connection con;
	
	public Login(Connection con) {
		this.con = con;
	}
	
	public boolean VerifyAdmin(Admin admin) {
		boolean f = false;
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from fc_admin where email=? and pwd=?");
			pstmt.setString(1, admin.getEmail());
			pstmt.setString(2, admin.getPwd());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				f = true;				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return f;
	}
}
