<c:set var="appContextName"><c:url value="/"/></c:set>
<style type="text/css" title="currentStyle">
	@import "${appContextName}css/main.css";
	@import "${appContextName}css/demo_page.css";
	@import "${appContextName}css/demo_table.css";
	@import "${appContextName}css/jquery.dataTables.css";
	@import "${appContextName}css/jquery.dataTables_themeroller.css";
	@import "${appContextName}css/demo_table_jui.css";
</style>
<script type="text/javascript" language="javascript" src="${appContextName}js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="${appContextName}js/jquery.dataTables.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#username").change(function() {
			var uname = $(this).val().trim();
			if(uname != '') {
				$("#availibilityDiv").html("<img src='${appContextName}images/ajax-loader.gif' style='width: 25px; height:20px;' />");
				$("#availibilityDiv").show();
				$.get("${appContextName}registration/checkUsernameAvailibility.ws", {'uname' : uname},
					function(data) {
						if(data == 'true') {
							$("#availibilityDiv").html("<img src='${appContextName}images/active.png' style='width: 25px; height:20px;' />");
						} else {
							$("#availibilityDiv").html("<img src='${appContextName}images/deactive.png' style='width: 25px; height:20px;' />");
						}
					}
				);
			}
		});
		$('textarea[name="permanentAddress"]').keyup(function() {
			if($("#sameAsPermanentAddress").attr('checked')?true:false) {
				$("#communicationAddress").val($("#permanentAddress").val());
			}
		});
	});
	
	function copyPermanentAddress(ele) {
		if(ele.checked) {
			$("#communicationAddress").val($("#permanentAddress").val());
		}
	}

	/* permanentAddress
	communicationAddress
	sameAsPermanentAddress */
	
	function checkUsernameAvailibility() {

	}
	
	$(function() {
		$( "#datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true,
            showOn: 'both',
            buttonImage: "images/calendar.gif",
            buttonText: '',
            buttonImageOnly: true,
            dateFormat: 'dd-MM-yyyy'
		});
	});

</script>
