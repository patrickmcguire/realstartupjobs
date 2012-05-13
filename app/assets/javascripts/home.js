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
