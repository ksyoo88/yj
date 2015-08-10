<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>

<div class="container-fuild">
	<div class="col-md-4" id="left-tab">
		<h1>제목 : ${plan.title }</h1>
		<p>여행기간 : ${plan.startDayDate } ~ ${plan.finishDayDate }</p>
		<p>좋아요 수 : ${plan.likeCnt }</p>
		<p>총 여행일 수 : ${plan.trevelCnt }</p>
		<p>작성자 : ${member.no }</p>
	</div>
	<div class="col-md-8" id="contents-tab">	
		<div id="map-box"></div>
	</div>
</div>