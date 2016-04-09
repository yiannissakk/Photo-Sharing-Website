<html>
<head><title> Picture</title></head>

<body>
<td><a href="/photoshare/img?picture_id=<%= picture_id %>">
            <img src="/photoshare/img?t=1&picture_id=<%= picture_id %>">
        </a>
        </td>
<% int picture_id = Integer.valueOf(request.getParameter("id"));%>
<form action="deletepicture.jsp?picture_id=<%= picture_id%>" method="post">
		<input type="submit" value="Delete this picture"/>
	</form>

GO <a href="index.jsp">HOME</a>
</body>