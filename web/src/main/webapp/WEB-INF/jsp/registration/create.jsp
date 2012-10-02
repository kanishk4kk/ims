<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<html>
<head>
<c:url value="/" var="appContextName"/>
<link type="text/css" href="${appContextName}jquery-ui-1.8.23.custom/css/smoothness/jquery-ui-1.8.23.custom.css" rel="Stylesheet" />	
<script type="text/javascript" src="${appContextName}jquery-ui-1.8.23.custom/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${appContextName}jquery-ui-1.8.23.custom/js/jquery-ui-1.8.23.custom.min.js"></script>
<%@include file="/WEB-INF/jsp/registration/create_js.jsp" %>
<link rel="stylesheet" type="text/css" href="/ims/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/ims/css/menu.css" />
<link rel="stylesheet" type="text/css" href="/ims/css/style.css" />
<link rel="stylesheet" type="text/css" href="/ims/css/animate-custom.css" />

<style type="text/css">
#register {
	position: absolute;
	text-align: right !important;
	width: 88%;
	permanentAddressing: 18px 6% 10px 6%;
	margin: 3% 5% 6% 6%;
	background: rgb(247, 247, 247);
	border: 1px solid rgba(147, 184, 189, 0.8);
	-webkit-box-shadow: 0pt 2px 5px rgba(105, 108, 109, 0.7), 0px 0px 8px
		5px rgba(208, 223, 226, 0.4) inset;
	-moz-box-shadow: 0pt 2px 5px rgba(105, 108, 109, 0.7), 0px 0px 8px 5px
		rgba(208, 223, 226, 0.4) inset;
	box-shadow: 0pt 2px 5px rgba(105, 108, 109, 0.7), 0px 0px 8px 5px
		rgba(208, 223, 226, 0.4) inset;
	-webkit-box-shadow: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#wrapper input:not([type="checkbox"]){
	width: 50%; !important;
	height: 25px;
}
#wrapper textarea{
	width: 50%; !important;
}
#register_left div{
	vertical-align: middle;
}

#wrapper div div div{
	vertical-align: middle;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/jsp/nav.jsp" %>
