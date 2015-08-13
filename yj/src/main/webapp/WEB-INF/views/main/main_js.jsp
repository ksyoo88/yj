<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>

<script type="text/javascript" src="resources/js/sockjs/sockjs-0.3.js"></script>
<script type="text/javascript">
	var socket;
	var registered = false;

	function startClient() {
		console.log("opening socket");
		//on http server use document.domain instead od "localhost"
		//Start the websocket client
		socket = new SockJS("http://" + document.domain + "/chat");

		//When the connection is opened, login.
		socket.onopen = function() {
			console.log("Opened socket.");
			//register the user
			//var nickname = $("#nickname").val();
			var nickname = "${member.name}";
			var userImage = "${member.photo}";
			socket.send(nickname+":"+userImage);
		};

		//When received a message, parse it and either add/remove user or post message.
		socket.onmessage = function(a) {
			//process the message here
			console.log("received message: " + a.data);
			var message = JSON.parse(a.data);
			if (message.addUser) {
				var d = document.createElement('div');
				var img = new Image(30,30);
				img.src = 'resources/images/profilephoto/'+message.userImage;
				
				$(d).addClass("username user").append(img).append(message.addUser).attr(
						"data-user", message.addUser).appendTo("#nicknamesBox");
			} else if (message.removeUser) {
				$(".user[data-user=" + message.removeUser + "]").remove();
			} else if (message.message) {
				var d = document.createElement('div');
				var suser = document.createElement('span');
				var smessage = document.createElement('span');
				var img = new Image(30,30);
				img.src = 'resources/images/profilephoto/'+message.userImage;

				$(suser).addClass("username").append(img).append(message.nickname + " : ")
						.appendTo($(d));
				$(smessage).text(message.message).appendTo($(d));
				$(d).appendTo("#chatBox");
				$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
			}

		}
		socket.onclose = function() {
			// document.write("Closed socket.");
		};
		socket.onerror = function() {
			document.write("Error during transfer.");
		};

		$('#txtMessage').keyup(function(e) {
			if (e.keyCode == 13) {
				sendMessage();
			}
		});
		$("#btnSend").click(function() {
			sendMessage();
		});

	}

	function sendMessage() {
		if ($("#txtMessage").val()) {
			socket.send($("#txtMessage").val());
			$("#txtMessage").val("");
		}
	}

	$(document).ready(function() {
		<sec:authorize access="isAuthenticated()">
			startClient();
		</sec:authorize>
	});
</script>