<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<c:url value="/" var="appContextName"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>
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


<style type="text/css">
	#dt_example{background-color: #f7f7f7 !important;}
	#container { width: 98% ! important;}
	#table.display thead th { text-align: left!important;}
	
</style>
</head>
<body id="dt_example" bgcolor="#f7f7f7" >
<table border="0" style="width:100%;">
	<tr>
		<td colspan="3">
			<table border="0" style="width:100%;">
				<tr>
					<td width="25%"></td>
					<td width="50%">
						<div style="min-height: 50px;">
							<h1 style="font-size: 25px; border-bottom: 0px solid #B0BED9; clear: both; color: #4E6CA3; line-height: 2; margin-top: 0em; text-align: center;">
								Workshop Management System
							</h1>
						</div>
					</td>
					<td width="25%"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="3"><%@include file="/WEB-INF/jsp/nav.jsp" %></td></tr>
	<tr><td colspan="3"><div style="width: 98%; padding-left: 7px; "><hr/></div></td></tr>
	<tr><td colspan="3"><div style="min-height: 400px; padding-left: 10px;">

