<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
<jsp:useBean id="OnlineBean" scope="page" class="db.DbConnection" />
<%
String ID=null;
String name=null;
String nick=null;
ID = (String) session.getValue("ID");
name = (String) session.getValue("name");
nick =(String) session.getValue("nick");
//String passwd = (String) session.getValue("passwd");
if (ID!=null && name!=null && nick!=null) {
%>
<html>
<head>
<title>Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV=REFRESH CONTENT='120;URL=online.jsp'>
<style>
<!--
a            { color: #FFFFFF; text-decoration: none }
a:link       { text-decoration: none; color: #FFFFFF; font-family: 宋体 }
a:visited    { text-decoration: none; color: #FFFFFF; font-family: 宋体 }
a:hover      { text-decoration: underline; color: #CCCCCC }
a:active     { text-decoration: underline; color: #CCCCCC }
body         { font-size: 9pt }
table        { font-size: 9pt }
.bt { font-family: 宋体; font-size: 14px }
-->
</style>
</head>

<body bgcolor="#336699" text="#000000">
<p align="center"><font color="#FFFFFF">在线人数<br>
<%
  OnlineBean.openConnection();
  int staytime = 0;
  String sql = "select (UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(logintime)) as tltime from user where ID="+ ID;
  ResultSet rs = OnlineBean.executeQuery(sql);
  if (rs.next()) {

    staytime = rs.getInt("tltime");
  
  }
  rs.close();

  sql = "update userdata set staytime=staytime+"+ staytime +",nstaytime=0 where UID="+ ID;
  OnlineBean.executeUpdate(sql);

  sql = "update user set logintime=now(),likai=now() where ID="+ ID;
  OnlineBean.executeUpdate(sql);

  sql = "select count(*) as total from user WHERE (UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(logintime))<=180";
  rs = OnlineBean.executeQuery(sql);
  int numonline=0;
  if (rs.next()) {

    numonline = rs.getInt("total");
  
  }

  out.println("<a href='list.jsp' target='mainFrame'>"+ numonline +"</a>人");
  OnlineBean.close();
%>
</font></p>
</body>
</html>
<%
}
else {
  out.println("错误！你已被系统弹出！");
}
%>