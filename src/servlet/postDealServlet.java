package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anyUserOperation.checkRole;
import anyUserOperation.loginOrRegister;
import bean.Bbs;
import bean.Board;
import bean.User;

public class postDealServlet extends HttpServlet {

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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
	
	String boardname = request.getParameter("boardname");
	String bbstitle = request.getParameter("bbstitle");
	String bbscontent = request.getParameter("bscontent");
	//System.out.println(username);						//test 
	Bbs bbs = new Bbs();
	Board board = new Board();
	//bbs.setUsername(username);
	
	//board.setBoardname(boardname);				//根据boardname获得boardid,才插入到bbs表里
	bbs.setBbstitle(bbstitle);
	bbs.setBbscontent(bbscontent);
	
	flag1 = login.login(user);							//test login
	
	if(flag1){												//succeed login
		HttpSession session = request.getSession(false);
		if(session == null){
			session = request.getSession(true);
		}			
		//session.setAttribute("id",user.getId());
	

	//System.out.println(board.getBoardname());				//test
	System.out.println(bbs.getBbstitle());				//test
	System.out.println(bbs.getBbscontent());
	
	//RequestDispatcher requestDispatcher = request.getRequestDispatcher("replyPostCondition.jsp");
	//requestDispatcher.forward(request, response);
	
	
	}
}

}
