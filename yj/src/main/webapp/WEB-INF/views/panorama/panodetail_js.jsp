<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js/mscroll/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap-slider.min.js"></script>
<script type="text/javascript" src="resources/js/lightbox.js"></script>
<script type="text/javascript">




$(function (){
	lightbox.init();
	
	
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
	
	
	
	
});
</script>
