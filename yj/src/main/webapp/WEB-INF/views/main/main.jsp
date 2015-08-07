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
	<div class="container-fluid text-center main-tour">
		<span class="sub_title">나만의 여행을 만들어 보세요!</span>
		<h1><span>미리 떠나는 나만의 여행<br />시작해 볼까요?</span></h1>
		<ul class="main_btn">
			<li class="pink"><span class="hand">여기추천</span></li>
			<li class="sky"><span class="hand">저기가자</span></li>
		</ul>
	</div>
	
	<!-- From top and bottom-->
	<div class="container-fluid text-center main-plan">
		<h2>
			<span class="small-title">추천일정</span><br>
		</h2>
		<h3>여기저기 사용자들의 알찬 여행정보를 공유합니다.</h3>
		<div class="row">
			<div class="col-md-3">
	
				<!-- normal -->
				<div class="ih-item square colored effect6 from_top_and_bottom">
					<a href="#">
							<div class="posAbsolute type_band type_band_color2">PLAN</div>
						<div class="img">
							<img alt="" src="resources/images/test.jpg"/>
						</div>
						<div class="info">
							<h3>1881 헤리티지(1881 Heritage)</h3>
							<div style="color: white;">
								연희동에 새로운 맛집으로 자리매김하고있는 Ellie. 아메리칸 스타일의 홈메이드 브런치는 물론, 특별 예약을 했을때가격
							</div>
						</div>
						<div class="detail">
							<div class="desc">
								1881 헤리티지(1881 Heritage) <br>
								<span class="colorBlueTeal">Hong Kong</span>
							</div>
							<div class="userName" data-uno="9">
								<span>Hana Tour</span>
							</div>
							<div class="date">2013.01.11 09:56</div>
						</div>
					</a>
				</div>
				<div class="cnts">
					<span class="hand like">좋아요 9</span>&nbsp;&nbsp;<span class="hand review">리뷰 0</span>
				</div>
				<!-- end normal -->
			</div>
			<div class="col-md-3">
				<!-- colored -->
				<div class="ih-item square colored effect6 from_top_and_bottom">
					<a href="#">
						<div class="posAbsolute type_band type_band_color2">PLAN</div>
						<div class="img">
							<img alt="" src="resources/images/test.jpg" />
						</div>
						<div class="info">
							<h3>1881 헤리티지(1881 Heritage)</h3>
							<div style="color: white;">
								연희동에 새로운 맛집으로 자리매김하고있는 Ellie. 아메리칸 스타일의 홈메이드 브런치는 물론, 특별 예약을 했을때가격
							</div>
						</div>
						<div class="detail">
							<div class="desc">
								1881 헤리티지(1881 Heritage) <br>
								<span class="colorBlueTeal">Hong Kong</span>
							</div>
							<div class="userName" data-uno="9">
								<span>Hana Tour</span>
							</div>
							<div class="date">2013.01.11 09:56</div>
						</div>
					</a>
				</div>
				<div class="cnts">
					<span class="hand like">좋아요 9</span>&nbsp;&nbsp;<span class="hand review">리뷰 0</span>
				</div>
				<!-- end colored -->
			</div>
			<div class="col-md-3">
				<!-- colored -->
				<div class="ih-item square colored effect6 from_top_and_bottom">
					<a href="#">
						<div class="posAbsolute type_band type_band_color2">PLAN</div>
						<div class="img">
							<img alt="" src="resources/images/test.jpg" />
						</div>
						<div class="info">
							<h3>Santa Barbara</h3>
							<div style="color: white;">
								연희동에 새로운 맛집으로 자리매김하고있는 Ellie. 아메리칸 스타일의 홈메이드 브런치는 물론, 특별 예약을 했을때가격
							</div>
						</div>
						<div class="detail">
							<div class="desc">
								1881 헤리티지(1881 Heritage) <br>
								<span class="colorBlueTeal">Hong Kong</span>
							</div>
							<div class="userName" data-uno="9">
								<span>Hana Tour</span>
							</div>
							<div class="date">2013.01.11 09:56</div>
						</div>
					</a>
				</div>
				<div class="cnts">
					<span class="hand like">좋아요 9</span>&nbsp;&nbsp;<span class="hand review">리뷰 0</span>
				</div>
				<!-- end colored -->
			</div>
			<div class="col-md-3">
				<!-- colored -->
				<div class="ih-item square colored effect6 from_top_and_bottom">
					<a href="#">
						<div class="posAbsolute type_band type_band_color2">PLAN</div>
						<div class="img">
							<img alt="" src="resources/images/test.jpg" />
						</div>
						<div class="info">
							<h3>Santa Barbara</h3>
							<div style="color: white;">
								연희동에 새로운 맛집으로 자리매김하고있는 Ellie. 아메리칸 스타일의 홈메이드 브런치는 물론, 특별 예약을 했을때가격
							</div>
						</div>
						<div class="detail">
							<div class="desc">
								1881 헤리티지(1881 Heritage) <br>
								<span class="colorBlueTeal">Hong Kong</span>
							</div>
							<div class="userName" data-uno="9">
								<span>Hana Tour</span>
							</div>
							<div class="date">2013.01.11 09:56</div>
						</div>
					</a>
				</div>
				<div class="cnts">
					<span class="hand like">좋아요 9</span>&nbsp;&nbsp;<span class="hand review">리뷰 0</span>
				</div>
				<!-- end colored -->
			</div>
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
			<a href="#">
				<div class="img">
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