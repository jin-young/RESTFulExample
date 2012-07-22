<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*, com.google.gson.reflect.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="edu.nyu.cc.*" %>
<html>
    <head><title>Users</title></head>
    <body>
        <h1>User List (only display last 10 users)</h1>
        <ul>
            <li>Below data is read from iGiveMore(local) service using HTTP Get method</li>
            <li>Server returned data as JSON format. To tell the truth, any format is acceptable.</li>
            <li>Accessing resource always use URI. Thus, well structured resource hierarchy makes life easier</li> 
            <li>For example in iGiveMore
                <ul>
                    <li>User
                        <ul>
                            <li>donations</li>
                            <li>inspired donations</li>
                            <li>recruited users</li>
                        </ul>
                    </li>
                    <li>Campaign
                        <ul>
                            <li>donations</li>
                            <li>fundraisers (members)</li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                In common sense, "igivemore.org/users" means list of users in igivemore.org
            </li>
            <li>
                In other words, "igivemore.org/users/jinyoung.heo" means information of a resource identified by "jinyoung.heo"
            </li>
            <li>
                Please, refer source code of this userlist.jsp file. We asked server to get user list via "http://lvh.me:3000/users.json".
            </li>
        </ul>
		<table width="70%" border=1 cellpadding=2 cellspacing=1>
		   <tr><th>Name</th><th>email</th><th>Recruited</th><th>Action</th></tr>
<%
    //ignore mw value in uri. It does not have any meaning.
    String uri = "http://lvh.me:3000/users.json?mw=alfnaafdkfndenfjndfuenfudknfladfdsfoanfaofnanflenflenl";
    Gson gson = new Gson();
    Type type = new TypeToken<ArrayList<User>>() {}.getType();
    ArrayList<User> users = gson.fromJson(UrlTool.readUrlUsingGet(uri), type);

    Iterator<User> ui = users.iterator();
    while(ui.hasNext()) {
       User u = ui.next();
%>
           <tr>
               <td><%= u.name %></td><td><%= u.email %></td>
               <!-- Normal HTML anchor is also involved to HTTP get method -->
               <td><a href="./readRecruits.jsp?n=<%=u.name %>&pl=<%= u.permalink %>">See</a></td>
               <td>
                    <a href="modify.jsp?n=<%=u.name %>&pl=<%= u.permalink %>">Modify</a>
                    <a href="delete.jsp?n=<%=u.name %>&pl=<%= u.permalink %>">Delete</a>
               </td>
          </tr>
<%  } %>
        </table>
    </body>
</html>
