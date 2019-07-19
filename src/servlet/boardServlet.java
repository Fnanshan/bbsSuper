package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Board;
import bean.transcoder;

import adminOperation.adminOperationBoard;
import adminOperation.adminOperationSubject;

public class boardServlet extends HttpServlet {

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
		adminOperationSubject updateSubject = new adminOperationSubject();
		adminOperationSubject querySubject = new adminOperationSubject();
		Board board = new Board();
		boolean flag;
		boolean flag1;
		transcoder transcoder = new transcoder();
		
		String boardnameJava = request.getParameter("boardnameJava");
		String boardintroduceJava = request.getParameter("boardintroduce");
		
		if(boardnameJava!=null){										//如果修改的是Java入门学习
			System.out.println("it is java");
			board.setBoardname(boardnameJava);
			board.setBoardintroduce(boardintroduceJava);
			
			System.out.println(transcoder.toChinese(board.getBoardname()));	//test
			System.out.println(board.getBoardintroduce());
			
			flag = updateSubject.adminUpdateSubject(board);
			if(flag){
				System.out.println("update ok");
				HttpSession session = request.getSession(false);
				if(session == null){
					session = request.getSession(true);
				}			
				session.setAttribute("boardnameJava",boardnameJava);
				System.out.println("下一步跳转index.jsp");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				requestDispatcher.forward(request, response);
				//session.invalidate();
				System.out.println("跳转成功");
				//System.out.println("boardnameSpring is :" + boardnameSpring);
			}else {
				System.out.println("update error");	
			}
		}
		
		
		String boardnameSpring = request.getParameter("boardnameSpring");
		String boardintroduceSpring = request.getParameter("boardintroduce");
		
		if(boardnameSpring!=null){										//如果修改的是Spring入门学习
			System.out.println("it is spring");
			
			board.setBoardname(boardnameSpring);
			board.setBoardintroduce(boardintroduceSpring);
			
			System.out.println(transcoder.toChinese(board.getBoardname()));	//test
			System.out.println(board.getBoardintroduce());
			
			flag = updateSubject.adminUpdateSubject(board);
			if(flag){
				System.out.println("update ok");
				HttpSession session = request.getSession(false);
				if(session == null){
					session = request.getSession(true);
				}			
				session.setAttribute("boardnameSpring",boardnameSpring);
				System.out.println("下一步跳转index.jsp");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				requestDispatcher.forward(request, response);
				//session.invalidate();
				System.out.println("跳转成功");
				//System.out.println("boardnameSpring is :" + boardnameSpring);
			}else {
				System.out.println("update error");	
			}
		}
		

		String boardnameNet = request.getParameter("boardnameNet");
		String boardintroduceNet = request.getParameter("boardintroduce");
		
		if(boardnameNet!=null){										//如果修改的是Net入门学习
			System.out.println("it is Net");
			
			board.setBoardname(boardnameNet);
			board.setBoardintroduce(boardintroduceNet);
			
			System.out.println(transcoder.toChinese(board.getBoardname()));	//test
			System.out.println(board.getBoardintroduce());
			
			flag = updateSubject.adminUpdateSubject(board);
			if(flag){
				System.out.println("update ok");
				HttpSession session = request.getSession(false);
				if(session == null){
					session = request.getSession(true);
				}			
				session.setAttribute("boardnameNet",boardnameNet);
				System.out.println("下一步跳转index.jsp");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				requestDispatcher.forward(request, response);
				//session.invalidate();
				System.out.println("跳转成功");
				//System.out.println("boardnameSpring is :" + boardnameSpring);
			}else {
				System.out.println("update error");	
			}
		}

		
		String boardnameStrus = request.getParameter("boardnameStrus");
		String boardintroduceStrus = request.getParameter("boardintroduce");
		
		if(boardnameNet!=null){										//如果修改的是Strus入门学习
			System.out.println("it is Net");
			
			board.setBoardname(boardnameStrus);
			board.setBoardintroduce(boardintroduceStrus);
			
			System.out.println(transcoder.toChinese(board.getBoardname()));	//test
			System.out.println(board.getBoardintroduce());
			
			flag = updateSubject.adminUpdateSubject(board);
			if(flag){
				System.out.println("update ok");
				HttpSession session = request.getSession(false);
				if(session == null){
					session = request.getSession(true);
				}			
				session.setAttribute("boardnameStrus",boardnameStrus);
				System.out.println("下一步跳转index.jsp");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				requestDispatcher.forward(request, response);
				//session.invalidate();
				System.out.println("跳转成功");
				//System.out.println("boardnameSpring is :" + boardnameSpring);
			}else {
				System.out.println("update error");	
			}
		}

		


		
		
		
		
		/*
		flag1 = querySubject.adminQuerySubject(board);
		if(flag1){
			System.out.println("query ok");
		}else {
			System.out.println("query error");
		}
		*/
		
		
		
		//System.out.println(boardintroduce);				test
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
		this.doGet(request, response);

	}

}
