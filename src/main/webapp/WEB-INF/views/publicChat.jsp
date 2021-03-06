<script src="http://cdn.sockjs.org/sockjs-0.3.4.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.0/stomp.js"></script>
<h1>CHAT</h1>
<div class="cointainer" align="right">
	<c:if test="${not empty session}">
		<form id="spittleForm">
			<textarea rows="4" cols="50" name="text"></textarea>
			<input class="btn btn-md btn-success btn-block" type="submit"
				value="Wyslij" />
		</form>
	</c:if>
	<script th:inline="javascript">
		var sock = new SockJS('http://localhost:8080/cookbook/publicChat');
		var stomp = Stomp.over(sock);

		$('#spittleForm').submit(function(e) {
			e.preventDefault();
			var text = $('#spittleForm').find('textarea[name="text"]').val();
			if (text != null)
				stomp.send("/app/chat", {}, JSON.stringify({
					'message' : text
				}));
		});

		stomp.connect('guest', 'guest', function(frame) {
			console.log('*****  Nawiązano połączenie  *****');
			stomp.subscribe("/topic/chat", handleChat);
		});

		function handleChat(message) {
			console.log('Odebrano komunikat: ', message);
			$('#output').append(
					"<b>" + JSON.parse(message.body).user + "</b>("
							+ JSON.parse(message.body).date + "):"
							+ JSON.parse(message.body).message + "<br/>")
		}

		function handleErrors(message) {
			console.log('WYSTÃÂÃÂPIÃÂÃÂ BÃÂÃÂÃÂÃÂD: ', message);
			$('#output').append(
					"<b>WYSTÃÂÃÂPIÃÂÃÂ BÃÂÃÂÃÂÃÂD!!!: "
							+ JSON.parse(message.body).message + "</b><br/>")
		}

		$('#stop').click(function() {
			sock.close()
		});
	</script>

	<div id="output"></div>
</div>
