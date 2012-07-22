<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*, com.google.gson.reflect.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="edu.nyu.cc.*" %>
<%
    String userLink =  request.getParameter("pl");
    String userName =  request.getParameter("n");
%>
<html>
    <head><title>Recruited</title></head>
    <body>
        <h1>All recruited users by <%= userName %></h1>
        <ul>
            <li>As I mentioned in the previous page, we got below data via HTTP get method and used structured URI to get data belongs to higher resource</li>
            <li>
                In iGiveMore system, there could be zero or more number of users who were inspired by one user. 
            </li> 
            <li>
                We defined the users as igivemore.org/users/[:user_id]/recruits. For example, as you can see in below table,<br><br>
                &nbsp;&nbsp;&nbsp;http://lvh.me:3000/users/<%= userLink %>/recruits.json<br><br>
                returned recruited users list:                
            </li>
        </ul>
        <table width="50%" border=1 cellpadding=2 cellspacing=1>
           <tr><th>Name</th><th>email</th><th>Given</th><th>Inspired Donations</th><th>Num of Recruits</th></tr>
<%
    Gson gson = new Gson();
    Type t = new TypeToken<ArrayList<Recruit>>() {}.getType();
    ArrayList<Recruit> recruits = gson.fromJson(UrlTool.readUrlUsingGet("http://lvh.me:3000/users/" + userLink + "/recruits.json"), t);
    Iterator<Recruit> ri = recruits.iterator();
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
        <ul>
            <li>Of course, service consumer does not need to follow the URI and HTTP method strategy.</li>
            <li>Let's go back to 
                <a href="userlist.jsp">User list page</a> and play with other HTTP method such as POST and PUT</li>
        </ul>
    </body>
</html>
