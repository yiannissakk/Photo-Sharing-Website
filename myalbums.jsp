<%@ page import="photoshare.Picture" %>
<%@ page import="photoshare.PictureDao" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="photoshare.NewAlbumDao" %>
<%@ page import="photoshare.NewUserDao" %>
<%@ page import="photoshare.NewAlbumBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="imageUploadBean"
             class="photoshare.ImageUploadBean">
    <jsp:setProperty name="imageUploadBean" property="*"/>
</jsp:useBean>

<html>
<head><title>MY ALBUMS</title></head>

<h2>Create a new Album</h2>
<form action="newalbum.jsp">
    <button class="btn btn-lg btn-primary btn-block" type="submit" value="Create a new album">Create a new album!</button>
</form>

<h3> HERE ARE YOUR ALBUMS</h3>
<tr>
<%
NewUserDao newUserDao = new NewUserDao();
String email = request.getUserPrincipal().getName();
NewAlbumDao newAlbumDao = new NewAlbumDao();
int user_id = newUserDao.getUserId(email);
List<NewAlbumBean> albumList = new ArrayList<NewAlbumBean>();
albumList = newAlbumDao.getAlbumList(user_id);
String thisId = request.getParameter("albumid");
String thisName  = request.getParameter("name");
for(NewAlbumBean album:albumList){%>
		<a href="myalbums.jsp?albumid=<%=album.getAlbumId()%>&albumname=<%= album.getName()%>"> <%= album.getName() %></a></br>
	<%}%>
</tr>

<%if (thisId!=null){%>
<h2>Upload a photo to <%= thisName%></h2>
<form action="myalbums.jsp?albumid=<%= thisId%>&albumname=<%= thisName%>" enctype="multipart/form-data" method="post">
	Filename: <input type="file" name="filename"/><br>
    <input type="submit" value="Upload"/><br/>
</form>
<%}%>
<%
	PictureDao pictureDao = new PictureDao();
    try {
        Picture picture = imageUploadBean.upload(request);
        if (picture != null) {
			picture.setAlbumId(Integer.parseInt(thisId));
            pictureDao.save(picture, Integer.valueOf(thisId));
        }
    } catch (FileUploadException e) {
        e.printStackTrace();
    }%>

	<%if (thisId!=null){%> 
	<h2>Your pictures in <%= thisName%></h2>
	<table>
		<tr>
			<%
			List<Integer> pictureIds = pictureDao.getPicturesIDsFromAlbum(Integer.parseInt(thisId));
			for (Integer pictureId : pictureIds) { %>
				
			<td><a href="picture.jsp?id=<%= pictureId %>&albumid=<%=thisId%>">
				<img src="/photoshare/img?t=1&picture_id=<%= pictureId %>"/>
			</a>
			</td>
			<%}%>
		</tr>
	</table>
<%}%>
<%if (thisId != null ){%>
<form action="deletemyalbum.jsp?albumid=<%= thisId%>&albumname=<%= thisName%>" method="post">
    <input type="submit" value="Delete <%= thisName%>"/><br/>
</form>
<%}%>

<h4><a href="index.jsp">Return to Home Page</a></h3><br/>

</body>
</html>