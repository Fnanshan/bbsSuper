<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String id=null;
String username=null;
String nick=null;
id = (String) session.getAttribute("id");
username = (String) session.getAttribute("username");
//nick =(String) session.getValue("nick");
//String passwd = (String) session.getValue("passwd");
if (id!=null && username!=null) {			// && nick!=null			如果id、username not null
%>

<html>
<head>
<title>虚拟社区 </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<frameset frameborder="0" border="0" framespacing="0" rows="*"> 
<frameset cols="130,*" frameborder="0" border="0" framespacing="0"> 
  <frameset rows="*,90%">
  <frame name="leftFrame" src="online.jsp" scrolling="no">
    <frame name="leftFrame1" src="left.jsp">
  </frameset>
  <frame name="mainFrame" src="in.jsp">
  <noframes>
<body bgcolor="#FFFFFF" text="#000000">
</body>
  </noframes>
</frameset>
</frameset>
<frameset>
<noframes> 
<body bgcolor="#FFFFFF" text="#000000">
</body>
</noframes> 
</frameset>
</html>
<%
}
else {
  out.println("Error!");
}
%>