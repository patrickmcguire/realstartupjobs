# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(function() {	
		$('#jobstable').dataTable( {
			"sDom": "<'row'<'span9'l>r>t<'row'<'span9'i><'span9'>p>",
			"sPaginationType": "bootstrap",
			"iDisplayLength": 10,
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

	});
