<table border="0" style="width: 98%; padding-left: 7px;">
	<tr>
		<td width="50%" nowrap="nowrap">
			<a href="home.html">Home</a> 
			 | <a href="editUser.html">Profile</a> 
			<c:if test="${loggedInUser.type == 'admin'}">
			 | <a href="resetPasswords.html">User</a>
			</c:if> 
		</td>
		<td  width="50%" nowrap="nowrap" align="right">
			<c:choose>
			    <c:when test="${not empty sessionScope.loggedInUser}"><span class="title">Logged in user:</span> [ <strong>${loggedInUser.fname} ${loggedInUser.lname}</strong> ] | </c:when>
			    <c:otherwise><c:redirect url="/login.html"/></c:otherwise>
			</c:choose>
			<a href="logout.html">Logout</a>
		</td>
	</tr>
</table>
