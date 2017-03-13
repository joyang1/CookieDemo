<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动登录</title>
</head>
<body>
	<h4>登录页面</h4>
	<form action="loginSuccess.jsp" method="get">
		<input type="text" name="name"></br></br>	
		<input type="checkbox" name="checked">记住60s</br></br>	
		<input type="submit" value="登录">
	</form>
</body>
</html>