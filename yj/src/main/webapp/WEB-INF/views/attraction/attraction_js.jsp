<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>

<script type="text/javascript" src="resources/js/mscroll/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap-slider.min.js"></script>
<script type="text/javascript">
$(function() {
	var amount=Math.max.apply(Math,$(".theme-city-list .city-box").map(function(){return $(this).outerWidth(true);}).get());
	$(".theme-city-list").mCustomScrollbar({
		axis:"x",
		theme:"inset",
		advanced:{
			autoExpandHorizontalScroll:true
		},
		scrollButtons:{
			enable:true,
			scrollType:"stepped"
		},
		keyboard:{scrollType:"stepped"},
		snapAmount:amount,
		mouseWheel:{scrollAmount:amount}
	});
	
	$(".favorbar input").slider({
		reversed : true,
		formatter: function(value) {
			var result = "";
			if(value == 0) {
				result = "하";
			} else if(value == 1) {
				result = "중";
			} else if(value == 2) {
				result = "상";
			}
			return result;
		}
	});
});
</script>