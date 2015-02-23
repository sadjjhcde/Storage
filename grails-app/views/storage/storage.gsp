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

            <a class="navbar-brand" href="#">Perfume Ultra Storage Manager</a>
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


<div class="col-md-3 sidebar">

	<g:if test="${canEdit}">		
	    <form class="form-horizontal">
	    	
		        <g:form method="post">
		
		            <div class="form-group">
		                <g:field name="name" type="text" required class="form-control" placeholder="Name..."/>
		            </div>
		
		            <div class="form-group">
		                <g:field name="brand" type="text" required class="form-control" placeholder="Brand..."/>
		            </div>
		
		            <div class="form-group">
		                <g:field name="cost" type="number" required step="0.01" min="0" class="form-control" placeholder="Cost..."/>
		            </div>
		
		            <div class="form-group">
		                <g:field name="size" type="number" required min="0" class="form-control" placeholder="Size..."/>
		            </div>
		
		            <div class="form-group">
		                <g:field name="amount" type="number" required min="0" class="form-control" placeholder="Amount..."/>
		            </div>
		
		            <div class="form-group">
		                <g:actionSubmit class="btn btn-primary" action="add" value="Add" />
		            </div>
		
		        </g:form>	             
        			
			<div class="form-group">           	
			<g:uploadForm method="post" >
	           	<input id="lefile" type="file" name="file" style="display:none">
				<div class="input-append">
					<input id="file" name="file" class="input-large" type="text">
					<a class="btn" onclick="$('input[id=lefile]').click();">Browse</a>
					<g:actionSubmit class="btn btn-primary" action="importData" value="Import" />
				</div>
			</g:uploadForm>           	
         </div>		     

    	</form>    
    </g:if> 
    <g:if test="${!canEdit}">
    	<h3>You do not have permission to edit</h3>
	</g:if> 
</div>
 

<div class="col-md-9 col-md-offset-3 main">
<div class="form-inline">
	
    <div class="input-group">
    	<g:form method="post">
	        <div class="form-group pull-left">
	            <g:field name="search_value" type="text" class="form-control" placeholder="Name..."/>
	        </div>	
	        <div class="form-group pull-left">
	            <g:actionSubmit class="btn btn-primary" action="store" value="Search" />
	        </div>
        </g:form>		
    </div>
	
    <div class="form-group pull-right">
    	<g:form method="post">
    		<g:actionSubmit class="btn btn-default" action="endingProducts" value="Ending products" />
    	</g:form>		
	</div>	
    
    <div class="form-group pull-right">
    	<g:form method="post">
    		<g:actionSubmit class="btn btn-primary" action="exportData" value="Export" />
    	</g:form>		
	</div>	

</div>
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

<script src="http://code.jquery.com/jquery-latest.js"></script>
<g:javascript src="bootstrap.js" />
<script type="text/javascript">
	$('input[id=lefile]').change(function() {
		$('#file').val($(this).val());
	});
</script>
</body>
</html>