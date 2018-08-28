<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Friends Overview" />
</jsp:include>
<body>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Friends Overview" />
    </jsp:include>
    <main>
        <p>Search for friends</p>
        <input type="text" id="searchusersfield"/>
        <input type="button" id="searchusersbutton" value="Search"/>
        <div id="searchresult"></div>
        <div id="statusamount"></div>
        <div id="friends"></div>
    </main>
    <aside>
        <div id="messages">

        </div>
    </aside>
<script type="text/javascript" src="js/message.js"></script>
</body>
</html>
<script type="text/javascript" src="js/friends.js" onload="getFriends()"></script>
