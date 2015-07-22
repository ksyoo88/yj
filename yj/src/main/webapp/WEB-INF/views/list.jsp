<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB에 접속해서 리스트 뿌려주기</title>
</head>
<body>
<div>
	<span>먼저 employees 테이블을 사용하자</span>
	<c:forEach var="emp" items="${empList }">
		<p>${emp.lastName }</p>
	</c:forEach>
</div>
</body>
</html>