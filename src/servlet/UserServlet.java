package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anyUserOperation.checkRole;
import anyUserOperation.loginOrRegister;
import service.UserService;

import bean.User;

class UserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = new User();
		loginOrRegister loginObject = new loginOrRegister();
		boolean flag;
		checkRole checkRole = new checkRole();
		int checkCount = 0;
		
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");

		user.setUsername(username);							//将用户放在user里
		user.setUserpass(userpass);
		
		flag = loginObject.login(user);							//test login
		
		if(flag){												//succeed login
			HttpSession session = request.getSession(false);
			if(session == null){
				session = request.getSession(true);
			}			
			session.setAttribute("username",username);
			
			boolean role = checkRole.checkRole(user);			//checkRole
			if(role){												//admin role
				response.sendRedirect("admin.jsp");
			}else {													//general role
				response.sendRedirect("general.jsp");
			}
		}else {													//faile login
			response.sendRedirect("index.html");
			checkCount +=1;
			if(checkCount >= 4){
				//output:请10分钟后登录
			}
		}
		
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
