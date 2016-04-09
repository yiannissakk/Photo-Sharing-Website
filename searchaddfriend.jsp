<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.bu.cs.cs460.photoshare.NewUserDao" %>
<%@ page import="edu.bu.cs.cs460.photoshare.FriendsDao" %>
<html>
<head><title>Add Friends! Search them here!</title></head>

<body>
	<%
	NewUserBean newUserBean = new NewUserBean();
	FriendsBean friendBean = new FriendsBean();
	String err = null;
	boolean success = false; %>
	<%
	if (!newUserBean.getEmail().equals("")) { 
       NewUserDao newUserDao = new NewUserDao();
       String friendEmail = newUserBean.getEmail();
	   if(newUserDao.isAUser(friendEmail))
	   {
       		FriendsDao friendsDao = new FriendsDao();	
			int frienduserid = newUserDao.getUserId(friendEmail);
			int userId = newUserDao.getUserId(request.getUserPrincipal().getName());
			if(frienduserid != userId){
				success = true;
		    }else{
				err = "Are you not friends with yourself?";
			}
		}else{
			err = "This email does not exist";
		}
	}
	%>
	<script type="text/javascript">
	function addFriend()
	{
		<%isFriendsDao.create(userid, frienduserid);%>
	}
</script>
<% if (err != null && err != "You have added your friend") { %>
<font color=red><b>Error: <%= err %></b></font>
<% } %>

<% if (!success) { %>

<h2>Search other users</h2>

<form action="searchaddfriend.jsp" method="post">
  Please enter your friend's email: <input type="text" name="email"/><br>
  <input type="submit" value="Search"/><br/>
</form>


<% }
   else { %>

<p>You friend with email <%= newUserBean.getEmail() %> is a user in Photo Share. <br>
<form>
<input type="button" value="Add my friend now" onClick="addFriend()" />
</form>

Return to your <a href="index.jsp">Home</a><br/>


<% } %>

<form action="/photoshare/listallfriends.jsp" target="_blank"> 
	<input type="submit" value="List Friends">
</form>

<h4><a href="index.jsp">Return to Home Page</a></h3><br/>

</body>
</html>




