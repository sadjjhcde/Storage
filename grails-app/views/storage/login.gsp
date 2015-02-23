<!DOCTYPE html>
<html>
  <head>
    <title>Log In</title>
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'login.css')}" rel="stylesheet">
  </head>
  <body>
	
	<div class="container">
		<g:form method="post" class="form-signin">      
	        <h2 class="form-signin-heading">Please log in</h2>
	        <g:field name="login_value" type="text" class="form-control" placeholder="Username"/>
	        <g:if test="${invalid}">
	        	<h3 class="form-signin-heading invalid">Invalid login</h3>
	        </g:if>               
	        <g:actionSubmit class="btn btn-lg btn-primary btn-block" action="login" value="Log in" />
        </g:form>
    </div> 
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<g:javascript src="bootstrap.js" />
  </body>
</html>