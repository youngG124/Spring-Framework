<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<title>Home</title>
</head>
<body>
<h1 id='document_name'>
	chat bot name example
</h1>

<link rel="stylesheet" href="resources/css/chatbot.css">
<div id='bodybox'>
  <div id='chatborder'>
  	<p id="chatlog12" class="chatlog_me">&nbsp;</p>
  	<p id="chatlog11" class="chatlog_bot">&nbsp;</p>
  	<p id="chatlog10" class="chatlog_me">&nbsp;</p>
  	<p id="chatlog9" class="chatlog_bot">&nbsp;</p>
  	<p id="chatlog8" class="chatlog_me">&nbsp;</p>
    <p id="chatlog7" class="chatlog_bot">&nbsp;</p>
    <p id="chatlog6" class="chatlog_me">&nbsp;</p>
    <p id="chatlog5" class="chatlog_bot">&nbsp;</p>
    <p id="chatlog4" class="chatlog_me">&nbsp;</p>
    <p id="chatlog3" class="chatlog_bot">&nbsp;</p>
    <p id="chatlog2" class="chatlog_me">&nbsp;</p>
    <p id="chatlog1" class="chatlog_bot">&nbsp;</p>
    <input type="text" name="chat" id="chatbox" placeholder="Hi there! Type here to talk to me." onfocus="placeHolder()">
  </div>
</div>


</body>
</html>

<script type="text/javascript" src="/resources/js/chatbot.js"></script>
<script type="text/javascript" src="/resources/js/answer.js"></script>
<script type="text/javascript" src="/resources/js/question.js"></script>

<script type="text/javascript">

// pushing question test using question.js
questionService.add(
	{question:"questioning using js test!"},
	function(result) {
		alert("REsult : "+ result);
	}
)

// fetching answer using answer.js
/* $(document).ready(function() {
	console.log("answer fetching : ")
	answerService.get(3, function(data){
		console.log(data);
	});		
}); */

</script>