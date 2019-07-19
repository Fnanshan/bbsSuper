package anyUserOperation;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.User;
import util.DB;

public class loginOrRegister {
	public boolean login(User user){
		String sql = "select * from bbs_user where username=? and userpass=?";
		DB db = new DB();
		ResultSet rs = db.query(sql, new String[]{user.getUsername(),user.getUserpass()});
		try {
			if(rs.next()){
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			db.close();
		}
	}
	
	//登录成功后获得用户的全部信息
	public boolean giveUserInfo(User user) {
		String sql = "select * from bbs_user where username";
		DB db = new DB();
		ResultSet rs = db.query(sql, new String[]{user.getUsername()});
		try {
			if(rs.next()){
				
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			db.close();
		}
	}
	
	public boolean register(User user){
		String sql = "insert into bbs_user(username,userpass,usermail) values(?,?,?)";
		DB db = new DB();
		int count = db.insert(sql, new String[]{user.getUsername(),user.getUserpass(),user.getUsermail()});
		try {
			if(count > 0){
				return true;
			}else {
				return false;
			}
		}finally{
			db.close();
		}
	}
}
