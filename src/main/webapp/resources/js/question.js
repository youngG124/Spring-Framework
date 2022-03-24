console.log("question.js loaded");

var answerService = (function() {	
	function get(rno, callback, error) {
		
		$.get("/answers/" + rno + ".json", function(result) {
			
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
		
	return {
		get : get
	};
})();