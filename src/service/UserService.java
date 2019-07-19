package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import util.DB;

import bean.User;
import bean.Bbs;
import bean.Board;

public class UserService {
	
	
	
	
	
	/*
	----------------------login/register----------------
	
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
	
	public boolean register(User user){
		String sql = "insert into bbs_user(username,userpass) values(?,?)";
		DB db = new DB();
		int count = db.insert(sql, new String[]{user.getUsername(),user.getUserpass()});
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
	
	----------------------admin-board-----------------------------
	
	public boolean adminInsertBoard(Board board){
		String sqlInsertBoard = "insert into board(boardname,boardintroduce) values(?,?)";
		DB db = new DB();
		int count = db.insert(sqlInsertBoard, new String[]{board.getBoardname(),board.getBoardintroduce()});
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
	
	
	public boolean adminUpdateBoard(Board board){
		String sqlUpdateBoard = "update board set boardname=? boardintroduce=? where boardid=?";
		DB db = new DB();
		int count = db.update(sqlUpdateBoard, new String[] {board.getBoardname(),board.getBoardintroduce(),board.getBoardid()});
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
	
	
	public boolean adminDeleteBoard(Board board){
		String sqlDeleteBoard = "delete from board where boardname=?";
		DB db = new DB();
		int count = db.delete(sqlDeleteBoard, new String[]{board.getBoardname()});
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
	
	----------------------admin-subject----------------------
	
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
	
	public boolean adminUpdateSubject(Bbs bbs){
		String sqlUpdateBbs = "update bbs_bbs set boardid=? bbscontent=? where ";
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
	
	
	
	----------------------general--------------------
	
	*/
	
	
	
	//----------------------visitor--------------------
	
	
}
