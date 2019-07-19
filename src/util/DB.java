package util;



import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
	private Connection con;
	private PreparedStatement pre;
	private ResultSet rs;

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConection() {
		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/bbs", "root", "1234");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public ResultSet query(String sql, Object[] args) {
		con = this.getConection();
		try {
			//data
			pre = con.prepareStatement(sql);
			for(int i=0;i<args.length;i++){
				pre.setObject(i+1, args[i]);
			}
			rs = pre.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet yanZhengRegister(String sql, Object[] args) {
		con = this.getConection();
		try {
			//data
			pre = con.prepareStatement(sql);
			for(int i=0;i<args.length;i++){
				pre.setObject(i+1, args[i]);
			}
			rs = pre.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public int update(String sql, Object[] args) {
		con = this.getConection();
		int count = 0;
		try {
			pre = con.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				pre.setObject(i + 1, args[i]);
			}
			count = pre.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int insert(String sql,Object[] args){
		con = this.getConection();
		int count = 0;
		try {
			pre = con.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				pre.setObject(i + 1, args[i]);
			}
			count = pre.executeUpdate();
			//System.out.println("jdbc");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int delete(String sql, Object[] args) {
		con = this.getConection();
		int count = 0;
		try {
			pre = con.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				pre.setObject(i + 1, args[i]);
			}
			count = pre.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			pre.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
