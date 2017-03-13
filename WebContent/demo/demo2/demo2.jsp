<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>看最近浏览记录功能</title>
</head>
<body>
	<h4>书籍列表</h4>
	<a href="book.jsp?bookName=JavaWeb">JavaWeb</a>
	<a href="book.jsp?bookName=ASP.NET">ASP.NET</a>
	<a href="book.jsp?bookName=Java">Java</a>
	<a href="book.jsp?bookName=PHP">PHP</a>
	<a href="book.jsp?bookName=Mysql">Mysql</a>
	<a href="book.jsp?bookName=C">C</a>
	<a href="book.jsp?bookName=MongoDB">MongoDB</a>
	<a href="book.jsp?bookName=Python">Python</a>
	<a href="book.jsp?bookName=Linux">Linux</a>
	<a href="book.jsp?bookName=Hadoop">Hadoop</a>
	<h5>最近浏览记录</h5>
	
	<%
		final String cookieFinalName = "tommyyangcn"; 
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0){
			for(Cookie cookie : cookies){
				if(cookie.getName().startsWith(cookieFinalName)){	
					out.print(cookie.getValue()+"<br/>");
				}
			}
		}
	%>
	
</body>
</html>