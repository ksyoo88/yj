<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
#membername {padding: 10px;}
</style>
<tiles:insertAttribute name="style" ignore="true" />
<script type="text/javascript" src="resources/js/jquery/jquery-1.11.3.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<tiles:insertAttribute name="javascript" ignore="true" />
<script type="text/javascript">
//no image
var setImage404 = function () {
	$('img').error(function () {
		$(this).data('old', $(this).attr("src"));
		$(this).attr('src', 'resources/images/common/noimage.gif');
	}).each(function() {
		$(this).attr("src", $(this).attr("src"));
	});
};

$(function () {
	// layout 관련
	setImage404();				// no image

	// logout
	$("a[href='/logout']").on("click", function(event){
		event.preventDefault();
		$logoutForm = $("#logoutForm");
		$logoutForm.submit();
	});
});

</script>
</head>
<body>
<!-- 헤더 정보가 들어갈 영역 -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>

<!-- 콘텐츠 정보가 들어갈 영역 -->
<tiles:insertAttribute name="content"></tiles:insertAttribute>

<!-- 푸터 정보가 들어갈 영역 -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>