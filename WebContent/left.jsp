<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
<jsp:useBean id="LeftBean" scope="page" class="db.DbConnection" />
<%
String ID = null;
String name = null;
String nick = null;
ID = (String) session.getValue("ID");
name = (String) session.getValue("name");
nick =(String) session.getValue("nick");
//String passwd = (String) session.getValue("passwd");

String serive = null;
String grzc = null;
String meid = null;
serive = request.getParameter("serive");
grzc = request.getParameter("grzc");
meid = request.getParameter("meid");

if (ID!=null && name!=null && nick!=null) {
  LeftBean.openConnection();
  String sql = "select * from adminuser where UID="+ ID;
  ResultSet rs = LeftBean.executeQuery(sql);
  int usuper = 0;
  int uboard = 0;
  int uuseradmin = 0;
  
  if (rs.next()) {

    usuper = rs.getInt("super");
    uboard = rs.getInt("board");
    uuseradmin = rs.getInt("useradmin");

  }
  rs.close();
%>
<html>
<head>
<title>导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
<img src="images/line_01_2.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><a href="in.jsp" target="mainFrame">社区首页</a><BR>
<img src="images/line_01_2.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><font color="#FFFFFF">社区导读</font><BR>
<img src="images/line_01_2.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><font color="#FFFFFF">个人服务</font><BR>
<img src="images/line_01_2.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><font color="#FFFFFF"><a href="jinghua.jsp" target='mainFrame'>社区精华</a></font><BR>
<%
  
  if (serive != null && serive.equals("1")) { 
%>
<img src="images/line_01_2.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><font color="#FFFFFF"><a href="left.jsp">社区服务</a></font><BR>
<img src='images/line_05.gif' width='37' height='16' align='absmiddle'><a href="searchf.jsp" target='mainFrame'>查询网友</a><BR>
<img src='images/line_05.gif' width='37' height='16' align='absmiddle'><a href="guestbook.jsp" target='mainFrame'>传纸条</a><BR>
<img src='images/line_05.gif' width='37' height='16' align='absmiddle'><a href="grzc.jsp" target='mainFrame'>珍藏配置</a><BR>
<img src='images/line_06.gif' width='37' height='16' align='absmiddle'><a href="peizhi.jsp" target='mainFrame'>资料配置</a><BR>
<%
    }
    else {
%>
<img src="images/line_01.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><font color="#FFFFFF"><a href="left.jsp?serive=1">社区服务</a></font><BR>
<%
    }
%>
<% if (usuper==1 || uboard==1) {%>
<img src="images/line_01_2.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><font color="#FFFFFF"><a href="boardconf.jsp" target="mainFrame">版区管理</a></font><BR>
<%
}
%>
<% if (usuper==1 || uuseradmin==1) {%>
<img src="images/line_01_2.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><font color="#FFFFFF"><a href="unpostconf.jsp?bid=0" target="mainFrame">用户管理</a></font><BR>
<%
}
%>

<img src="images/line_01_2.gif" width="18" height="16" align="absmiddle"><img src="images/i_option.gif" width="16" height="16" align="absmiddle"><font color="#FFFFFF"><a href="photolist.jsp" target="mainFrame">浏览照片</a></font><BR>

<hr width="90" align="left">

<%if (grzc != null && grzc.equals("1")) {%>
<img src="images/line_01_2.gif" width="18" height="16" align='absmiddle'><img src="images/i_person.gif" width="16" height="16" align='absmiddle'><font color="#FFFFFF"><a href="left.jsp">个人珍藏</a></font><br>
<%
  int zcnum = 0;
  sql = "select count(*) as zcnum from grzc where UID="+ ID +" order by zc";
  rs = LeftBean.executeQuery(sql);
  if (rs.next()) {
    zcnum = rs.getInt("zcnum");
  }
  rs.close();

  sql="select zc from grzc where UID="+ ID +" order by zc";
  rs = LeftBean.executeQuery(sql);
  int zcID = 0;
  String boardsname_zc = null;
  String sql_board = null;
  ResultSet rs_board;
  int inde = 1;
  while (rs.next()) {
    zcID = rs.getInt("zc");
    sql_board = "select boardsname from boards where ID="+ zcID;
    rs_board = LeftBean.executeQuery(sql_board);
    if (rs_board.next()) {
      boardsname_zc = rs_board.getString("boardsname");
	}

	if (inde==zcnum) {
      out.println("<img src='images/line_06.gif' width='37' height='16' align='absmiddle'><a href='right.jsp?bid="+ zcID +"&pages=1' target='mainFrame' >"+ boardsname_zc +"</a><BR>");
	}
	else {
      out.println("<img src='images/line_05.gif' width='37' height='16' align='absmiddle'><a href='right.jsp?bid="+ zcID +"&pages=1' target='mainFrame' >"+ boardsname_zc +"</a><BR>");
	}
	rs_board.close();
    inde++;
  }
  rs.close();
%>
<% } 
else {
%>
<img src="images/line_01.gif" width="18" height="16" align='absmiddle'><img src="images/i_person.gif" width="16" height="16" align='absmiddle'><font color="#FFFFFF"><a href="left.jsp?grzc=1">个人珍藏</a></font><br>
<%
}
%>

<%
  int BoardID = 0;
  int BoardsID = 0;
  String boardname = null;
  String boardsname = null;
  int boardsnum = 0;
  String sql_boards;
  ResultSet rs_boards;
  sql = "select * from board order by xu";
  rs = LeftBean.executeQuery(sql);
  while (rs.next()) {
    BoardID = rs.getInt("ID");
	boardname =rs.getString("boardname");

	if (meid!=null && meid.equals(String.valueOf(BoardID))) {
      out.println("<img src='images/line_01_2.gif' width='18' height='16' align='absmiddle'><img src='images/folder_01.gif' width='16' height='16' align='absmiddle'><a href='left.jsp'>"+ boardname +"</a>");
      
     // if (meid!=null && meid.equals(String.valueOf(BoardID))) {
      
	  sql_boards = "select count(*) as boardsnum from boards where boardID="+ meid;
	  rs_boards = LeftBean.executeQuery(sql_boards);
	  if (rs_boards.next()) {
      boardsnum = rs_boards.getInt("boardsnum");
	  }
      rs_boards.close();
	  
	  sql_boards = "select * from boards where boardID="+ meid;
      rs_boards = LeftBean.executeQuery(sql_boards);
	  int i1=1;
	  while (rs_boards.next()) {
	    BoardsID = rs_boards.getInt("ID");
		boardsname = rs_boards.getString("boardsname");
        if (i1==boardsnum) {
          
		  out.println("<img src='images/line_06.gif' width='37' height='16' align='absmiddle'><a href='right.jsp?bid="+ BoardsID +"&pages=1' target='mainFrame' >"+ boardsname +"</a><BR>");

		}
		else {
          
		  out.println("<img src='images/line_05.gif' width='37' height='16' align='absmiddle'><a href='right.jsp?bid="+ BoardsID +"&pages=1' target='mainFrame' >"+ boardsname +"</a><BR>");
     
        }
		i1++;
	  }
	  rs_boards.close();
     
	//}
    
	}
	else {
      out.println("<img src='images/line_01.gif' width='18' height='16' align='absmiddle'><img src='images/folder_01.gif' width='16' height='16' align='absmiddle'><a href='left.jsp?meid="+ BoardID +"' target='leftFrame1'>"+ boardname +"</a><BR>"); 
	}

    

  }
  rs.close();

%>


<img src="images/line_01_2.gif" width="18" height="16" align='absmiddle'><img src="images/i_exit.gif" width="16" height="16" align='absmiddle'><a href="userlogout.jsp" target="_parent">退出社区</a>

</body>
</html>

<%
 LeftBean.close();
}
else {
  out.println("错误！");
}
%>