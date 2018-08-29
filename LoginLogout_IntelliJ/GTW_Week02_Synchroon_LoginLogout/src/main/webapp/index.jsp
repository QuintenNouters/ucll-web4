<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param name="title" value="Home" />
</jsp:include>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>
	<main>
	<p>Veel succes!</p>
<c:if test="${errors.size()>0 }">
	<div class="danger">
		<ul>
			<c:forEach var="error" items="${errors }">
				<li>${error }</li>
			</c:forEach>
			</ul>
			</div>
		</c:if>
		<c:choose>
			<c:when test="${user!=null}">
				<p>Welcome ${user.getFirstName()}!</p>
				<form method="post" action="Controller?action=LogOut">
					<p>
						<input type="submit" id="logoutbutton" value="Log Out">
					</p>
				</form>
			</c:when>
		<c:otherwise>
		<form method="post" action="Controller?action=LogIn">
			<p>
				<label for="email">Your email </label>
				<input type="text" id="email" name="email" value="jan@ucll.be">
			</p>
			<p>
				<label for="password">Your password</label>
				<input type="password" id="password" name="password" value="t">
			</p>
			<p>
				<input type="submit" id="loginbutton" value="Log in">
			</p>
		</form>
		</c:otherwise>
	</c:choose>
		<p>
			<div id="amountFriendsOnline"></div>
			<div id="amountFriendsOffline"></div>
		</p>
		<div id="post1" class="post">
			<div class="body">
				<div class="title">
					<H3>Was het een interessante projectweek?</H3>
				</div>
				<div class="text">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id lobortis est, ac molestie elit. Etiam at nibh nibh. Praesent id odio nec massa mattis luctus vitae eu mauris. Praesent turpis erat, mattis a arcu nec, varius vehicula lorem. Aenean laoreet, enim vulputate iaculis elementum, ex purus feugiat leo, nec posuere mauris mauris et lacus. Donec eget ipsum ac ante tincidunt porttitor at ut nunc. Phasellus rutrum pulvinar dolor, quis finibus nibh. Aliquam dapibus mattis molestie.</p>
					<p>Nunc at cursus sem. Fusce suscipit euismod neque quis tincidunt. Duis eleifend consectetur felis, vel egestas ipsum fermentum a. Nullam cursus sem a leo suscipit pretium. Cras faucibus urna libero, vel suscipit mauris luctus non. Nullam porttitor erat at lorem semper, non condimentum quam condimentum. Phasellus et vehicula enim, et scelerisque turpis. Etiam sit amet mattis quam. Integer ut urna odio. Sed felis nunc, iaculis non consectetur quis, tincidunt quis magna. Quisque condimentum aliquam elit quis eleifend.</p>
				</div>
			</div>
			<div id="post1_comments" class="comments">
				<div style="display: none"><p>${post1}</p></div>
				<c:forEach var="comment" items="${post1}">
					<div class="comment">
						<div class="username">
							<p>${comment.name}</p>
						</div>
						<div class="text">
							<p>${comment.text}</p>
						</div>
						<div class="rating">
							<p>${comment.rating}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="entercomment">
				<p>
					<label for="post1_comment_name">Name</label>
					<input type="text" class="comment" name="commentname" id="post1_comment_name" value="Name">
				</p>
				<p>
					<label for="post1_comment_text">Comment</label>
					<input type="text" class="comment" name="commenttext" id="post1_comment_text" value="Comment">
				</p>
				<p>
					<label for="post1_comment_rating">Rating</label>
					<input type="number" class="comment" name="rating" id="post1_comment_rating" value="5" min="0" max="10">
				</p>
				<p>
					<input type="button" class="submitcomment" id="post1_comment_send" value="Send" onclick="send('post1')">
				</p>
			</div>
		</div>


		<div id="post2" class="post">
			<div class="body">
				<div class="title">
					<H3>Wat ben je van plan om te doen vandaag?</H3>
				</div>
				<div class="text">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id lobortis est, ac molestie elit. Etiam at nibh nibh. Praesent id odio nec massa mattis luctus vitae eu mauris. Praesent turpis erat, mattis a arcu nec, varius vehicula lorem. Aenean laoreet, enim vulputate iaculis elementum, ex purus feugiat leo, nec posuere mauris mauris et lacus. Donec eget ipsum ac ante tincidunt porttitor at ut nunc. Phasellus rutrum pulvinar dolor, quis finibus nibh. Aliquam dapibus mattis molestie.</p>
					<p>Nunc at cursus sem. Fusce suscipit euismod neque quis tincidunt. Duis eleifend consectetur felis, vel egestas ipsum fermentum a. Nullam cursus sem a leo suscipit pretium. Cras faucibus urna libero, vel suscipit mauris luctus non. Nullam porttitor erat at lorem semper, non condimentum quam condimentum. Phasellus et vehicula enim, et scelerisque turpis. Etiam sit amet mattis quam. Integer ut urna odio. Sed felis nunc, iaculis non consectetur quis, tincidunt quis magna. Quisque condimentum aliquam elit quis eleifend.</p>
				</div>
			</div>
			<div id="post2_comments" class="comments">
				<div style="display: none"><p>${post2}</p></div>
				<c:forEach var="comment" items="${post2}">
					<div class="comment">
						<div class="username">
							<p>${comment.name}</p>
						</div>
						<div class="text">
							<p>${comment.text}</p>
						</div>
						<div class="rating">
							<p>${comment.rating}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="entercomment">
				<p>
					<label for="post2_comment_name">Name</label>
					<input type="text" class="comment" name="commentname" id="post2_comment_name" value="Name">
				</p>
				<p>
					<label for="post2_comment_text">Comment</label>
					<input type="text" class="comment" name="commenttext" id="post2_comment_text" value="Comment">
				</p>
				<p>
					<label for="post2_comment_rating">Rating</label>
					<input type="number" class="comment" name="rating" id="post2_comment_rating" value="5" min="0" max="10">
				</p>
				<p>
					<input type="button" class="submitcomment" id="post2_comment_send" value="Send" onclick="send('post2')">
				</p>

			</div>
		</div>

		<div id="post3" class="post">
			<div class="body">
				<div class="title">
					<H3>Naar welke muziek ben je momenteel aan het luisteren?</H3>
				</div>
				<div class="text">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id lobortis est, ac molestie elit. Etiam at nibh nibh. Praesent id odio nec massa mattis luctus vitae eu mauris. Praesent turpis erat, mattis a arcu nec, varius vehicula lorem. Aenean laoreet, enim vulputate iaculis elementum, ex purus feugiat leo, nec posuere mauris mauris et lacus. Donec eget ipsum ac ante tincidunt porttitor at ut nunc. Phasellus rutrum pulvinar dolor, quis finibus nibh. Aliquam dapibus mattis molestie.</p>
					<p>Nunc at cursus sem. Fusce suscipit euismod neque quis tincidunt. Duis eleifend consectetur felis, vel egestas ipsum fermentum a. Nullam cursus sem a leo suscipit pretium. Cras faucibus urna libero, vel suscipit mauris luctus non. Nullam porttitor erat at lorem semper, non condimentum quam condimentum. Phasellus et vehicula enim, et scelerisque turpis. Etiam sit amet mattis quam. Integer ut urna odio. Sed felis nunc, iaculis non consectetur quis, tincidunt quis magna. Quisque condimentum aliquam elit quis eleifend.</p>
				</div>
			</div>
			<div id="post3_comments" class="comments">
				<div style="display: none"><p>${post3}</p></div>
				<c:forEach var="comment" items="${post3}">
					<div class="comment">
						<div class="username">
							<p>${comment.name}</p>
						</div>
						<div class="text">
							<p>${comment.text}</p>
						</div>
						<div class="rating">
							<p>${comment.rating}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="entercomment">
				<p>
					<label for="post3_comment_name">Name</label>
					<input type="text" class="comment" name="commentname" id="post3_comment_name" value="Name">
				</p>
				<p>
					<label for="post3_comment_text">Comment</label>
					<input type="text" class="comment" name="commenttext" id="post3_comment_text" value="Comment">
				</p>
				<p>
					<label for="post3_comment_rating">Rating</label>
					<input type="number" class="comment" name="rating" id="post3_comment_rating" value="5" min="0" max="10">
				</p>
				<input type="button" class="submitcomment" id="post3_comment_send" value="Send" onclick="send('post3')">
			</div>
		</div>

		<div id="post4" class="post">
			<div class="body">
				<div class="title">
					<H3>Wat zijn de examenvragen voor het vak Web4</H3>
				</div>
				<div class="text">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id lobortis est, ac molestie elit. Etiam at nibh nibh. Praesent id odio nec massa mattis luctus vitae eu mauris. Praesent turpis erat, mattis a arcu nec, varius vehicula lorem. Aenean laoreet, enim vulputate iaculis elementum, ex purus feugiat leo, nec posuere mauris mauris et lacus. Donec eget ipsum ac ante tincidunt porttitor at ut nunc. Phasellus rutrum pulvinar dolor, quis finibus nibh. Aliquam dapibus mattis molestie.</p>
					<p>Nunc at cursus sem. Fusce suscipit euismod neque quis tincidunt. Duis eleifend consectetur felis, vel egestas ipsum fermentum a. Nullam cursus sem a leo suscipit pretium. Cras faucibus urna libero, vel suscipit mauris luctus non. Nullam porttitor erat at lorem semper, non condimentum quam condimentum. Phasellus et vehicula enim, et scelerisque turpis. Etiam sit amet mattis quam. Integer ut urna odio. Sed felis nunc, iaculis non consectetur quis, tincidunt quis magna. Quisque condimentum aliquam elit quis eleifend.</p>
				</div>
			</div>
			<div id="post4_comments" class="comments">
				<div style="display: none"><p>${post4}</p></div>
				<c:forEach var="comment" items="${post4}">
					<div class="comment">
						<div class="username">
							<p>${comment.name}</p>
						</div>
						<div class="text">
							<p>${comment.text}</p>
						</div>
						<div class="rating">
							<p>${comment.rating}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="entercomment">
				<p>
					<label for="post4_comment_name">Name</label>
					<input type="text" class="comment" name="commentname" id="post4_comment_name" value="Name">
				</p>
				<p>
					<label for="post4_comment_text">Comment</label>
					<input type="text" class="comment" name="commenttext" id="post4_comment_text" value="Comment">
				</p>
				<p>
					<label for="post4_comment_rating">Rating</label>
					<input type="number" class="comment" name="rating" id="post4_comment_rating" value="5" min="0" max="10">
				</p>
				<input type="button" class="submitcomment" id="post4_comment_send" value="Send" onclick="send('post4')">
			</div>
		</div>

		<div id="post5" class="post">
			<div class="body">
				<div class="title">
					<H3>Welke videogames speel je momenteel?</H3>
				</div>
				<div class="text">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id lobortis est, ac molestie elit. Etiam at nibh nibh. Praesent id odio nec massa mattis luctus vitae eu mauris. Praesent turpis erat, mattis a arcu nec, varius vehicula lorem. Aenean laoreet, enim vulputate iaculis elementum, ex purus feugiat leo, nec posuere mauris mauris et lacus. Donec eget ipsum ac ante tincidunt porttitor at ut nunc. Phasellus rutrum pulvinar dolor, quis finibus nibh. Aliquam dapibus mattis molestie.</p>
					<p>Nunc at cursus sem. Fusce suscipit euismod neque quis tincidunt. Duis eleifend consectetur felis, vel egestas ipsum fermentum a. Nullam cursus sem a leo suscipit pretium. Cras faucibus urna libero, vel suscipit mauris luctus non. Nullam porttitor erat at lorem semper, non condimentum quam condimentum. Phasellus et vehicula enim, et scelerisque turpis. Etiam sit amet mattis quam. Integer ut urna odio. Sed felis nunc, iaculis non consectetur quis, tincidunt quis magna. Quisque condimentum aliquam elit quis eleifend.</p>
				</div>
			</div>
			<div id="post5_comments" class="comments">
				<div style="display: none"><p>${post5}</p></div>
				<c:forEach var="comment" items="${post5}">
					<div class="comment">
						<div class="username">
							<p>${comment.name}</p>
						</div>
						<div class="text">
							<p>${comment.text}</p>
						</div>
						<div class="rating">
							<p>${comment.rating}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="entercomment">
				<p>
					<label for="post5_comment_name">Name</label>
					<input type="text" class="comment" name="commentname" id="post5_comment_name" value="Name">
				</p>
				<p>
					<label for="post5_comment_text">Comment</label>
					<input type="text" class="comment" name="commenttext" id="post5_comment_text" value="Comment">
				</p>
				<p>
					<label for="post5_comment_rating">Rating</label>
					<input type="number" class="comment" name="rating" id="post5_comment_rating" value="5" min="0" max="10">
				</p>
				<input type="button" class="submitcomment" id="post5_comment_send" value="Send" onclick="send('post5')">
			</div>
		</div>

		<div id="post6" class="post">
			<div class="body">
				<div class="title">
					<H3>Wat is je favoriete youtuber?</H3>
				</div>
				<div class="text">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id lobortis est, ac molestie elit. Etiam at nibh nibh. Praesent id odio nec massa mattis luctus vitae eu mauris. Praesent turpis erat, mattis a arcu nec, varius vehicula lorem. Aenean laoreet, enim vulputate iaculis elementum, ex purus feugiat leo, nec posuere mauris mauris et lacus. Donec eget ipsum ac ante tincidunt porttitor at ut nunc. Phasellus rutrum pulvinar dolor, quis finibus nibh. Aliquam dapibus mattis molestie.</p>
					<p>Nunc at cursus sem. Fusce suscipit euismod neque quis tincidunt. Duis eleifend consectetur felis, vel egestas ipsum fermentum a. Nullam cursus sem a leo suscipit pretium. Cras faucibus urna libero, vel suscipit mauris luctus non. Nullam porttitor erat at lorem semper, non condimentum quam condimentum. Phasellus et vehicula enim, et scelerisque turpis. Etiam sit amet mattis quam. Integer ut urna odio. Sed felis nunc, iaculis non consectetur quis, tincidunt quis magna. Quisque condimentum aliquam elit quis eleifend.</p>
				</div>
			</div>
			<div id="post6_comments" class="comments">
				<div style="display: none"><p>${post6}</p></div>
				<c:forEach var="comment" items="${post6}">
					<div class="comment">
						<div class="username">
							<p>${comment.name}</p>
						</div>
						<div class="text">
							<p>${comment.text}</p>
						</div>
						<div class="rating">
							<p>${comment.rating}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="entercomment">
				<p>
					<label for="post6_comment_name">Name</label>
					<input type="text" class="comment" name="commentname" id="post6_comment_name" value="Name">
				</p>
				<p>
					<label for="post6_comment_text">Comment</label>
					<input type="text" class="comment" name="commenttext" id="post6_comment_text" value="Comment">
				</p>
				<p>
					<label for="post6_comment_rating">Rating</label>
					<input type="number" class="comment" name="rating" id="post6_comment_rating" value="5" min="0" max="10">
				</p>
				<input type="button" class="submitcomment" id="post6_comment_send" value="Send" onclick="send('post6')">
			</div>
		</div>

		<div id="post7" class="post">
			<div class="body">
				<div class="title">
					<H3>Welke blog vragen kan ik nog op deze blog zetten?</H3>
				</div>
				<div class="text">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id lobortis est, ac molestie elit. Etiam at nibh nibh. Praesent id odio nec massa mattis luctus vitae eu mauris. Praesent turpis erat, mattis a arcu nec, varius vehicula lorem. Aenean laoreet, enim vulputate iaculis elementum, ex purus feugiat leo, nec posuere mauris mauris et lacus. Donec eget ipsum ac ante tincidunt porttitor at ut nunc. Phasellus rutrum pulvinar dolor, quis finibus nibh. Aliquam dapibus mattis molestie.</p>
					<p>Nunc at cursus sem. Fusce suscipit euismod neque quis tincidunt. Duis eleifend consectetur felis, vel egestas ipsum fermentum a. Nullam cursus sem a leo suscipit pretium. Cras faucibus urna libero, vel suscipit mauris luctus non. Nullam porttitor erat at lorem semper, non condimentum quam condimentum. Phasellus et vehicula enim, et scelerisque turpis. Etiam sit amet mattis quam. Integer ut urna odio. Sed felis nunc, iaculis non consectetur quis, tincidunt quis magna. Quisque condimentum aliquam elit quis eleifend.</p>
				</div>
			</div>
			<div id="post7_comments" class="comments">
				<div style="display: none"><p>${post7}</p></div>
				<c:forEach var="comment" items="${post7}">
					<div class="comment">
						<div class="username">
							<p>${comment.name}</p>
						</div>
						<div class="text">
							<p>${comment.text}</p>
						</div>
						<div class="rating">
							<p>${comment.rating}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="entercomment">
				<p>
					<label for="post7_comment_name">Name</label>
					<input type="text" class="comment" name="commentname" id="post7_comment_name" value="Name">
				</p>
				<p>
					<label for="post7_comment_text">Comment</label>
					<input type="text" class="comment" name="commenttext" id="post7_comment_text" value="Comment">
				</p>
				<p>
					<label for="post7_comment_rating">Rating</label>
					<input type="number" class="comment" name="rating" id="post7_comment_rating" value="5" min="0" max="10">
				</p>
				<input type="button" class="submitcomment" id="post7_comment_send" value="Send" onclick="send('post7')">
			</div>
		</div>
	</main>

	<jsp:include page="footer.jsp">
		<jsp:param name="title" value="Home" />
	</jsp:include>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function online(){
	    $.ajax({
			type: "GET",
			url: "Controller?action=GetFriendsAmountOnline",
			dataType: "json",
			success: function(json){
			    $('#amountFriendsOnline').text("Online: " + json.toString());
			    setTimeout(online, 2500);
			}
		})
	})
</script>
<script type="text/javascript">
    $(document).ready(function offline(){
        $.ajax({
            type: "GET",
            url: "Controller?action=GetFriendsAmountOffline",
            dataType: "json",
            success: function(json){
                $('#amountFriendsOffline').text("Offline: " + json.toString());
                setTimeout(offline, 2500);
            }
        })
    })
</script>
<script type="text/javascript" src="js/comments.js" onload="openSocket()"></script>
