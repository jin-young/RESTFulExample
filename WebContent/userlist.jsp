<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*, com.google.gson.reflect.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="edu.nyu.cc.*" %>
<%
    String email =  request.getParameter("email");
    Gson gson = new Gson();
    Type t = new TypeToken<ArrayList<User>>() {}.getType();
    ArrayList<User> users = gson.fromJson(UrlTool.readUrlUsingGet("http://lvh.me:3000/users.json?mw=alfnaafdkfndenfjndfuenfudknfladfdsfoanfaofnanflenflenl"), t);
    Iterator<User> ui = users.iterator();
%>
<html>
    <head><title>Users</title></head>
    <body>
        <h1>Uesr List (only disply first 10 users)</h1>
		<table width="50%" border=1 cellpadding=2 cellspacing=1>
		   <tr><th>Name</th><th>email</th><th>Recruited Users</th></tr>
		<%
		    while(ui.hasNext()) {
		       User u = ui.next();
		%>
	           <tr>
	               <td><%= u.name %></td><td><%= u.email %></td>
	               <!-- Normal HTML anchor is also involved to HTTP get method -->
	               <td><a href="./readRecruits.jsp?n=<%=u.name %>&pl=<%= u.permalink %>">See</a></td>
               </tr>
		<%  } %>
        </table>
    </body>
</html>
