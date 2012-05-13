<?php ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Startup Jobs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Noah Pryor">

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.8.2/css/jquery.dataTables.css">
<link rel="stylesheet" href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" type="text/css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="http://datatables.net/media/blog/bootstrap_2/DT_bootstrap.css" type="text/css"> 
<link rel="stylesheet" href="bootstrap.css" type="text/css" media="screen" title="no title" charset="utf-8">
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="http://jquery-datatables-column-filter.googlecode.com/svn/trunk/media/js/jquery-1.4.4.min.js"></script>
 
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://jquery-datatables-column-filter.googlecode.com/svn/trunk/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="http://jquery-datatables-column-filter.googlecode.com/svn/trunk/media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" charset="utf8" src="js/datatables-onpage.js"></script>
<style>
.sidebar-nav select, input 
{
width: 150px;
}
</style>
<script type="text/javascript">/* Table initialisation */
$(document).ready(function() {
	$('#example').dataTable( {
		"sDom": "<'row'<'span9'lp>r>t<'row'<'span9'i><'span9'p>>",
		"sPaginationType": "bootstrap",
		"iDisplayLength": 50,
		"oLanguage": {
			"sLengthMenu": ""
		},
		"aoColumnDefs": [ 
		
				{ "sWidth": "5%", "aTargets": [ 4 ] } 
			
				]
		
	} )
	.columnFilter({aoColumns:[
		{ sSelector: "#titleFilter",},
		{ type:"select",  sSelector: "#typeFilter" },
		{ type:"select", sSelector: "#technicalFilter" },
		{ sSelector: "#companyFilter" },
		null,
		null,
		null,
		]}
	);	
 $("a").attr('target','_blank');

});
</script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">RealStartupJobs.com </a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
         <!--     <li><a href="#about">About</a></li> -->
              <li><a href="mailto:noah@noahpryor.com">Feedback</a></li>
            </ul>
          <!--  <p class="navbar-text pull-right">Logged in as <a href="#">username</a></p> -->
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    
		
    	
<div class="container" style="margin-top:60px;" width='940'>
	  <div class="row">
        <div class="span3">
	      <div class="well sidebar-nav">
    
			<form class="">
				<fieldset>
					<div id="techfiltersidebar" class="control-group">
						<label class="control-label" for="techfiltersidebar">Show only technical jobs?</label>
		            	<div class="controls">
							<p id="technicalFilter"></p>
						</div>
					</div>
					<div id="typefiltersidebar" class="control-group">
						<label class="control-label" for="typefiltersidebar">What kind of position?</label>
		            	<div class="controls">
							<p id="typeFilter"></p>
						</div>
					</div>
					<div id="titleFiltersidebar" class="control-group">
						<label class="control-label" for="typefiltersidebar">Search by Job Title</label>
		            	<div class="controls">
							<p id="titleFilter"></p>
						</div>
					</div>
					<div id="companyFiltersidebar" class="control-group">
						<label class="control-label" for="companyFiltersidebar">Search by Company</label>
		            	<div class="controls">
							<p id="companyFilter"></p>
						</div>
					</div>
				</fieldset>
			</form>
		</div> <!-- end side bar !-->
		</div>

		<div class="span9">
		<h1>Find a job you love at a vetted startup in NYC </h1><br>
    		<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example" width='100%'>
	<thead>
		<tr>
				<th width="50%">Job Title</th >
				<th>Type</th>
				<th>Techie Only?</th>
				<th width="50%">Company Name</th>
				<th>Est.</th>
				<th># of ppl</th>
				<th>VC</th>
		</tr>
	</thead>
	
	<tbody>
<? include 'results.php'; ?>
	</tbody>
	<tfoot style="display:none;">	
		<tr>
				<th>Job Title</th>
				<th>Internships & Jobs</th>
				<th>Show Both</th>
				<th>Company Name</th>
				<th>Founded</th>
				<th>Employees</th>
				<th>Funding</th>
		</tr>
	</tfoot>
</table>
		</div>
	</div>
</div>
</body>