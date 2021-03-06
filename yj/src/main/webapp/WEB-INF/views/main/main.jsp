<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
	<!-- 
	<div class="container-fluid">
		<div class="jumbotron">
			<h1>무슨 용도로 사용할까?</h1>
			<p>사진관련?</p>
		</div>
	</div>
	 -->
	<sec:authorize access="isAuthenticated()">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading" id="accordion">
						<span class="glyphicon glyphicon-comment"></span> Chat
						<div class="btn-group pull-right">
							<a type="button" class="btn btn-default btn-xs" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
								<span class="glyphicon glyphicon-chevron-down"></span>
							</a>
						</div>
					</div>
					<div class="panel-collapse collapse" id="collapseOne">
						<div class="row">
							<div class="col-xs-9">
								<div class="contentDiv" id="chatBox">
									<!--           <div><span class="username">hsilomedus : </span><span>whass uuup?</span></div> -->
								</div>
							</div>
							<div class="col-xs-3">
								<div class="contentDiv" id="nicknamesBox">
									<!--           <div class="username">hsilomedus</div> -->
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 10px;">
							<div class="col-xs-7">
								<input type="text" id="txtMessage" class="form-control" placeholder="Type your message here." />
							</div>
							<div class="col-xs-2">
								<button id="btnSend" class="btn btn-primary" style="width: 100%;">Send</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</sec:authorize>
	<div class="container-fluid text-center main-tour">
		<span class="sub_title">나만의 여행을 만들어 보세요!</span>
		<h1><span>미리 떠나는 나만의 여행<br />시작해 볼까요?</span></h1>
		<ul class="main_btn">
			<li class="pink"><a href="/attraction.do"><span class="hand">여기추천</span></a></li>
			<li class="sky"><a href="/plan.do"><span class="hand">저기가자</span></a></li>
		</ul>
	</div>
	
	<!-- From top and bottom-->
	<div class="container-fluid text-center main-plan">
		<h2>
			<span class="small-title">추천일정</span><br>
		</h2>
		<h3>여기저기 사용자들의 알찬 여행정보를 공유합니다.</h3>
		<div class="row">
			<c:forEach var="item" items="${planlist }">
			<div class="col-md-3">
				<!-- normal -->
				<div class="ih-item square colored effect6 from_top_and_bottom">
					<a href="plandetail.do?no=${item.no }">
							<div class="posAbsolute type_band type_band_color2">PLAN</div>
						<div class="img" style="height: 292px;">
							<img alt="" src="${item.firstimage }"/>
						</div>
						<div class="info">
							<h3>${item.place_title }</h3>
						</div>
						<div class="detail">
							<h4 style="text-align:center; white-space: nowrap; text-overflow:ellipsis; overflow:hidden;"> ${item.title } </h4>							
							<div class="desc">
								<h3><span class="colorBlueTeal">${item.place_title }</span></h3>
							</div>
						</div>
					</a>
				</div>
				<div class="cnts">
<%-- 					<span class="hand like">좋아요 ${item.like }</span> --%>
				</div>
				<!-- end normal -->
			</div>
			</c:forEach>
		</div>
	<!-- end From top and bottom-->
	</div>
	<!-- ======================================================================================================= -->
	<div class="container-fluid text-center main-place">
		<h2>
			<span class="small-title">추천장소</span><br>
		</h2>
		<h3>엄선된 도시와 장소정보를 공유합니다.</h3>
		<c:forEach var="place" items="${placeList }">
		<div class="colored effect3 from_top_and_bottom">
			<a href="/plan.do?$contentid=${place.contentid }">
				<div class="img"  style="height: 250px;">
					<img alt="" src="${place.firstimage }" />
				</div>
				<div class="info">
					<h3>${place.title }</h3>
				</div>
			</a>
		</div>
		</c:forEach>
	</div>
	<!-- ======================================================================================================= -->
	
	
	<div class="container-fluid text-center">
		<div class="main-footer">
			<h2>
				<img src="resources/images/title_makeshare.png">
			</h2>
			<h3>여행을 계획하고 공유해보세요. 최고의 여행파트너 여기저기가 함께합니다.</h3>
			<ul>
				<li class="icon0"></li>
				<li class="icon1"></li>
				<li class="icon2"></li>
				<li class="icon3"></li>
				<li class="icon4"></li>
				<li class="icon5"></li>
				<li class="icon6"></li>
				<li class="icon7 last"></li>
			</ul>
			<p>
				여기저기에서 함께 놀고, 여기저기로 함께 여행하고 여기저기에서 함께 여행의 추억을 간직하세요.
			</p>
		</div>
	</div>