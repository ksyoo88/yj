<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/ihover.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" type="text/scc" href="resources/css/snsstyle.css">

<script type="text/javascript" src="resources/js/jquery/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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