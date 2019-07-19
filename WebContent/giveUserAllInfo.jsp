<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="anyUserOperation.checkRole" %>
<%@ page import="anyUserOperation.loginOrRegister" %>
<%@ page import="bean.User"%>
<%@ page import="util.DB" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="LoginBean" scope="page" class="anyUserOperation.loginOrRegister"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
		User user = new User();
		//登录成功后获得用户的全部信息
		String sql = "select * from bbs_user where username";
		DB db = new DB();
		ResultSet rs = db.query(sql, new String[]{user.getUsername()});
		try {
			if(rs.next()){	
				session.setAttribute("usertype",rs.getString(4));			//*11
				session.setAttribute("id",rs.getString(5));	
				session.setAttribute("id",rs.getString(6));	
				//然后将信息发送给页面
			}else {
				//如果没有用户的其他信息，则-------
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}finally{
			db.close();
		}
 %>