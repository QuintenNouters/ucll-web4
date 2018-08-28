<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Sign Up" />
</jsp:include>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home" />
</jsp:include>
<main>
    <c:if test="${errors != null}">
        <div class="alert-danger">
            <ul>
                <c:forEach var="error" items="${errors}">
                    <li>${error}</li>
                </c:forEach>
            </ul>

        </div>
    </c:if>

    <form method="post" action="Controller?action=SignUp"
          novalidate="novalidate">
        <p>
            <label for="firstName">First Name</label><input type="text"
                                                            id="firstName" name="firstName" required value="<c:out value='${firstName}'/>"/>
        </p>
        <p>
            <label for="lastName">Last Name</label><input type="text"
                                                          id="lastName" name="lastName" required value="<c:out value='${lastName}'/>"/>
        </p>
        <p>
            <label for="email">Email</label><input type="email" id="email"
                                                   name="email" required value="<c:out value='${email}'/>"/>
        </p>
        <p>
            <label>Gender</label>
            <input type="radio" name="gender" value="male"> Male<br>
            <input type="radio" name="gender" value="female"> Female<br>
            <input type="radio" name="gender" value="other"> Other
        </p>
        <p>
            <label for="password">Password</label><input type="password"
                                                         id="password" name="password" required>
        </p>
        <p>
            <label for="reppassword">Repeat Password</label><input type="password"
                                                         id="reppassword" name="reppassword" required >
        </p>
        <p>
            <label for="age">Age</label><input type="text" id="age" name="age" required value="<c:out value='${age}'/>">
        </p>
        <p>
            <input type="submit" id="signUp" value="Sign Up">
        </p>

    </form>
</main>
<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home" />
</jsp:include>
</body>
</html>
