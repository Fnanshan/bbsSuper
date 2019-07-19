<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String id=null;
String username=null;
//id = (String) session.getAttribute("id");
username = (String) session.getAttribute("username");

if ( username != null) {
%>
<!doctype html>

     <html lang="en-US"> 
        <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>BBS登陆</title>
                <link rel="shortcut icon" href="images/favicon.png" />
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
                <link rel='stylesheet' id='main-css-css'  href='css/main.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom.html?ver=1.0' type='text/css' media='all' />
        </head>
        
        <!-- 判断用户登录 -->
		<script type="text/javascript">
        	function loginCheck(){
				if(form1.username.value == ""){
					alert("please input username!");
					form1.username.focus();
					return;
            	}
				if(form1.userpass.value == ""){
					alert("please input userpass!");
					form1.userpass.focus();
					return;
            	}
				if(form1.verificationCode.value != form1.vcode.value){
					alert("please input vcode!");
					form1.userpass.focus();
					return;
            	}
            	form1.submit();
            	}
        </script>
        
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
       
       <c:choose>
       		<c:when test="empty sessionScope.username">
       			 <li><a href="login.jsp">登陆</a></li>
     			 <li><a href="register.jsp">注册</a></li>
       		</c:when>
       		<c:otherwise>
       			<li>欢迎您！${sessionScope.username }</li>
       		</c:otherwise>
       </c:choose>
      
       
       
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
       </ul>
       </div>
       </nav>
       </div>
       </header>
     </div>        
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
        </div>
     </div>
     <div class="page-container">
       <div class="container">
        <div class="row">
        <div class="span8 page-content">
        <article class="type-page hentry clearfix">
        <h1 class="post-title">
        
        <a href="#">登陆</a>
        </h1>
        <hr>
        </article>
        <form id="form1" class="row" action="userlogin.jsp" method="post">
        <div class="span2">
        <label for="name">帐户名<span>*</span> </label>
        </div>
        <div class="span6">
        <input type="text" name="username" class="required input-xlarge" value="" title="* 请输入帐户名">
        </div>
        
        <div class="span2">
        <label for="reason">密码 <span>*</span> </label>
        </div>
        <div class="span6">
        <input type="text" name="userpass" class="input-xlarge" value="" title="* 请输入密码">
        </div>
        
        <div class="span2">
        <label for="reason">验证码 <span>*</span> </label>
        </div>
        <div class="span6">
        <input type="text" name="verificationCode" size="8" class="input-xlarge" value="" title="* 请输入验证码">
       
        
        <%
        	int intmethod = (int) ((((Math.random()) * 11)) - 1);
        	int intmethod2 = (int) ((((Math.random()) * 11)) - 1);
        	int intmethod3 = (int) ((((Math.random()) * 11)) - 1);
        	int intmethod4 = (int) ((((Math.random()) * 11)) - 1);
        	//connection
        	String intsum = intmethod + "" + intmethod2 + intmethod3 + intmethod4;
       		out.print(intsum);
        	%>
        <input type="hidden" name="vcode" value="<%=intsum %>">
        <img src="num/<%=intmethod %>.gif"><img src="num/<%=intmethod2%>.gif">
        <img src="num/<%=intmethod3%>.gif"><img src="num/<%=intmethod4%>.gif">
       </div>  
        
        <div class="span6 offset2 bm30">
        <input type="submit" name="submit" value="登陆" class="btn btn-inverse">
        <img src="images/loading.gif" id="contact-loader" alt="Loading...">
        </div>

        <div class="span6 offset2 error-container"></div>
        <div class="span8 offset2" id="message-sent"></div>
        </form>
        </div>
        <!-- end of page content -->


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
                <li><a href="posting.jsp">发帖</a></li>
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
                <!-- 右侧快捷栏 -->
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
<%
}
else {
%>	
     <html lang="en-US"> 
        <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>BBS登陆</title>
                <link rel="shortcut icon" href="images/favicon.png" />
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
                <link rel='stylesheet' id='main-css-css'  href='css/main.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom.html?ver=1.0' type='text/css' media='all' />
        </head>
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
       <li><a href="login.jsp">登陆</a></li>
       <li><a href="register.jsp">注册</a></li>
       
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
       </ul>
       </div>
       </nav>
       </div>
       </header>
     </div>        
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
        </div>
     </div>
     <div class="page-container">
       <div class="container">
        <div class="row">
        <div class="span8 page-content">
        <article class="type-page hentry clearfix">
        <h1 class="post-title">
        
        <a href="#">登陆</a>
        </h1>
        <hr>
        </article>
        <form id="form_login" class="row" action="userlogin.jsp" method="post">
        <div class="span2">
        <label for="name">帐户名<span>*</span> </label>
        </div>
        <div class="span6">
        <input type="text" name="username" class="required input-xlarge" value="" title="* 请输入帐户名">
        </div>
        
        <div class="span2">
        <label for="reason">密码 <span>*</span> </label>
        </div>
        <div class="span6">
        <input type="text" name="userpass" class="input-xlarge" value="" title="* 请输入密码">
        </div>
        
        <div class="span6 offset2 bm30">
        <input type="submit" name="submit" value="登陆" class="btn btn-inverse">
        <img src="images/loading.gif" id="contact-loader" alt="Loading...">
        </div>

        <div class="span6 offset2 error-container"></div>
        <div class="span8 offset2" id="message-sent"></div>
        </form>
        </div>
        <!-- end of page content -->


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
                <li><a href="posting.jsp">发帖</a></li>
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
                <!-- 右侧快捷栏 -->
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
<%	
}
%>        