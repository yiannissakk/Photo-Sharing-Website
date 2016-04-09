<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="photoshare.NewUserDao" %>
<%@ page import="photoshare.NewCommentDao" %>

<html>
<head><title>Add comment</title></head>

<body>

<% 
   String err = null;
   String comment = request.getParameter("comment");
   int picture_id = Integer.valueOf(request.getParameter("picture_id"));
   int pictureownerid = request.getParameter("userid");
   String userEmail = request.getUserPrincipal().getName();
   NewUserDao newUserDao = new NewUserDao();
   int userid = newUserDao.getOwnerID(userEmail);
   
   // Comment cannot be Null
	   if (!comment.equals("")){
	   NewCommenrDao newCommentDao = new CommentDao();
	   boolean success = newCommentDao.create(comment, userid, picture_id);
	   if (!success) {
		 err = "We are sorry, for some reason we could not add comment";
	   }
   }
   else {
		err = "Make a comment man!!";
   }
%>

<% if (err != null) { %>
   <font color=red><b>Error: <%= err %></b></font>
   <p> <a href="picture.jsp?id=<%= picture_id %>">Go Back</a>
<% }
   else { %>

<h2>Success!</h2>

<p>Your comment was added.
Go to the <a href="picture.jsp?id=<%= picture_id %>">picture</a>.
OR Go <a href="index.jsp%>">Home</a>
</p>

<% } %>

</body>
</html>