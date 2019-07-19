package adminOperation;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Bbs;
import bean.Board;
import util.DB;

public class adminOperationSubject {

	public ResultSet adminQuerySubject(Board board){
		String sqlQuerySubject = "select boardname from board where boardid=1";
		DB db = new DB();
		ResultSet rs = db.query(sqlQuerySubject,new String[]{});
		try {
		 if(rs.next()){
			/*
			 while(rs.next()){
				board.setBoardid(rs.getString(1));
				board.setBoardname(rs.getString(2));
				board.setBoardtopics(rs.getInt(3));
				board.setBoardmanager(rs.getString(4));
				board.setBoardintroduce(rs.getString(5));
				return true;
			}
			*/
			 return rs;
		 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.close();
		}
		return rs;

	}
	
	public boolean adminInsertSubject(Bbs bbs){
		String sqlInsertBbs = "insert into bbs_bbs(boardid,bbscontent) values(?,?)";
		DB db = new DB();
		int count = db.insert(sqlInsertBbs, new String[]{bbs.getBoardid(),bbs.getBbscontent()});
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
	
	public boolean adminUpdateSubject(Board board){
		String sqlUpdateBoard = "UPDATE board SET boardname=?,boardintroduce=? WHERE boardid=1";
		DB db = new DB();
		int count = db.update(sqlUpdateBoard, new String[]{board.getBoardname(),board.getBoardintroduce()});
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
	
	public boolean adminDeleteSubject(Bbs bbs){
		String sqlDeleteSubject = "delete from bbs_bbs where bbsid=?";
		DB db = new DB();
		int count = db.delete(sqlDeleteSubject, new String[]{bbs.getBbsid()});
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
