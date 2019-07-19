package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminOperation.adminOperationBoard;
import anyUserOperation.checkRole;
import anyUserOperation.loginOrRegister;
import bean.Bbs;
import bean.Board;
import bean.User;

import bean.*;

public class postDeal extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//this.doPost(request, response);
			this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		loginOrRegister login = new loginOrRegister();
		boolean flag;
		checkRole checkRole = new checkRole();
		int checkCount = 0;
		boolean flag1;
		transcoder transcoder = new transcoder();
		adminOperationBoard queryBoardId = new adminOperationBoard();
			
			//String boardname = request.getParameter("boardname");
			//String strValue = request.getParameter("subjectArray");
			//String[] strValue = request.getParameterValues("subjectArray");
			String strValueString = request.getParameter("subjectArray");
			String boardname = strValueString;
			String bbstitle = request.getParameter("bbstitle");
			String bbscontent = request.getParameter("bbscontent");
			//System.out.println(username);						//test 
			
			Bbs bbs = new Bbs();
			Board board = new Board();
			//bbs.setUsername(username);
			board.setBoardname(boardname);				//根据boardname获得boardid,才插入到bbs表里
			System.out.println(board.getBoardname());
			bbs.setBbstitle(bbstitle);
			bbs.setBbscontent(bbscontent);
			
			ResultSet rs1 = queryBoardId.adminQueryBoard(board);
			
			/*
			while(rs.next()){
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getString(4));
				System.out.println(rs.getString(5));
			}
			*/
			
			System.out.println("postDeal :" + board.getBoardid());	
			
			HttpSession session = request.getSession(false);
			if(session == null){
				session = request.getSession(true);
			}	
			//flag1 = login.login(user);							//test login	
			/*
				System.out.println(transcoder.toChinese(strValueString));		
				System.out.println(bbs.getBbstitle());				//test
				System.out.println(bbs.getBbscontent());
			*/
			
			
			
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("replyPostCondition.jsp");
			//requestDispatcher.forward(request, response);
			
			
			
	}
}
