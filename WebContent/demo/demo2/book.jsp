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
		//把书的信息以 Cookie 方式传回给浏览器，删除一个 Cookie
        //1. 确定要被删除的 Cookie： tommyyangcn开头的 Cookie数量大于或等于 5，
        //且若从 books.jsp 页面传入的 book不在 tommyyangcn开头的 Cookie集合中则删除较早的那个 Cookie(tommyyangcn开头的Cookie集合的第一个 Cbookie)，若在其中，则删除该 Cookie
        //2. 把从 books.jsp 传入的 book 作为一个 Cookie 返回

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
				//填充cookie的存储空间
				if(thisCookieName.startsWith(cookieFinalName)){
					bookList.add(cookie);
				}
				//看当前书籍是否在cookie数组中
				if(cookie.getValue().equals(bookName)){
					tempCookie = cookie;	
				}
			}
		}
		//说明当前书籍不在cookie数组中，则将当前书籍加入最近浏览的cookie数组中，同时删除访问时间最久的书籍，对于list集合来说，即第一个
		if(tempCookie == null && bookList.size() > 0){
			tempCookie = bookList.get(0);
		}
		//tommyyangcn开头的 Cookie数量大于或等于 5，删除需要删除的那个cookie，即tempCookie
		if(bookList.size() >= 5 && tempCookie != null){
			tempCookie.setMaxAge(0);
			response.addCookie(tempCookie);
		}
		
		Cookie cookie = new Cookie(cookieFinalName + bookName, bookName);
		response.addCookie(cookie);
	%>
	<a href = "demo2.jsp">返回书籍列表页面</a>
</body>
</html>