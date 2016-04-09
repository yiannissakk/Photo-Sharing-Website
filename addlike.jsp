<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="photoshare.PictureDao" %>
<%@ page import="photoshare.AlbumDao" %>
<html>
<head><title>Add Like</title></head>

<body>

<% 
   String err = null;
   String userEmail = request.getUserPrincipal().getName();
   AlbumDao albumDao = new AlbumDao();
   int ownerID = albumDao.getOwnerID(userEmail);
   int selectedAlbumID  = Integer.valueOf(request.getParameter("albumid"));
   int picture_id = Integer.valueOf(request.getParameter("picture_id"));
   
   PictureDao pictureDao = new PictureDao();
   boolean success = pictureDao.addLike(ownerID, picture_id, selectedAlbumID);
   if (!success) {
	 err = "Couldn't add Like";
   }
%>

<% if (err != null) { %>
   <font color=red><b>Error: <%= err %></b></font>
   <p> <a href="picture.jsp?id=<%= picture_id %>&albumid=<%= selectedAlbumID%>">Go Back</a>
<% }
   else { %>

<h2>Success!</h2>
<p>You can now return to the <a href="picture.jsp?id=<%= picture_id %>&albumid=<%= selectedAlbumID%>">picture you just liked</a>!
<% } %>

</body>
</html>