<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="photoshare.HasTagDao" %>

<html>

<body>

<% 
   String err = null;
   String tag = request.getParameter("tag");
   int pictureidT = Integer.parseInt(request.getParameter("picture_id"));
   
	   if (!tag.equals("")){
	   HasTagDao hasTagDao = new HasTagDao();
	   boolean success = hasTagDao.create(tag, pictureidT);
	   if (!success) {
		 err = "Couldn't add tag";
	   }
   }
   else {
		err = "How do u see an empty tag happening?";
   }
%>

<% if (err != null) { %>
   <font color=red><b>Error: <%= err %></b></font>
   <p> <a href="picture.jsp?id=<%= pictureidT %>">Go Back</a>
<% }
   else { %>

<h2>Success!</h2>
U have added a tag</b>.
Go to the <a href="picture.jsp?id=<%= pictureidT %>">picture</a>.
Or go <a href="index.jsp">home</a>

<% } %>

</body>
</html>