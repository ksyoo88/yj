<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">이미지</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">여기추천</a></li>
					<li><a href="#about">저기가자</a></li>
					<li><a href="#contact">같이보자</a></li>
				</ul>
				<div class="navbar-right">
					<form class="navbar-form">
						<a href="" class="btn btn-default">로그인</a>
						<!-- <a href="" class="btn btn-default">로그아웃</a> -->
						<a href="" class="btn btn-default">회원가입</a>
						<div class="form-group">
							<input type="text" placeholder="가고싶은 곳을 찾아보세요." class="form-control">
						</div>
						<button type="submit" class="btn btn-default">검색</button>
					</form>
				</div>
			</div>
		</div>
	</nav>