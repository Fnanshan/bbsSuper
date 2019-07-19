<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="anyUserOperation.checkRole" %>
<%@ page import="anyUserOperation.loginOrRegister" %>
<%@ page import="bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="LoginBean" scope="page" class="anyUserOperation.loginOrRegister"/>
<%
		
		User user = new User();
		loginOrRegister login = new loginOrRegister();
		boolean flag;
		checkRole checkRole = new checkRole();
		int checkCount = 0;
		
		//String pub=request.getParameter("pub");
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String message;
		
		user.setUsername(username);							//将用户放在user里
		user.setUserpass(userpass);

		flag = login.login(user);							//test login
		
		if(flag){												//succeed login
			session = request.getSession(false);
			if(session == null){
				session = request.getSession(true);
			}			
			//session.setAttribute("id",user.getId());
			session.setAttribute("username",username);
			
			//需要获取用户的所有信息？？？？？？？？？？？？？？？？？？？？？？？？？？？？
			boolean role= checkRole.checkRole(user);			//checkRole
			//System.out.println(role);
			
			if(role){										//判断usertype
				session.setAttribute("usertype","admin");
			}
			else{
				session.setAttribute("usertype","");
			}
			//System.out.println(session.getAttribute("usertype"));
			
			response.sendRedirect("index.jsp");					//if admin ? index.jsp display update and delete : not display
		}else {													//faile login			
			response.setHeader("refresh","1;URL=login.jsp");
			//response.sendRedirect("login.jsp");
			checkCount +=1;
			if(checkCount >= 4){
				//output:请10分钟后登录
				out.println("	//output:请10分钟后登录");
				
			}
		}
	
%>