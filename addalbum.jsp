<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="photoshare.NewAlbumDao" %>
<%@ page import="photoshare.NewUserDao" %>
<html>
<head><title>Adding New Album</title></head>

<body>
	<%
	String err = null;
	String name = request.getParameter("name");
	int user_id = -1;
	if (name.equals("")){
		err = "You must name your album";
	}
	else {
		NewUserDao newUserDao = new NewUserDao();
		user_id = newUserDao.getUserId(request.getUserPrincipal().getName());
		NewAlbumDao newAlbumDao = new NewAlbumDao();
		boolean success = newAlbumDao.create(name, user_id);
		if(success) {
		err = "We are sorry. There has been a problem creating your album.";
		}
	} %>
<% if (err == null){ %>

<h2>Congrats!</h2>

<p>A new album <%= name %>has been created.
Go back to your<a href="index.jsp">Home Page</a>.
Or 
Stay to this album's page to add pictures</p>
<% }
   else { %>
   <font color=red><b>Error: <%= err %></b></font>
   <p> <a href="index.jsp">Home</a> </p>
	
<% } %>