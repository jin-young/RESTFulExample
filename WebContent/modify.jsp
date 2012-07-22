<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*, com.google.gson.reflect.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="edu.nyu.cc.*" %>
<%
    String userLink =  request.getParameter("pl");
    String userName =  request.getParameter("n");
    String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/userlist.jsp";
%>
<html>
    <head><title>Modify User Information</title></head>
    <body>
        <h1>Information of <%= userName %></h1>
        <ul>
            <li>When we need modify resource, usually we use HTML form and use put method.</li>
            <li>Again, not POST, but PUT.</li>
            <li>Honestly, RESTful is not a standard and technology, thus there is no strict rule which user always uses put method for modifying resource</li>
            <li>However, in the point of view which HTTP methods work as a verb, using suitable HTTP method is similar with using collect grammar<br><br>
                <ul>
                    <li>First of all, we get data from iGiveMore with: ,<br><br>
                    &nbsp;&nbsp;&nbsp;http://lvh.me:3000/users/<%= userLink %>.json<br><br>
                    Then filled below HTML form<br><br></li>
                    <li>Second, we put two special hidden field in the form. One is for specifying HTTP method to deal with browser supporting issue
                     and another one is return URL.<br><br>
                    &nbsp;&nbsp;&nbsp;<%=returnUrl %><br><Br>
                    The reason that we need return URL is we're sending data to remote service and we need to get back control after processing data.<br>
                    If we use AJAX instead of standard HTML form way to interact with resource, in most case, <br>
                    we do not need return URL because we still have page flow control.<br><br>
                    </li>
                    <li>Finally, the target URL is: ,<br><br>
                    &nbsp;&nbsp;&nbsp;http://lvh.me:3000/users/<%= userLink %>.json<br><br>
                    Can you see the URL is exactly same as the URL when we used to get data? This is RESTful.<br>
                    When we deal with a resource, we just need to change method(verb) when necessary action is changed. <br>
                    The target's name(URI) is not needed to be changed.
                    </li>
                </ul>
           </li>
       </ul>
<%
    Gson gson = new Gson();
    Type t = new TypeToken<User>() {}.getType();
    User u = gson.fromJson(UrlTool.readUrlUsingGet("http://lvh.me:3000/users/" + userLink + ".json"), t);
%>
        <form action="http://lvh.me:3000/users/<%= userLink %>.json" method="post">
            <input type="hidden" name="_method" id="_method" value="put"/>
            <input type="hidden" name="return_url" id="return_url" value="<%= returnUrl %>"/>
            <table border=1 cellpadding=1>
                <tr><td>Name*</td><td><%= u.name %></td></tr>
                <tr><td>Email*</td><td><%= u.email %></td></tr>
                <tr>
                    <td>Company</td>
                    <td><input type="text" name="user[company]" id="user[company]" size="30" value="<%= u.company == null ? "" : u.company %>"/></td>
                </tr>
                <tr><td>Nick Name*</td><td><%= u.nickname == null ? "" : u.nickname  %></td></tr>
                <tr>
                    <td>Profile Picture URL*</td>
                    <td><%= u.profile_pic_url == null? "" : u.profile_pic_url %></td>
                </tr>
            </table>
            <input type="submit" value="Modify it!"/>
        </form>
        * iGiveMore does not allow user change Name, Email, Nick Name and Profile Picture URL
    </body>
</html>
