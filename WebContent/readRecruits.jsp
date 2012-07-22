<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*, com.google.gson.reflect.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="edu.nyu.cc.*" %>
<%
    String userLink =  request.getParameter("pl");
    String userName =  request.getParameter("n");
    Gson gson = new Gson();
    Type t = new TypeToken<ArrayList<Recruit>>() {}.getType();
    ArrayList<Recruit> recruits = gson.fromJson(UrlTool.readUrlUsingGet("http://lvh.me:3000/users/" + userLink + "/recruits.json"), t);
    Iterator<Recruit> ri = recruits.iterator();
%>
<html>
    <head><title>Users</title></head>
    <body>
        <h1>All recruited users by <%= userName %></h1>
        <table width="50%" border=1 cellpadding=2 cellspacing=1>
           <tr><th>Name</th><th>email</th><th>Given</th><th>Inspired Donations</th><th>Num of Recruits</th></tr>
        <%
            while(ri.hasNext()) {
               Recruit r = ri.next();
        %>
               <tr>
                   <td><%= r.name %></td>
                   <td><%= r.email %></td>
                   <td><%= r.given %></td>
                   <td><%= r.inspired_donations %></td>
                   <td><%= r.num_of_recruits %></td>
               </tr>
        <%  } %>
        </table>
    </body>
</html>
