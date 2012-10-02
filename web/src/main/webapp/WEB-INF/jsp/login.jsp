<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>

<link rel="stylesheet" type="text/css" href="/ims/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/ims/css/style.css" />
<link rel="stylesheet" type="text/css" href="/ims/css/animate-custom.css" />

<style type="text/css">
	#login{
		position: absolute;
		top: 0px;
		width: 88%;	
		padding: 18px 6% 60px 6%;
		margin: 0 0 35px 0;
		background: rgb(247, 247, 247);
		border: 1px solid rgba(147, 184, 189,0.8);
		-webkit-box-shadow: 0pt 2px 5px rgba(105, 108, 109,  0.7),	0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
		   -moz-box-shadow: 0pt 2px 5px rgba(105, 108, 109,  0.7),	0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
		        box-shadow: 0pt 2px 5px rgba(105, 108, 109,  0.7),	0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset;
		-webkit-box-shadow: 5px;
		-moz-border-radius: 5px;
			 border-radius: 5px;
	}
	#login{
		z-index: 22;
	}
</style>
</head>
<body>
	<div style="min-height: 50px;">
		<h1 style="font-size: 25px; border-bottom: 0px solid #B0BED9; clear: both; color: #066A75; line-height: 2; margin-top: 0em; text-align: center;">
			Institute Management System
		</h1>
	</div>
	<div id="container_demo">
		<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>
		<div id="wrapper">
			<div id="login" class="animate form">
				<form name="loginForm" method="post">
					<h1>Log in</h1>
					<c:if test="${(! empty param.invalidLogin && param.invalidLogin == 'Y')}">
			  			<font color="red"><fmt:message key="label.invalid.credencials"/></font>
			  		</c:if>
					<p>
						<label for="j_username" class="uname">Username</label>
						<input id="j_username" name="j_username" type="text" />
					</p>
					<p>
						<label for="password" class="youpasswd">Password</label><input
							id="password" name="j_password" type="password" />
					</p>
					<p class="login button">
						<input type="submit" value="Login" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">Forgot password</a>
					</p>
				</form>
			</div>
		</div>
	</div>

<%--
<table border="0" style="width:100%;">
	<tr>
		<td colspan="3">
			<table border="0" style="width:100%;">
				<tr>
					<td width="25%"></td>
					<td width="50%">
						<div style="min-height: 50px;">
							<h1 style="font-size: 25px; border-bottom: 0px solid #B0BED9; clear: both; color: #4E6CA3; line-height: 2; margin-top: 0em; text-align: center;">
								Institute Management System
							</h1>
						</div>
					</td>
					<td width="25%"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="3"><div style="width: 98%; padding-left: 7px; "><hr/></div></td></tr>
	<tr><td colspan="3" align="center" style="padding-top: 100px;">
			<div style="min-height: 400px;">
				<c:set var="title" value="Login" />
				<form  name="loginForm" method="post" >
				<table >
					<tr>
					  	<td colspan="2">
					  		<c:if test="${(! empty param.invalidLogin && param.invalidLogin == 'Y')}">
					  			<font color="red"><fmt:message key="label.invalid.credencials"/></font>
					  		</c:if>
						    
						</td>
					</tr>
					<tr>
						<td>Username</td><td><input type="text" name="j_username"/></td>
					</tr>
					<tr>
						<td>Password</td><td><input type="password" name="j_password"/></td>
					</tr>
					<tr>
						<td></td><td><input type="submit" value="Login"></td>
					</tr>
				</table>
				</form>
			</div>
		</td></tr>
		<tr><td colspan="3"><div style="min-height: 10px;"></div></td></tr>
	</table>
--%>
</body>
</html>