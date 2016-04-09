<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="photoshare.PictureDao" %>

<html>
<head><title>Deleting Picture</title></head>

<body>

<% 	
   String thisEmail= request.getUserPrincipal().getName();
   int picture_id  = Integer.valueOf(request.getParameter("picture_id"));
   String err = null;
   boolean success = false;
   int thisUserId = pictureDao.getUserID(thisEmail);
   PictureDao pictureDao = new PictureDao();
   int picturesUserId = pictureDao.getUserId(Integer.parseInt(picture_id));;
   if (picture_id != null) {
   if (thisUserId != picturesUserId){
   err = "You cannot delete a picture that is not yours.";
  }
  else{
  success = pictureDao.delete(picture_id);
  if (!success) {
        err = "We are sorry, for some reason we could not delete your picture.";
      }
  }
   } 
   else {
  err = "No Picture ID Found.";
   }
 }

   %>

<% if (err != null) { %>
   <font color=red><b>Error: <%= err %></b></font>
   <p> <a href="myalbums.jsp">Go Back</a>
<% }
   else { %>

<h2>Success!</h2>

<p>Your picture has been deleted.
Go to your<a href="myalbums.jsp">album page</a>.

<% } %>

</body>
</html>