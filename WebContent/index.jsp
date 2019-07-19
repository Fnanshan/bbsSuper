<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="adminOperation.adminOperationSubject" %>
<%@ page import="bean.Board" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>			


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
     <head>
     <meta charset="UTF-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>BBS论坛首页</title>
     <link rel="shortcut icon" href="images/favicon.png" />
     <link rel="stylesheet" href="style.css"/>
     <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap.css?ver=1.0' type='text/css' media='all' />
     <link rel='stylesheet' id='responsive-css-css'  href='css/responsive.css?ver=1.0' type='text/css' media='all' />
     <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
     <link rel='stylesheet' id='main-css-css'  href='css/main.css?ver=1.0' type='text/css' media='all' />
     <link rel='stylesheet' id='custom-css-css'  href='css/custom.html?ver=1.0' type='text/css' media='all' />
     </head>

  <%
	String id=null;
	String username=null;
	//id = (String) session.getAttribute("id");
	username = (String) session.getAttribute("username");
	
	if ( username == "fss") {
%>		<script type="text/javascript">
			alert("You are admin！");
		</script>
<%	}else{
	}
%>
       <body>
       <div class="header-wrapper">
       <header>
       <div class="container">
       <div class="logo-container">
   
       <a href="index.jsp">
       <img src="images/logo.png">
       </a>
       <a href="adminLogin.jsp">管理员登陆</a>
       </div>
       
       <nav class="main-nav">
       <div class="menu-top-menu-container">
       <ul id="menu-top-menu" class="clearfix"> 
       
       		<c:if var="result" test="${empty sessionScope.username}">
       			<li><a href="login.jsp">登陆</a></li>
     			 <li><a href="register.jsp">注册</a></li>
     		</c:if>
       		<c:if test="${!result}">
       			welcome：【${sessionScope.username }】【<a href="recordUserState_exit.jsp">Exit</a>】
       		
       		</c:if>
       		
       			 
       <li><a href="#">更多</a>
       <ul class="sub-menu">
       <li><a href="#">11111111</a></li>
       <li><a href="#">22222222</a></li>
       <li><a href="#">33333333</a></li>
       </ul>
       </li>
       
       <li><a href="#">然后</a>
       <ul class="sub-menu">
       <li><a href="#">4444444</a></li>
       <li><a href="#">5555555</a></li>
       <li><a href="#">6666666</a></li>
       </ul>
       </li>
       
       <li><a href="#">背景色</a>
       <ul class="sub-menu">
       <li><a href="blue-shouye.html">蓝色</a></li>
       <li><a href="green-shouye.html">绿色</a></li> 
       <li><a href="red-shouye.html">红色</a></li>
       </ul>
       </li>
       <!-- 表头 --> 
       </ul>
       </div>
       </nav> 
       </div>
       </header>
       </div>
       </div>
       
       <div class="search-area-wrapper">
       <div class="search-area container">
       <h3 class="search-header">工大BBS</h3>
       <p class="search-tag-line">BBS欢迎你!</p>
       <form id="search-form" class="search-form clearfix" method="get" action="#" autocomplete="off">
       <input class="search-term required" type="text" id="s" name="s" placeholder="请输入搜索内容" title="* 请输入要搜索的内容!" />
       <input class="search-btn" type="submit" value="搜索" />
       <div id="search-error-container"></div>
       </form>
       </div>
       </div>
                <div class="page-container">
                <div class="container">
                <div class="row">
                <div class="span8 page-content">
                <div class="row separator">
                <section class="span4 articles-list">
                 
                 <%
                 	int number = 0;
                 	
                 	if(application.getAttribute("number")==null){
                 		number = 1;
                 	}else{
                 		//
                 		number = Integer.parseInt(application.getAttribute("number").toString());
                 		number = number + 1;
                 	}
                 	out.print("您是第" + number + "位访问者");
                 	//
                 	//Object numberObject = number;
                 	Integer numberInteger = new Integer(number);  
                 	application.setAttribute("number",numberInteger);
                  %>      
                       
                       
                <h3>
                <%
                	Board board = new Board();
                %>
                <c:if var="result" test="${empty sessionScope.boardnameJava}">
                	<li>Java入门学习</li>
                </c:if>
                <c:if test="${!result}">
                	<%=session.getAttribute("boardnameJava") %>
                </c:if>
                </h3> 
                
				<!--To judge whether the object is empty -->    
				<c:if var="result" test="${empty sessionScope.usertype}">
     			</c:if>
       			<c:if test="${!result}">
       				<h4 align="right"><a href="updateSubjectJava.jsp">修改</a><a href="#">删除</a></h4>	
 	      		</c:if>
 	      		
                 
                 
                <ul class="articles"> 
                <li class="article-entry standard">
                <h4><a href="#">帖子1 </a></h4>
                <span class="article-meta">4月5日。2013 .<a href="#" title="View all posts in Website Dev"></a></span>
                <span class="like-count">95</span>
                </li>
                                
                <li class="article-entry standard">
                <h4><a href="#">帖子2 </a></h4>
                <span class="article-meta">3月6日。2013 .<a href="#" title="View all posts in Website Dev"></a></span>
                <span class="like-count">15</span></li>
                <a href="gengduotiezi.html">更多</a>
                </ul>
                </section>
                <section class="span4 articles-list">
                <br></br>
                
                
                 <h3>
                <c:if var="result" test="${empty sessionScope.boardnameSpring}">
                	<li>Spring入门学习</li>
                </c:if>
                <c:if test="${!result}">
                	<%=session.getAttribute("boardnameSpring") %>
                </c:if>
                </h3> 
                
                
               <!--To judge whether the object is empty -->    
				<c:if var="result" test="${empty sessionScope.usertype}">
     			</c:if>
       			<c:if test="${!result}">
       				<h4 align="right"><a href="updateSubjectSpring.jsp">修改</a> <a href="#">删除</a></h4>	
 	      		</c:if>
                
                <ul class="articles"> 
                <li class="article-entry standard">
                <h4><a href="#">帖子3 </a></h4>
                <span class="article-meta">4月15日。2013 .<a href="#" title="View all posts in Website Dev"></a></span>
                <span class="like-count">9</span>
                </li>
                
                <li class="article-entry standard">
                <h4><a href="#">帖子4 </a></h4>
                <span class="article-meta">9月6日。2013 .<a href="#" title="View all posts in Website Dev"></a></span>
                <span class="like-count">12</span></li>
                </ul>
                <a href="gengduotiezi.html">更多</a>
                </section>
                <section class="span4 articles-list">
                
                 <h3>
                <c:if var="result" test="${empty sessionScope.boardnameNet}">
                	<li>.Net入门学习</li>
                </c:if>
                <c:if test="${!result}">
                	<%=session.getAttribute("boardnameNet") %>
                </c:if>
                </h3> 
                
                <!--To judge whether the object is empty -->    
				<c:if var="result" test="${empty sessionScope.usertype}">
     			</c:if>
       			<c:if test="${!result}">
       				<h4 align="right"><a href="updateSubjectNet.jsp">修改</a> <a href="#">删除</a></h4>	
 	      		</c:if>
                
                <ul class="articles"> 
                <li class="article-entry standard">
                <h4><a href="#">帖子5 </a></h4>
                <span class="article-meta">4月2日。2013 .<a href="#" title="View all posts in Website Dev"></a></span>
                <span class="like-count">55</span>
                </li>
                
                <li class="article-entry standard">
                <h4><a href="#">帖子6 </a></h4>
                <span class="article-meta">3月2日。2013 .<a href="#" title="View all posts in Website Dev"></a></span>
                <span class="like-count">16</span></li>
                </ul>
                <a href="gengduotiezi.html">更多</a>
                </section>
                <section class="span4 articles-list">
                
                <h3>
                <c:if var="result" test="${empty sessionScope.boardnameStrus}">
                	<li>Strus入门学习</li>
                </c:if>
                <c:if test="${!result}">
                	<%=session.getAttribute("boardnameStrus") %>
                </c:if>
                </h3> 
                
                <!--To judge whether the object is empty -->    
				<c:if var="result" test="${empty sessionScope.usertype}">
     			</c:if>
       			<c:if test="${!result}">
       				<h4 align="right"><a href="updateSubjectStrus.jsp">修改</a> <a href="#">删除</a></h4>	
 	      		</c:if>
                
                <ul class="articles">
                <li class="article-entry standard">
                <h4><a href="#">帖子7</a></h4>
                <span class="article-meta">3月2日。2013 .<a href="#" title="View all posts in Server &amp; Database"></a></span>
                <span class="like-count">66</span>
                </li>
                <li class="article-entry standard">
                <h4><a href="#">帖子8</a></h4>
                <span class="article-meta">8月5日。2013.<a href="#" title="View all posts in Advanced Techniques"></a></span>
                <span class="like-count">18</span></li>
                </ul>
                <a href="gengduotiezi.html">更多</a>
                </section>
                <section class="span4 articles-list">
                
                </div>
                </div>
                <aside class="span4 page-sidebar">
                
                <section class="widget">
                
                <div class="support-widget">
                <h3 class="title">帮助</h3>
                <p class="intro">需要帮助，在此输入</p> 
                </div>
                </section>
                
                <section class="widget">
                <div class="quick-links-widget">
                <h3 class="title">快速链接</h3>
                <ul id="menu-quick-links" class="menu clearfix">
                <li><a href="posting.jsp">posting</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                </ul>
                </div>
                </section>
                <section class="widget">
                <h3 class="title">热词</h3>
                <div class="tagcloud">
                <a href="#" class="btn btn-mini">JSP</a>
                <a href="#" class="btn btn-mini">Oracal</a>
                <a href="#" class="btn btn-mini">云数据库</a>
                    
                </div>
                </section>
                </aside>
                
                </div>
                </div>
                </div>
            
                <footer id="footer-wrapper">
                <div id="footer" class="container">
                <div class="row">
                <div class="span3">
                <section class="widget">
                <h3 class="title">&nbsp;</h3>
                </section>
                </div>
                <div class="span3">
                  <section class="widget"> </section>
                </div>

                </div>
                </div>
                <div id="footer-bottom-wrapper">
                <div id="footer-bottom" class="container">
                <div class="row">
                <div class="span6">
                <p class="copyright">bbs论坛 powerRight by CCUTSOFT</p>
                <p class="copyright"> All Right Reserved .Version 1.0 beta</p>
                </div>
                <div class="span6">
                <ul class="social-nav clearfix">
                <li class="linkedin"><a target="_blank" href="#"></a></li>
                <li class="stumble"><a target="_blank" href="#"></a></li>
                <li class="google"><a target="_blank" href="#"></a></li>
                <li class="deviantart"><a target="_blank" href="#"></a></li>
                <li class="flickr"><a target="_blank" href="#"></a></li>
                <li class="skype"><a target="_blank" href="skype:#?call"></a></li>
                <li class="rss"><a target="_blank" href="#"></a></li>
                <li class="twitter"><a target="_blank" href="#"></a></li>
                <li class="facebook"><a target="_blank" href="#"></a></li>
                </ul>
                </div>
                </div>
                </div>
                </div>
                </footer>
               
               <!-- 一大堆图标 -->
                <a href="#top" id="scroll-top"></a>
        <script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
        <script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
        <script type='text/javascript' src='js/prettyphoto/jquery.prettyPhoto.js'></script>
        <script type='text/javascript' src='js/jflickrfeed.js'></script>
		<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
        <script type='text/javascript' src='js/jquery.form.js'></script>
        <script type='text/javascript' src='js/jquery.validate.min.js'></script>
        <script type='text/javascript' src='js/custom.js'></script>

        </body>
</html>
