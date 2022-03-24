<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>chatbot example</title>

    <style>   	
        .chat_wrap { 
        	position:absolute;
        	left:50%; margin-left:-160px;
        	top:10%;
	        border:1px solid #999;
	        width:300px; padding:5px;
	        font-size:13px; color:#333; }
        .chat_wrap .inner{background-color:#acc2d2; border-radius:5px; padding:10px; overflow-y:scroll;height: 400px;}
        .chat_wrap .item{margin-top:15px}
        .chat_wrap .item:first-child{margin-top:0px}
        .chat_wrap .item .box{display:inline-block; max-width:180px; position:relative}
        .chat_wrap .item .box::before{content:""; position:absolute; left:-8px; top:9px; border-top:0px solid transparent; border-bottom:8px solid transparent;border-right:8px solid #fff;}
        .chat_wrap .item .box .msg {background:#fff; border-radius:10px; padding:8px; text-align:left}
        .chat_wrap .item .box .time {font-size:11px; color:#999; position:absolute; right: -75px; bottom:5px; width:70px}
        .chat_wrap .item.mymsg{text-align:right}
        .chat_wrap .item.mymsg .box::before{left:auto; right:-8px; border-left:8px solid #fee600; border-right:0;}
        .chat_wrap .item.mymsg .box .msg{background:#fee600}
        .chat_wrap .item.mymsg .box .time{right:auto; left:-75px}
        .chat_wrap .item .box{transition:all .3s ease-out; margin:0 0 0 20px;opacity:0}
        .chat_wrap .item.mymsg .box{transition:all .3s ease-out; margin:0 20px 0 0;}
        .chat_wrap .item.on .box{margin:0; opacity: 1;}

        input[id="question"]{border:0; width:100%;background:#ddd; border-radius:5px; height:30px; padding-left:5px; box-sizing:border-box; margin-top:5px}
        input[id="question"]::placeholder{color:#999}
    </style>
</head>
<body>	
	<div class="chat_wrap">
       <div class="inner">
           
           <!-- <div class="item">
               <div class="box">
                   <p class="msg">안녕하세요</p>
                   <span class="time">오전 10:05</span>
               </div>
           </div>

           <div class="item mymsg">
               <div class="box">
                   <p class="msg">안녕하세요</p>
                   <span class="time">오전 10:05</span>
               </div>
           </div> -->
          
       </div>
       <input id='question' class="mymsg" placeholder='질문을 입력하세요' >
   	</div>
</body>
</html>

<script type="text/javascript">

var currentTime = function(){
    var date = new Date();
    var hh = date.getHours();
    var mm = date.getMinutes();
    var apm = hh >12 ? "오후":"오전";
    var ct = apm + " "+hh+":"+mm+"";
    return ct;
}

//CALL Python(flask) CONNECTING API
function makeQuestionToModel(question) {	
	console.log("외부 api 사용해서 답변 생성하기 시작. 사용할 질문 : " + JSON.stringify(question));
	$.ajax({
		type : "GET",
		url : "http://127.0.0.1:5000/" + question,
		dataType :'json',
		async : false,
		success:function(data){
			console.log("답변 생성 성공. ai가 생성한 답변 : " + data.answer);
			// 같은 방식으로 
			var _tar2 = $(".chat_wrap .inner").append(
					'<div class="item yourmsg"><div class="box"><p class="msg">'
					+data.answer+'</p><span class="time">'+currentTime()+'</span></div></div>');
			var lastItem = $(".chat_wrap .inner").find(".item:last");
            setTimeout(function(){
                lastItem.addClass("on");
            },10);
		}
	})
	.fail(function() { alert("ajax를 사용한 외부 api(챗봇인공지능모델) 연결 실패.\n챗봇 답변생성 서버가 실행되고 있지 않은 상태일 수 있습니다."); });
}


//CALL DB CONNECTING API
function add(question, callback, error) {	
	$.ajax({
		type : 'post',
		url : '/questions/new',
		data : JSON.stringify(question),
		contentType : "application/json; charset=utf-8",
		success : function(result, status, xhr) {
			if (callback) {
				callback(result);
			}
		},
		error : function(xhr, status, er) {
			if (error) {
				error(er);
			}
		}
	})
	console.log("DB에 질문 입력하기 성공. 입력한 질문 : " + JSON.stringify(question));	
}

// ENTER PRESSED
$(function(){
    $("input[id='question']").keypress(function(e){
        if(e.keyCode == 13 && $(this).val().length){
            var _val = $(this).val();
            var _class = $(this).attr("class");
            $(this).val('');
            // html 변경
            var _tar = $(".chat_wrap .inner").append(
            		'<div class="item '+_class+'"><div class="box"><p class="msg">'
            		+_val+'</p><span class="time">'+currentTime()+'</span></div></div>');
            var lastItem = $(".chat_wrap .inner").find(".item:last");
            setTimeout(function(){
                lastItem.addClass("on");
            },10);
            
            // 모델 사용 API
            makeQuestionToModel(_val);
            
            // 질문 json화
            var question = {
            		question : _val
            };
            // json화 한 질문 DB 저장 API
            add(question);
            
            var position = lastItem.position().top + $(".chat_wrap .inner").scrollTop();
            // console.log(position);

            $(".chat_wrap .inner").stop().animate({scrollTop:position},500);
            
            console.log("답변하기, DB에 질문 넣기 성공.\n\n\n")
        }
    });
    
});
</script>
