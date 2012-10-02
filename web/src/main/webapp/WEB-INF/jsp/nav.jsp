<c:url value="/" var="appContextName"/>
<div style="border: solid 0px;width: 88%; margin-top: 10px; margin-bottom: 10px;padding: 0px 6%;">
	<div style="border: solid 1px;padding-left: 12px;margin-left: 12px; display:inline-block">
		<img src="${appContextName}images/spacer.gif" style="width: 100px; height: 100px;margin-left: 10px;">
	</div>
	<div style="border: solid 0px;padding-left: 12px;display:inline-block">
		<div style="border: solid 0px;margin-bottom: -10px;">
			<font style="font-size: 40px;">V2 Tutorials</font>
		</div>
		<div style="border: solid 0px; text-align: right; vertical-align: top;">
			<font style="font-size: 15px; font-style: italic;">Vision for victory</font>
		</div>
	</div>
	<div style="border: solid 0px;float: right;text-align: right;display:inline-block" >
		<c:choose>
			<c:when test="${not empty sessionScope.loggedInUser}"><span class="title">Logged in user:</span> [ <strong>${loggedInUser.firstName} ${loggedInUser.lastName}</strong> ] | </c:when>
			<c:otherwise><c:redirect url="/login.html"/></c:otherwise>
		</c:choose>
		<a href="logout.html">Logout</a>
	</div>
</div>
<div style="float: left;width: 86.3%; padding-left: 6.85%;border: solid 0px;">
	<ul id="menu-bar" style="width: 100%;">
		<li class="current"><a href="${appContextName}registration/create.html">Registration</a></li>
		<li><a href="${appContextName}master/add.html">Add Masters</a></li>
	</ul>
</div>