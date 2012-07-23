<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*, com.google.gson.reflect.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="edu.nyu.cc.*" %>
<%@ page import="java.net.URLDecoder"%>
<html>
    <head><title>Rewards</title></head>
    <body>
        <h1>Reward List</h1>
		<table width="70%" border=1 cellpadding=2 cellspacing=1>
		   <tr><th>ID</th><th>Title</th><th>Minimum Amount</th><th>Action</th></tr>
<%
    String uri = URLDecoder.decode(request.getParameter("url").trim());
    Gson gson = new Gson();
    Type type = new TypeToken<ArrayList<Reward>>() {}.getType();
    ArrayList<Reward> rewards = gson.fromJson(UrlTool.readUrlUsingGet(uri + "/campaigns/a-new-way-of-fundraising.json"), type);

    Iterator<Reward> ui = rewards.iterator();
    while(ui.hasNext()) {
      Reward u = ui.next();
%>
           <tr>
               <td><%= u.id %></td><td><%= u.title %></td><td><%= u.minimum_amount %></td>
               <td>
                    <a href="modifyReward.jsp?id=<%= u.id %>&u=<%= uri %>">Modify</a>
                    <a href="deleteReward.jsp?id=<%= u.id %>&u=<%= uri %>">Delete</a>
               </td>
          </tr>
<%  } %>
        </table>
    </body>
</html>
