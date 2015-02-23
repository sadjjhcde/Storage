<!DOCTYPE html>
<html>
  <head>
    <title>Storage Manager</title>
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'storage.css')}" rel="stylesheet">
  </head>
  <body>
  
	<nav class="navbar navbar-custom navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          
          <a class="navbar-brand" href="#">Perfume Ultra Storage Manager 2000</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
			<p class="navbar-text pull-right">
				<g:link action="logout" class="navbar-link log-out">Log out</g:link>
            </p>
			<p class="navbar-text pull-right">
				Logged in as ${user}
            </p>			
        </div>
      </div>
    </nav>
	
		
	<div class="container-fluid">
		<div class="row">		
						  
			<div class="main">
				
				<div class="panel panel-default">  
					<div class="panel-heading">Ending products</div>				
					<table class="table table-striped table-hover table-bordered">
						<tr>
					        <th>Name</th>
					        <th>Brand</th>
					        <th>Cost, $</th>
					        <th>Size, ml</th>
					        <th>Amount</th>
					    </tr>
					    <g:each in="${perfumes}">
					        <tr>
					            <td>${it.name}</td>
					            <td>${it.brand}</td>
					            <td>${it.cost}</td>
					            <td>${it.size}</td>
					            <td>${it.amount}</td>
					        </tr>
					    </g:each>
					</table>					
				</div>
			</div>			
		</div>
	</div>
	
  </body>
</html>