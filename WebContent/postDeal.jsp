<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="bbs" class="bean.Bbs" scope="request">
	<jsp:setProperty name="bbs" property="username"/>
	<jsp:setProperty name="bbs" property="bbstitle"/>
	<jsp:setProperty name="bbs" property="bbscontent"/>
</jsp:useBean>

<jsp:forward page="replyPostCondition.jsp"/>