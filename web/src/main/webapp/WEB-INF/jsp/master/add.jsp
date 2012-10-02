<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:url value="/" var="appContextName"/>
	<link type="text/css" href="${appContextName}jquery-ui-1.8.23.custom/css/smoothness/jquery-ui-1.8.23.custom.css" rel="Stylesheet" />	
	<script type="text/javascript" src="${appContextName}jquery-ui-1.8.23.custom/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${appContextName}jquery-ui-1.8.23.custom/js/jquery-ui-1.8.23.custom.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/ims/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="/ims/css/menu.css" />
	<link rel="stylesheet" type="text/css" href="/ims/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/ims/css/animate-custom.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add Masters</title>
	<script type="text/javascript">
		function addCourseAction() {
			$("#submitAction").val('Add');
			$("#entity").val('Course');
			
		}
		function deleteCourseAction() {
			
		}
	</script>
	<style type="text/css">
		.box {border:2px solid #0094ff;}
		.box h2 {background:#0094ff;color:white;padding:10px;}
		.box p {color:#333;padding:10px;}
	</style>
</head>
<body>
<%@include file="/WEB-INF/jsp/nav.jsp" %>
<br>
<div id="wrapper" style="width: 98% ! important;border: solid 0px;">
	<div id="register" style="border: solid 0px;overflow: auto; margin-top: 20px">
		<div class="add_panel" style="border: solid 0px; width: 300px;float:left;">
			<h2 class="add_panel_header">Course</h2>
			<form name="master" action="${appContextName}course/add.html" method="post">
			<div style="padding: 10px; padding-bottom: 0px;">
				<div>
					<select name="courses" multiple="multiple" size="5" style="width: 250px">
						<c:if test="${not empty courses}">
							<c:forEach items="${courses}" var="course">
								<option id="${course}">${course.title}</option>							
							</c:forEach>
						</c:if>
					</select>
				</div>
				<div>
					<input type="text" id="course_title" name="title" style="width: 250px">
				</div>
				<p class="signin button" style="padding-right: 30px;">
					<input type="submit" name="saveCourse" value="Save" style="width: 80px;">
					<input type="submit" name="deleteCourse" value="Delete" style="width: 80px;">
				</p>
			</div>
			</form>
		</div>
		<div class="add_panel" style="border: solid 0px; width: 300px;float:left;">
			<h2 class="add_panel_header">Subject</h2>
			<form name="master" action="/subject/add.html" method="post">
			<div style="padding: 10px; padding-bottom: 0px;">
				<div>
					<select name="courses" multiple="multiple" size="5" style="width: 250px">
						<c:if test="${not empty subjects}">
							<c:forEach items="${subjects}" var="subject">
								<option id="${subject.subjectId}">${subject.title}</option>							
							</c:forEach>
						</c:if>
					</select>
				</div>
				<div>
					<input type="text" style="width: 250px">
				</div>
				<p class="signin button" style="padding-right: 30px;">
					<input type="submit" name="saveCourse" value="Save" style="width: 80px;">
					<input type="submit" name="deleteCourse" value="Delete" style="width: 80px;">
				</p>
			</div>
			</form>
		</div>
		<div class="add_panel" style="border: solid 0px; width: 300px;float:left;">
			<h2 class="add_panel_header">Batch</h2>
			<form name="master" action="/batch/add.html" method="post">
			<div style="padding: 10px; padding-bottom: 0px;">
				<div>
					<select name="courses" multiple="multiple" size="5" style="width: 250px">
						<c:if test="${not empty batches}">
							<c:forEach items="${batches}" var="batch">
								<option id="${batch.batchId}">${batch.title}</option>							
							</c:forEach>
						</c:if>
					</select>
				</div>
				<div>
					<input type="text" style="width: 250px">
				</div>
				<p class="signin button" style="padding-right: 30px;">
					<input type="submit" name="saveCourse" value="Save" style="width: 80px;">
					<input type="submit" name="deleteCourse" value="Delete" style="width: 80px;">
				</p>
			</div>
			</form>
		</div>
 	</div>
</div>
</body>
</html>