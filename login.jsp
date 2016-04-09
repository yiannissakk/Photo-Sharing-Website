<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Photoshare Login</title>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
</head>

<body>
    <div class="container">
    	<form class="form-signin" method="POST" action="j_security_check">
    		<h2 class="form-signin-heading">Please sign in</h2>
    		<label for="inputEmail" class="sr-only">Email address</label>
    		<input type="text" name="j_username" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
    		<input type="password" name="j_password" id="inputPassword" class="form-control" placeholder="Password" required>
    		<button class="btn btn-lg btn-primary btn-block"  type="submit" value="Login">Log in!</button>
    	</form>
    	<form action="newuser2.jsp">
    		<button class="btn btn-lg btn-primary btn-block"  type="submit" value="Sign Up">Sign Up!</button>
    	</form>
    </div>
<!---
<form method="POST" action="j_security_check">
    <table>
        <tr><th>Email</th><td><input type="text" name="j_username"></td></tr>
        <tr><th>Password</th><td><input type="password" name="j_password"></td>
        </tr>
        <tr><td colspan="2" align="right"><input type="submit" value="Login"/>
        </td></tr>
    </table>
</form>-->
</body>
</html>