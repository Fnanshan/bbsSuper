<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
<jsp:useBean id="InBean" scope="page" class="db.DbConnection" />
<%
String ID = null;
String name = null;
String nick = null;
ID = (String) session.getValue("ID");
name = (String) session.getValue("name");
nick =(String) session.getValue("nick");

int cishu = 0;
int bx = 0;
int artunm = 0;
int staytime = 0;
int power = 0;
int exp = 0;
int hpower = 0;
String jibie = null;
int znote = 0;
int wnote = 0;
int numonline = 0;
int myfriend = 0;
int friendonlie = 0;

if (ID!=null && name!=null && nick!=null) {
  InBean.openConnection();
  String sql = "select cishu from user where ID="+ ID;
  ResultSet rs = InBean.executeQuery(sql);
  if (rs.next()) {
    cishu = rs.getInt("cishu"); 
  }
  rs.close();

  sql = "select * from userdata where UID="+ ID;
  rs = InBean.executeQuery(sql);
  if (rs.next()) {
    
	bx = rs.getInt("bx");
    artunm = rs.getInt("artunm");
    staytime = rs.getInt("staytime");
    power = rs.getInt("power");

  }
  rs.close();

  exp = (cishu/4)+artunm+(staytime/3600)+bx;

  if (exp>=0 && exp<=10) {
    hpower=10;
    jibie="������·";
  }

  if (exp>=11 && exp<=50) {
    hpower=15;
    jibie="��������";
  }

  if (exp>=51 && exp<=130) {
    hpower=20;
    jibie="һ��վ��";
  }

  if (exp>=131 && exp<=260) {
    hpower=30;
    jibie="�м�վ��";
  }

  if (exp>=261 && exp<=450) {
    hpower=40;
    jibie="�߼�վ��";
  }

  if (exp>=451 && exp<=700) {
    hpower=50;
    jibie="�� վ ��";
  }

  if (exp>=701 && exp<=1100) {
    hpower=60;
    jibie="��ͭ����";
  }

  if (exp>=1101 && exp<=1900) {
    hpower=80;
    jibie="��������";
  }

  if (exp>=1901 && exp<=3000) {
    hpower=100;
    jibie="�ƽ���";
  }

  if (exp>=3001 && exp<=4500) {
    hpower=120;
    jibie="�׽���";
  }

  if (exp>=4501 && exp<=6500) {
    hpower=140;
    jibie="��ʯ����";
  }

  if (exp>=6501 && exp<=9000) {
    hpower=170;
    jibie="��վԪ��";
  }

  if (exp>=9001) {
    hpower=200;
    jibie="��������";
  }

  sql = "update userdata set exp="+ exp +",power="+ power +",hpower="+ hpower +" where UID="+ ID;
  InBean.executeUpdate(sql);

  sql = "select count(*) as znote from guestbook where UID="+ ID;
  rs = InBean.executeQuery(sql);
  if (rs.next()) {
    znote = rs.getInt("znote");
  }
  rs.close();

  sql = "select count(*) as wnote from guestbook where UID="+ ID +" and yd=0";
  rs = InBean.executeQuery(sql);
  if (rs.next()) {
    wnote = rs.getInt("wnote");
  }
  rs.close();

  sql = "SELECT count(*) as numonline FROM user WHERE (UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(logintime))<=180";
  rs = InBean.executeQuery(sql);
  if (rs.next()) {
    numonline = rs.getInt("numonline");
  }
  rs.close();

  sql = "select count(*) as myfriend from friend where UID="+ ID;
  rs = InBean.executeQuery(sql);
  if (rs.next()) {
    myfriend = rs.getInt("myfriend");
  }
  rs.close();

  sql = "select count(*) as friendonlie from user,friend where friend.UID="+ ID +" and user.ID=friend.FID and (UNIX_TIMESTAMP(NOW())-UNIX_TIMESTAMP(user.logintime))<=180";
  rs = InBean.executeQuery(sql);
  if (rs.next()) {
    friendonlie = rs.getInt("friendonlie");
  }
  rs.close();

%>
<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style>
<!--
a            { color: #0000FF; text-decoration: none }
a:link       { text-decoration: none; color: #0000FF; font-family: ���� }
a:visited    { text-decoration: none; color: #0000FF; font-family: ���� }
a:hover      { text-decoration: underline; color: #FF0000 }
a:active     { text-decoration: underline; color: #FF0000 }
body         { font-size: 9pt }
table        { font-size: 9pt }
.bt { font-family: ����; font-size: 14px }
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0">
<table width="615" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td height="20"> 
      <div align="center"><span class="bt">��������<a href="searchf.jsp">��ѯ����</a> <a href="guestbook.jsp">��ֽ��</a> <a href="grzc.jsp">�������</a> <a href="peizhi.jsp">��������</a></span></div>
    </td>
  </tr>
  <tr>
    <td>
      <div align="center"><%
	 Random r = new Random();
	 int rnum;
	 rnum = r.nextInt(2)+1;
	 if (rnum==1) {
       out.println("<a href=http://www.loveroom.com.cn target=_blank><img src=images/shmail.gif width=468 height=60 border=0></a>");
	 }
	 else if (rnum==2) {
	   out.println("<script src=http://mysms.163.com/person?username=laoer&type=1></script>");
	 }
	 else {
      out.println("<a href=http://www.loveroom.com.cn target=_blank><img src=images/shmail.gif width=468 height=60 border=0></a>");
	 }
	 %><!-- <a href="http://www.loveroom.com.cn" target="_blank"><img src="images/shmail.gif" width="468" height="60" border="0"></a> --></div>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#355397" height="2"></td>
  </tr>
  <tr> 
    <td bgcolor="#EEF3F9"> 
      <div align="center">��ӭ����<font face="Verdana, Arial, Helvetica, sans-serif"><b><font size="2" color="#D40000">WWW.LOVEROOM.COM.CN</font></b></font>����</div>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#355397" height="2"></td>
  </tr>
</table>
<table width="615" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="207" valign="top" bgcolor="#EEF3F9">
      <div align="center"><%
	  int photonum = 0;
	  String picname = "";
	  sql = "select count(*) as photonum from photo where UID="+ID;
	  rs = InBean.executeQuery(sql);
        if (rs.next()) {
          photonum = rs.getInt("photonum");
        }
        rs.close();
      if (photonum!=0) {
        sql = "select picname from photo where UID="+ID;
		rs = InBean.executeQuery(sql);
        if (rs.next()) {
          picname = rs.getString("picname");
        }
        rs.close();
		out.print("<img src=upload/"+ picname +" width=200 height=150>");
	  }
	  else {
	  %><img src="images/photo.gif" width="200" height="150"><%}%></div>
    </td>
    <td width="243" valign="top" bgcolor="#EEF3F9"> 
      <table width="240" border="0" cellpadding="2" cellspacing="2">
        <tr> 
          <td><span class="bt"><b><%=name%>(<%=nick%>)</b></span></td>
        </tr>
        <tr> 
          <td><FONT COLOR=FF9900>��</FONT>�ϴν�վʱ�䣺<font color="#ff0000">
		  <%
		  Cookie theCookie = null;
          Cookie cookieList[] = request.getCookies();
		  if (cookieList.length!=0) {
          for (int i=0;i<cookieList.length;i++) {
            theCookie = cookieList[i];
	        if (theCookie.getName().equals("cookielogintime")) {
            out.println(theCookie.getValue()); 
	        }
          }
          }
		  %>
		  </font></td>
        </tr>
        <tr> 
          <td><FONT COLOR=FF9900>��</FONT>���а����ľ���ֵ�� <font color="#FF0000"><%=exp%></font> (<%=jibie%>)</td>
        </tr>
        <tr> 
          <td><FONT COLOR=FF9900>��</FONT>����ֵ��<font color="#FF0000"><%=power%>/<%=hpower%></font></td>
        </tr>
        <tr> 
          <td><FONT COLOR=FF9900>��</FONT>��ֽ��������<a href="guestbook.jsp"><B><%=wnote%></B>/<B><%=znote%></B></a>������</td>
        </tr>
        <tr> 
          <td><FONT COLOR=FF9900>��</FONT>�����ѣ�����<a href="friendonline.jsp"><B><%=friendonlie%></B></a>/<a href="friend.jsp"><B><%=myfriend%></B></a>��������</td>
        </tr>
        <tr> 
          <td><FONT COLOR=FF9900>��</FONT>����������<a href="list.jsp"><B><%=numonline%></B></a> ��</td>
        </tr>
      </table>
    </td>
    <td rowspan="2" valign="top" width="165"> 
      
    </td>
  </tr>
  <tr> 
    <td width="207" valign="top" bgcolor="#EEF3F9"> 
      <div align="center"><a href="changepasswd.jsp"><img src="images/passwd.gif" width="34" height="22" border="0" title="�޸�����"></a> 
        <a href="mydata.jsp"><img src="images/pinfo.gif" width="34" height="22" border="0" title="����˵��"></a> <a href="friend.jsp"><img src="images/friends.gif" width="34" height="22" border="0" title="��������"></a> 
        <a href="sign.jsp"><img src="images/sig.gif" width="34" height="22" border="0" title="����ǩ��"></a> <a href="guestbook.jsp"><img src="images/pnote.gif" width="34" height="22" border="0" title="���Թ���"></a></div>
    </td>
    <td width="243" valign="middle" bgcolor="#EEF3F9"><font color="#FF0000">С���飺</font></td>
  </tr>
</table>

<table width="615" border="0" cellpadding="1" cellspacing="1" align="center">
  <tr>
    <td width="445" height="3"></td>
    <td width="163" height="3"></td>
  </tr>
  <tr bgcolor="#355397"> 
    <td width="445" height="20"><b><font color="#FFFFFF"><span class="bt">����������<span></font></b></td>
    <td width="163" height="20"><b><font color="#FFFFFF"><span class="bt">��������</span></font></b></td>
  </tr>
  <tr bgcolor="#E1EAF4"> 
    <td width="445" valign="top"> 
      <!-- ���������� -->
    
	<!-- ���������� -->
	</td>
    <td width="163" valign="top" bgcolor="#EEF3F9"></td>
  </tr>
</table>
<table width="615" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr> 
    <td width="446" height="3"></td>
    <td width="162" height="3"></td>
  </tr>
  <tr> 
    <td width="446" bgcolor="#355397" height="22"><b><font color="#FFFFFF"><span class="bt">�ȵ㻰��</span></font></b></td>
    <td width="162" bgcolor="#355397" height="22"><b><font color="#FFFFFF"><span class="bt">�������а�</span></font></b></td>
  </tr>
  <tr> 
    <td width="446"> 
      <table width="100%" border="0" cellpadding="1" cellspacing="1">
	  <%
	  sql = "select id2,board,title,time,click from forum  where (UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(time))<=604800 and new=1 order by click desc limit 0,10";
	  rs = InBean.executeQuery(sql);
	  int i=1;
      int n=2;
	  while (rs.next()) {
	  %>
     <tr> 
          <td bgcolor="<% if ((i %= n)==1) {out.print("#EEF3F9");} else { out.print("#E1EAF4");}%>"><a href="showdoc.jsp?bid=<%out.print(rs.getString("board"));%>&recid=<%out.print(rs.getString("id2"));%>&pages=1"><span class="bt"><%out.print(rs.getString("title"));%></span></a><font color="#FF0000"> [���<%out.print(rs.getInt("click"));%>��  ������<%out.print(rs.getString("time"));%>]</font></td>
        </tr>
	  <%
	  i++;
	  }
	  rs.close();
	  %>
</table>
    </td>
    <td width="162" valign="top" bgcolor="#EEF3F9">
	<table width="100%" border="0" cellpadding="1" cellspacing="1">
	  <%
	  sql = "select user.name,user.nick,userdata.UID,userdata.exp from user,userdata where user.ID=userdata.UID order by userdata.exp desc limit 0,10";
	  rs = InBean.executeQuery(sql);
	  i=1;
      n=2;
	  while (rs.next()) {
	  %>
     <tr> 
          <td bgcolor="<% if ((i %= n)==1) {out.print("#EEF3F9");} else { out.print("#E1EAF4");}%>"><a href="userinfo.jsp?UID=<%out.print(rs.getInt("UID"));%>"><span class="bt"><%out.print(rs.getString("name"));%></span></a>[����ֵ��<%out.print(rs.getInt("exp"));%>]</td>
        </tr>
	  <%
	  i++;
	  }
	  rs.close();
	  %>
</table>
	</td>
  </tr>
</table>
<table width="615" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr bgcolor="#355397"> 
    <td height="21" width="202"><b><font color="#FFFFFF"><span class="bt">��������</span></font></b></td>
    <td height="21" width="241">&nbsp;</td>
    <td height="21" width="162"><b><font color="#FFFFFF"><span class="bt">��ϵ��ʽ</span></font></b></td>
  </tr>
  <tr> 
    <td width="202"  valign="top" bgcolor="#EEF3F9"></td>
    <td width="241" valign="top" bgcolor="#EEF3F9"></td>
    <td width="162"  valign="top" bgcolor="#EEF3F9">
	�������ģ�<BR><a href="mailto:webmaster@loveroom.com.cn">webmaster@loveroom.com.cn</a><br>
	����֧�֣�<BR><a href="mailto:tech@loveroom.com.cn">tech@loveroom.com.cn</a><br>
	������ۣ�<BR><a href="mailto:sales@loveroom.com.cn">sales@loveroom.com.cn</a><br>
	����վ����SYSOP����<BR><a href="mailto:laoer@loveroom.com.cn">laoer@loveroom.com.cn</a><BR>
	OICQ��701255<BR>
	ICQ��13490643
	</td>
  </tr>
</table>
<hr width="615">
<div align="center"><br>
  Copyright &copy; loveroom.com.cn<br>
  <a href="mailto:webmaster@loveroom.com.cn">webmaster@loveroom.com.cn</a><BR>
  ������ߣ������� ��QQ��701255��
</body>
</html>
<%
  InBean.close();
}
else {
  out.println("����");
}
%>