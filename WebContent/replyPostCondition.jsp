<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.transcoder" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'replyPostCondition.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  	<jsp:useBean id="bbs" class="bean.Bbs">
  		<body>
  			<url>
  				<li>
  				subject ：<%=transcoder.toChinese((String)session.getAttribute("boardname")) %>
  				</li>
  				<li>title: <%=transcoder.toChinese(bbs.getBbstitle()) %></li>
  				<li>context: <%=transcoder.toChinese(bbs.getBbscontent()) %></li>
  				=======
  				<br/>
				tips:
  				<%=bbs.getBbstitle() %>
  				<%=bbs.getBbscontent() %>
  				dfdfd
  				<%
  					
  				%>
  			</url>
  		
  		</body>			
  		
  	</jsp:useBean>
    	
 
</html>
