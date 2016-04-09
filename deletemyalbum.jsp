<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="photoshare.AlbumDao" %>

<html>

<Head><title>Delete <%= request.getParameter("albumname")%></title></head>

<body>

<%
Int albumid = request.getParameter("albumid");
String albumName  = request.getParameter("name");
String err = null;

if (albumid >= 14) {
	NewAlbumDao newAlbumDao = new NewAlbumDao();
	boolean success = neAlbumDao.delete(albumid);
	if(!success){
	err = "We are sorry, there was a problem deleting your album.";
}
} else{
	err = "No such Album found"
}

if (err == null) { %>
<font color=red><b>Error: <%= err %></b></font>
   <p> <a href="albums.jsp">Go Back</a>
<%
}else{%>
<h2>Success!</h2>

<p><%= albumName %> has been deleted.
You can now return to the <a href="albums.jsp">album viewer</a>.

<% } %>

</body>
</html>