<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Let's read data!!</title>
</head>
<body>
    <div id="introudction">
	    <ul>
		    <li>In the RESTful world's point of view, everything is a resource.</li>
		    <li>For example,
		        <ul>
		            <li>Money impact graph of user jin-young</li>
		            <li>List of donor who are inspired by user bo</li> 
		        </ul>
		    </li>
		    <li>These things can be designated by URI.</li>
		    <li>For example,
                <ul>
                    <li>/users/jin-young/impcat/money/graph/2012/07.json - July 2017's money impact graph json data of user jin-young</li>
                    <li>/users/bo/donations.xml - all donation list with xml format of user bo</li>
                </ul>
            </li>
	    </ul>
	    <ul>
		    <li>We can deal with the resources via HTTP protocol and method. </li>
		    <li>To deal with them, we're going to use below four methods:
		        <table border=1 cellpadding=1>
		            <tr><td>Method</td><td>Purpose</td></tr>
		            <tr><td>GET</td><td>Retrieving data</td></tr>
		            <tr><td>POST</td><td>Creating new data</td></tr> 
		            <tr><td>PUT</td><td>Modifying data</td></tr> 
		            <tr><td>DELETE</td><td>Deleting data</td></tr>  
		        </table>
		    </li>
		</ul>
		<ul>
		  <li>I'm going to show you examples of RESTful program with these JSPs and iGiveMore service</li>
		  <li>To do it, we need to do some pre-configurations:
		      <ol type=1>
	              <li>Pull newest source from github: I modified some code to use</li>
		          <li>Generating test data: it's easy if you already run the test data generation ruby code</li>
		          <li>Start your Ruby on Rails server in iGiveMore application root directory as you did</li>
		          <li>Turn off user authentication to make example simple:
		              <ul>
		                  <li>Comment out below line in app/controllers/users_controller.rb:<br/>
		                  &nbsp;&nbsp;&nbsp;&nbsp;before_filter :require_current_user, :only =&gt; [:show, :edit, :update, :impact_money_graph, :impact_recruits_graph]</li>
		                  <li>Test you can access data without login using a tool such as curl by run:<br/>
		                  &nbsp;&nbsp;&nbsp;&nbsp;curl http://lvh.me:3000/users/jinyoung-heo/impact/recruits.json</li>
		                  <li>If you can see returned JSON data, everything is going to being fine :)</li>
		              </ul>
		          </li>
		          <li>We will use JSON format, thus we need a library such as GSON. You can find it in WebContent/WEB-INF/lib</li>
		      </ol>
		  </li>
		</ul>
    </div>
    <div id="letsRoll">
        <ul>
            <li>Get data using Java code. Of course, you can do it with Javascript (actually, we already did it when we create the impcat graph.) 
                Do you remember root user's email of your test data? Don't worry about it if you don't remeber it. Check this 
                <a href="userlist.jsp">list</a> first.
                <!-- Normal HTML anchor is also involved to HTTP get method -->
            </li>
        </ul>
    </div>
</body>
</html>