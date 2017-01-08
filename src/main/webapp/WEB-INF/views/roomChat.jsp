
<script src="http://cdn.sockjs.org/sockjs-0.3.4.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.0/stomp.js"></script>
</head>


<button id="stop">Zatrzymaj</button>

<form id="spittleForm">
	<textarea rows="4" cols="60" name="text"></textarea>
	<input type="text" name="reciver" /> <input type="submit" />
</form>

<script th:inline="javascript">
	$('#spittleForm').submit(function(e) {
		e.preventDefault();
		var text = $('#spittleForm').find('textarea[name="text"]').val();
		var re = $('#spittleForm').find('input[name="reciver"]').val();
		sendMessage(text, re);
	});

	var sock = new SockJS('http://localhost:8080/cookbook/roomGame');
	var stomp = Stomp.over(sock);

	stomp.connect('guest', 'guest', function(frame) {
		console.log('*****  Nawiązano połączenie  *****');
		stomp.subscribe("/user/queue/roomGame", handleNotification);
	});

	function handleNotification(message) {
		console.log('Powiadomienie: ', message);
		$('#output').append(
				"<b>" + JSON.parse(message.body).user + "</b>("
						+ JSON.parse(message.body).date + "):"
						+ JSON.parse(message.body).message + "<br/>")
	}

	function sendMessage(text, re) {
		console.log("Wysyłanie spittle'a");
		stomp.send("/app/roomGame", {}, JSON.stringify({
			'message' : text,
			'to' : re,
			'roomId' : '1'
		}));
	}

	$('#stop').click(function() {
		sock.close()
	});
</script>

<div id="output"></div>

