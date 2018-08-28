<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header role="banner">
    <img alt="Books" src="images/books.jpg">
    <h1><span>Library</span></h1>
    <nav>
        <ul>
            <li ${param.title == 'Home' ?  "id=\"actual\"" : ""}><a href="Controller">Home</a></li>
            <c:if test="${user!=null}">
                <li${param.title == 'Friends' ?  "id=\"actual\"" : ""}><a href="Controller?action=FriendsOverview">Friends List</a></li>
                <li><a href="Controller?action=LogOut">Log Out</a></li>
            </c:if>
            <c:if test="${user==null}">
                <li><a href="Controller?action=SignUpPage">Sign Up</a></li>
            </c:if>
        </ul>
</nav>
    <aside id="statusaside">
        <c:if test="${user != null}">
        <div id="status" class="status${user.status.toString().toLowerCase()}"><span id="statustext" class="statustext">${user.getStatusMessage()}</span></div>
        <select id="statusdropdown">
            <c:forEach items="${statusList}" var="status">
                <option ${user.status == status ? "selected=\"selected\"" : ""} value="${status}">${status.toString()}</option>
            </c:forEach>
        </select>
        <div id="statustextboxdiv"><input type="text" id="statustextbox" name="statustext" value="${user.message}"/></div>
        <input type="button" id="statusbutton" value="Change Status"/>
        </c:if>
    </aside>
<h2>
${param.title}
</h2>
</header>
<script type="text/javascript" src="js/status.js" onload="textBoxVisibility()"></script>
