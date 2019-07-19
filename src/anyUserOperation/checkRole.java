package anyUserOperation;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.User;
import util.DB;

public class checkRole {

	public boolean checkRole(User user) {
		
		String checkRoleSql = "select usertype from bbs_user where username=?";
		DB db = new DB();
		ResultSet rs = db.query(checkRoleSql, new String[]{user.getUsername()});
		try {
			if(rs.next()){
				System.out.println("check function's rs.next() ok!");
				return rs.getBoolean(1);
			}else {
				System.out.println("check function's rs.next() error!");
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("check 3 ok!");
			return false;
		}finally{
			System.out.println("check function's db.close() ok!");
			db.close();
		}
	}

}