<div id="wrapper" style="width: 98% ! important;">
	<div id="register" style="border: solid 0px;">
	<h2 class="add_panel_header">Sign up</h2>
		<center>
			<div style="width: 95% ! important; border: solid 0px;">
				<form:form commandName="RegistrationDTO" method="post" enctype="multipart/form-data">
					<div id="register_left" style="float: left; width: 500px ! important; border: solid 0px; text-align: right;">
						<div>
							<form:label path="firstName"><spring:message code="label.firstname"/></form:label><span style=" color: red;">*</span>:
							<form:input id="firstName" path="firstName" maxlength="64"/>
							<br/><form:errors path="firstName" cssClass="error" />
						</div>
						<div>
							<form:label path="lastName"><spring:message code="label.lastname"/></form:label><span style=" color: red;">*</span>:
							<form:input id="lastName" path="lastName" maxlength="64"/>
							<br/><form:errors path="lastName" cssClass="error" />
						</div>
						<div>
							<form:label path="dob"><spring:message code="label.dob"/></form:label><span style=" color: red;">*</span>:
							<form:input path="dob" id="datepicker" cssClass="date_time" />
							<br/><form:errors path="dob" cssClass="error" />
						</div>
						<div>
							<div style="padding-right: 112px;">
								<form:label path="gender"><spring:message code="label.gender"/></form:label><span style=" color: red;">*</span>:
								<form:radiobutton id="genderM" path="gender" value="M" cssStyle="width: 20px!important;" /> Male &nbsp;&nbsp;&nbsp;&nbsp;
								<form:radiobutton id="genderF" path="gender" value="F" cssStyle="width: 200px ! important;"/> Female
								<br/><form:errors path="gender" cssClass="error" />
							</div>
						</div>
						<div>
							<form:label path="email"><spring:message code="label.email"/></form:label> : 
							<form:input id="email" path="email" maxlength="128"/>
							<br/><form:errors path="email" cssClass="error" />
						</div>
						<div>
							<form:label path="school"><spring:message code="label.school"/></form:label><span style=" color: red;">*</span>:
							<form:input id="school" path="school" maxlength="256"/>
							<br/><form:errors path="school" cssClass="error" />
						</div>
						<div>
							<form:label path="mobile"><spring:message code="label.mobile.self"/></form:label><span style=" color: red;">*</span>:
							<form:input id="mobile" path="mobile" maxlength="20"/>
							<br/><form:errors path="mobile" cssClass="error" />
						</div>
						<div>
							<form:label path="permanentAddress"><spring:message code="label.permanent.address"/></form:label><span style=" color: red;">*</span>:
							<form:textarea id="permanentAddress" path="permanentAddress" cssStyle="height:90px;"></form:textarea>
							<br/><form:errors path="permanentAddress" cssClass="error" />
						</div>
						<div style="margin-bottom: 0px!important;">
							<input type="checkbox" id="sameAsPermanentAddress" name="sameAsPermanentAddress" onchange="javascript:copyPermanentAddress(this);" />&nbsp;Same as Permanent
						</div>
						<div>
							<form:label path="communicationAddress"><spring:message code="label.communication.address"/></form:label>
							<form:textarea id="communicationAddress" path="communicationAddress" cssStyle="height:90px;"></form:textarea>
							<br/><form:errors path="communicationAddress" cssClass="error" />
						</div>
						<div>
							<form:label path="username"><spring:message code="label.username"/></form:label><span style=" color: red;">*</span>:
							<form:input id="username" path="username" cssStyle="width: 151px ! important;" maxlength="32"/>
							<a href="javascript:checkUsernameAvailibility();">Availibility</a>
							<span id="availibilityDiv" style="width: 25px; height:25px;"><img src='${appContextName}images/spacer.gif' style='width: 25px; height:25px;' /></span>
							<br/><form:errors path="username" cssClass="error" />
						</div>
						<div>
							<form:label path="picture"><spring:message code="label.picture.student"/></form:label>:
							<form:input path="picture" type="file"/>
							<form:errors path="picture" cssClass="error" />
						</div>
					</div>
					<div id="register_right" style="float: right; width: 500px ! important; border: solid 0px; text-align: right; padding-right: 80px;">
						<div>
							<form:label path="fatherName"><spring:message code="label.father.name"/></form:label><span style=" color: red;">*</span>:
							<form:input id="fatherName" path="fatherName" maxlength="64"/>
							<br/><form:errors path="fatherName" cssClass="error" />
						</div>
						<div>
							<form:label path="fatherOccupation"><spring:message code="label.father.occupation"/></form:label>:
							<form:input id="fatherOccupation" path="fatherOccupation" maxlength="128"/>
							<br/><form:errors path="fatherOccupation" cssClass="error" />
						</div>
						<div>
							<form:label path="fatherMobile"><spring:message code="label.father.mobile"/></form:label><span style=" color: red;">*</span>:
							<form:input id="fatherMobile" path="fatherMobile" maxlength="20"/>
							<br/><form:errors path="fatherMobile" cssClass="error" />
						</div>
						<div>
							<form:label path="phone"><spring:message code="label.phone"/></form:label><span style=" color: red;">*</span>:
							<form:input id="phone" path="phone" maxlength="20"/>
							<br/><form:errors path="phone" cssClass="error" />
						</div>
						<div>
							<form:label path="courses"><spring:message code="label.courses"/></form:label><span style=" color: red;">*</span>:
							<form:select id="courses" path="courses" multiple="multiple" size="5" cssStyle="width: 250px">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</form:select>
							<br/><form:errors path="courses" cssClass="error" />
						</div>
						<div>
							<form:label path="subjects"><spring:message code="label.subjects.applied"/></form:label><span style=" color: red;">*</span>:
							<form:select id="subjects" path="subjects" multiple="multiple" size="5" cssStyle="width: 250px">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</form:select>
							<br/><form:errors path="subjects" cssClass="error" />
						</div>
						<div>
							<form:label path="batchTimings"><spring:message code="label.batch.timings"/></form:label><span style=" color: red;">*</span>:
							<form:select id="batchTimings" path="batchTimings" multiple="multiple" size="5" cssStyle="width: 250px">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</form:select>
							<br/><form:errors path="batchTimings" cssClass="error" />
						</div>
						<div>
							<form:label path="joinDate"><spring:message code="label.joinDate"/></form:label><span style=" color: red;">*</span>:
							<form:input id="joinDate" path="joinDate"/>
							<br/><form:errors path="joinDate" cssClass="error" />
						</div>
						<div>
							<form:label path="feesDeposited"><spring:message code="label.feesDeposited"/></form:label>:
							<form:input id="feesDeposited" path="feesDeposited" maxlength="5"/>
							<br/><form:errors path="feesDeposited" cssClass="error" />
						</div>
						<div>
							<form:label path="feesDue"><spring:message code="label.feesDue"/></form:label>:
							<form:input id="feesDue" path="feesDue" maxlength="5"/>
							<br/><form:errors path="feesDue" cssClass="error" />
						</div>
					</div>
					<div style="float: right; padding-right: 80px;">
						<p class="signin button" style="margin-bottom:0px !important;">
							<input type="submit" value="<spring:message code='label.signup'/>" style="width: 80px !important; height: 20px;" />
						</p>
					</div>
				</form:form>
			</div>
		</center>
	</div>
		</div>
</body>
</html>