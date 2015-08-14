<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js/mscroll/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap-slider.min.js"></script>
<script type="text/javascript" src="resources/js/lightbox.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
//리플 엔터
function replywrite() {
	$("#replywrite").click();
}
//리플삭제
function deletereply(replyno) {
	$.ajax({
		url:"deletereply.do",
		data:{replyno:replyno},
		type:"post",
		dataType:"json",
		success: function(result) {
			$("#replyNO"+replyno).remove();
			}
	})
}


$(function (){
	
	//라이트박스 실행
	lightbox.init();
	//좋아요
	$("#LikeBtn").click(function() {
		var likecheck=$("#photologLikeButton").attr("likecheck");
		var likeCheck;
		if(likecheck=='likebefore'){
			$("#photologLikeButton").attr("src","resources/images/panorama/likeafter.png");
			$("#photologLikeButton").attr("likecheck","likeafter");
			likeCheck=true;
		}else{
			$("#photologLikeButton").attr("src","resources/images/panorama/likebefore.png");
			$("#photologLikeButton").attr("likecheck","likebefore");
			likeCheck=false;
		}
		var panono=$(".title").data("panoNo");
		$.ajax({
			url:"panolike.do",
			data:{likecheck:likeCheck,panono:panono},
			type:"post",
			dataType:"json",
			success: function(result) {
				var panolikecnt=result.panolikecnt;
				
				$(".btn-act .count").html(panolikecnt);
			}
		})
	})
	
	//리플쓰기
	$("#replywrite").click(function() {
		var reply =$("#replyinput").val();
		var panono=$(".title").data("panoNo");
		var replyadd='';
		$.ajax({
			url:"panoreply.do",
			data:{reply:reply,panono:panono},
			type:"post",
			dataType:"json",
			success: function(result) {
				var replys=result.replys;
				
				
				for(var i=0;i<replys.length;i++){
					var d = new Date(replys[i].date);
					
					var month = d.getMonth() + 1;
					var year = d.getFullYear();
					var day = d.getDate();
					replyadd+='<tr id="replyNO'+replys[i].panoReplyNo+'"><td>	<div class="user"><div class="profile user-photo"><div class="memberProfileImage profileImageMedium" style="position: relative; "><img src="resources/images/profilephoto/'+replys[i].member.photo+'" class="img-circle" width="45px" height="45px"style="margin-top: 3px;"></div></div></div></td>'
					replyadd+='<td><div class="userName t-name" >'+replys[i].member.name+'</div></td>';
					replyadd+='<td>	<div>'+replys[i].reply+'</div></td>';
					replyadd+='<td><div>'+year+'/'+month+'/'+day+'</div></td>';
					if(replys[i].member.no=='${member.no}'){
					replyadd+='<td><c:if test="${replys.member.no == member.no }"><button type="button" onclick="deletereply('+replys[i].panoReplyNo+')" data-reply-no="'+replys[i].panoReplyNo+'" class="btn btn-danger">삭제</button>  </c:if></td></tr>';
					}
			
				}
				$("#replyinput").val("");
			$("#panoReplyShow tbody").html(replyadd);
			
			}
		})
	})	
	
 
    $( "#opener" ).click(function() {
      $( "#dialog" ).dialog( "open" );
    });
	
	
		 $( "#dialog" ).dialog({
			 autoOpen: false,
		      resizable: false,
		      height:200,
		      modal: true,
		      buttons: {
		        "삭제": function() {
		        var panono=$(".title").data("panoNo");
		         	$.ajax({
		         		url:"deletePanorama.do",
		         		data:{panoNo:panono},
		    			type:"post",
		    			dataType:"json",
		    			success: function(result) {
		    				
		    				location.href='/mypage.do';
		    			}
		         	})
		        	
		        },
		        "취소": function() {
		          $( this ).dialog( "close" );
		        }
		      }
		    }); 
	//삭제 버튼
	$(".btn-delete").click(function() {
		 $( "#dialog" ).dialog( "open" );
	})
	
});
</script>
