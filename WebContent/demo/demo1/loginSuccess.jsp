<%@page import="java.util.Date"%>
<%@page import="org.apache.tomcat.util.http.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginSuccess</title>
</head>
<body>
	<%
		//正常登录进入该页面，name是存在的
		String name = request.getParameter("name");
		String check = request.getParameter("checked");
		if(name == null || name.equals("")){
			//判断cookie存不存在
			Cookie[] cookies = request.getCookies();
			if(cookies != null && cookies.length > 0){
				for(Cookie cookie : cookies){
					String cookieName = cookie.getName();
					if(cookieName.equalsIgnoreCase("demoname")){
						name = cookie.getValue();
						break;
					}
				}	
			}
			//不存在说明cookie过期或者非法访问，否则输出正确内容
			if(name == null || name.equals("")){
				response.sendRedirect("demo1.jsp");	
			}
			else{
				Cookie cookie = new Cookie("demoname",name);
				cookie.setMaxAge(60);
				response.addCookie(cookie);//设置持久化cookie，存储在磁盘中
				out.println("hello " + name + "\n");
				Date date = new Date();
				out.println(System.currentTimeMillis());
			}
		}else{
			if(check != null && check.equalsIgnoreCase("on")){
				Cookie cookie = new Cookie("demoname",name);
				cookie.setMaxAge(60);//设置持久化cookie
				response.addCookie(cookie);
			}
			out.println("hello " + name + "\n");
			out.println(System.currentTimeMillis());
		}
	%>
</body>
</html>