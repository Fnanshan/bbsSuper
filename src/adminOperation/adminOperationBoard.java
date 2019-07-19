package adminOperation;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import bean.Board;
import util.DB;

public class adminOperationBoard {
	
	public ResultSet displayBoardInfo(Board board){
		String sqlQueryBoard = "select boardid from board";
		DB db = new DB();
		ResultSet rs = db.query(sqlQueryBoard, new String[]{});
		
		try {
			try {
				while(rs.next()){
					board.setBoardid(rs.getString(1));
					board.setBoardname(rs.getString(2));
					board.setBoardtopics(rs.getInt(3));
					board.setBoardmanager(rs.getString(4));
					board.setBoardintroduce(rs.getString(5));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}finally{
			db.close();
		}
		return rs;
	}
	
	
	public ResultSet adminQueryBoard(Board board){
		String sqlQueryBoard = "select boardid from board where boardname=?";
		DB db = new DB();
		ResultSet rs = db.query(sqlQueryBoard, new String[]{board.getBoardname()});
		
		try {
			try {
				if(rs.next()){
					board.setBoardid(rs.getString(1));
					board.setBoardname(rs.getString(2));
					board.setBoardtopics(rs.getInt(3));
					board.setBoardmanager(rs.getString(4));
					board.setBoardintroduce(rs.getString(5));
				}else {
					System.out.println("rs.next no");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}finally{
			db.close();
		}
		return rs;
	}

	
	
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
	
}
