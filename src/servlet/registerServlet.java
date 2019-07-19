package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DB;

import anyUserOperation.checkRole;
import anyUserOperation.loginOrRegister;
import bean.User;

public class registerServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public registerServlet() {
		super();
	}

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
		loginOrRegister registerObject = new loginOrRegister();
		boolean flag;
		DB db = new DB();
		
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String usermail = request.getParameter("usermail");
		//System.out.println(username);
		//System.out.println("usernam");

		
		
		user.setUsername(username);							//将用户放在user里
		user.setUserpass(userpass);
		user.setUsermail(usermail);

		System.out.println(user.getUsername());				//test User表里有没有user的数据
		System.out.println(user.getUserpass());
		//System.out.println(user.getUserpass());
	
		
		String sqlYanZhengRegister = " select * from bbs_user where username=?";
	    ResultSet rs = db.query(sqlYanZhengRegister, new String[]{user.getUsername()});
		try {
			if(rs.next()){
				response.sendRedirect("tips.jsp");
				//System.out.println("username already live");
			}else {
				flag = registerObject.register(user);
				if(flag){												//succeed login
					HttpSession session = request.getSession(false);
					if(session == null){
						session = request.getSession(true);
					}			
					session.setAttribute("username", username);
					//session.setAttribute("registerUserpass", userpass);
					//System.out.println("register ok!");
					response.sendRedirect("index.jsp");
				}else {													//faile login
					//System.out.println("register error!");
					response.sendRedirect("tips.jsp");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		if(username != "" && userpass != ""){
			flag = registerObject.register(user);					test login
		
			if(flag){												succeed login
				HttpSession session = request.getSession(false);
				if(session == null){
					session = request.getSession(true);
				}			
				session.setAttribute("registerUsername", username);
				//session.setAttribute("registerUserpass", userpass);
				
				System.out.println("register ok!");
			}else {													faile login
			
			}
		*/
			

	
	}
}
