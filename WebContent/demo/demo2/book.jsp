<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book 页面</title>
</head>
<body>
	<%
	    final String cookieFinalName = "tommyyangcn"; 
		//使用List(队列机制)存储cookie，第一个是访问时间最久的
	    List<Cookie> bookList = new ArrayList<Cookie>();
		String bookName = request.getParameter("bookName");
		out.print("欢迎在线观看：" + bookName);
		Cookie[] cookies = request.getCookies();
		Cookie tempCookie = null;
		if(cookies != null && cookies.length > 0){
			for(Cookie cookie : cookies){		
				String thisCookieName = cookie.getName();
				if(thisCookieName.equals(cookieFinalName + bookName)){
					//删除当前cookie，后面重新插入
					bookList.remove(cookie);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		//当前cookie插入队列
		Cookie cookie = new Cookie(cookieFinalName + bookName, bookName);
		bookList.add(cookie);
		if(bookList.size() > 5){
			bookList.remove(0);
		}
		for(int i = bookList.size() - 1; i >= 0; i--){
			response.addCookie(bookList.get(i));	
		}
	%>
	<a href = "demo2.jsp">返回书籍列表页面</a>
</body>
</html>