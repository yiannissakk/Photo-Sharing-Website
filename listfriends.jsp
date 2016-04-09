<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="photoshare.FriendDao" %>
<%@ page import="photoshare.NewUserDao" %>
<%@ page import="java.util.List" %>
<html>
<body>
	<h1>These are all your friends!!!</h1>
<table>
    <tr>
        <%
  		NewUserDao newUserDao = new NewUserDao();
		FriendDao friendDao = new FriendDao();
		int userid = newUserDao.getUserId(request.getUserPrincipal().getName());
        List<String> friendsnames = friendDao.listFriendsNames(userid);
        for (String friendname : friendsnames) {
        %>
       		<%= friendname %>
        <%
			}
        %>
    </tr>
</table>

<h4>Return to<a href="index.jsp">Home Page</a></h3><br/>


<h4><a href="index.jsp">Return to Home Page</a></h3><br/>

	</body>
</html>