<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*, com.google.gson.reflect.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.reflect.*" %>
<%@ page import="edu.nyu.cc.*" %>
<%
    String id =  request.getParameter("id");
    String url = request.getParameter("u");
    String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/rewards.jsp";
    returnUrl += "?url=" + url;
%>
<html>
    <head><title>Modify Reward Information</title></head>
    <body>
<%
    Gson gson = new Gson();
    Type t = new TypeToken<Reward>() {}.getType();
    String target = url + "/campaigns/a-new-way-of-fundraising/rewards/" + id + ".json";
    Reward u = gson.fromJson(UrlTool.readUrlUsingGet(target), t);
%>
        <form action="<%= target %>" method="post">
            <input type="hidden" name="_method" id="_method" value="put"/>
            <input type="hidden" name="return_url" id="return_url" value="<%= returnUrl %>"/>
            <input type="hidden" name="id" id="id" value="<%= id %>"/>
            <table border=1 cellpadding=1>
                <tr><td>Title</td>
                    <td><input type="text" name="reward[title]" id="reward[title]" size="30" value="<%= u.title %>"/></td>
                </tr>
                <tr>
                    <td>Minimum</td>
                    <td><input type="text" name="reward[minimum_amount]" id="reward[minimum_amount]" size="40" value="<%= u.minimum_amount %>"/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea rows="5" cols="70" id="reward[description]" name="reward[description]"><%= u.description %></textarea>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Modify it!"/>
        </form>
    </body>
</html>
