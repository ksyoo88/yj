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
	
	<div class="container-fluid">
		<div class="jumbotron">
			<h1>무슨 용도로 사용할까?</h1>
			<p>This is a template showcasing the optional theme stylesheet included in Bootstrap. Use it as a starting point to create something more
				unique by building on or modifying it.</p>
		</div>
	</div>
	
	<div class="container-fluid main-tour">
		<span class="sub_title">나만의 여행을 만들어 보세요!</span>
		<h1><span>미리 떠나는 나만의 여행<br />시작해 볼까요?</span></h1>
		<ul class="main_btn">
			<li class="pink"><span class="hand">여기추천</span></li>
			<li class="sky"><span class="hand">저기가자</span></li>
		</ul>
	</div>
	
	<!-- From top and bottom-->
	<div class="container-fluid main-plan">
		<h2>
			<span class="small-title">추천일정</span><br>
			<img src="resources/images/title_travelog.png">
		</h2>
		<h3>여기저기 사용자들의 알찬 여행정보를 공유합니다.</h3>
		<div class="row">
			<div class="col-md-3">
	
				<!-- normal -->
				<div class="ih-item square colored effect6 from_top_and_bottom">
					<a href="#">
							<div class="posAbsolute type_band type_band_color1">PLACE</div>
						<div class="img">
							<img alt="" src="resources/images/test.jpg"/>
						</div>
						<div class="info">
							<h3>Santa Barbara</h3>
							<div style="color: white;">5 days / 23 places</div>
						</div>
						<div class="detail">
							<div class="desc">
								산타바바라 자연과 하나되는 여행, 산~타 봐봐라! <br>
								<span class="colorBlueTeal">Santa Barbara</span>
							</div>
							<div class="userName" data-uno="1352">
								<span>Taekyoung Lee</span>
							</div>
							<div class="date">2014.08.05 20:42</div>
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
	<div class="container-fluid main-place">
		<h2>
			<span class="small-title">추천장소</span><br>
			<img src="resources/images/title_cityaward.png">
		</h2>
		<h3>엄선된 도시와 장소정보를 공유합니다.</h3>
		<!-- colored -->
		<div class="colored effect3 from_top_and_bottom">
			<a href="#">
				<div class="img">
					<img alt="" src="resources/images/test.jpg" />
				</div>
				<div class="info">
					<h3>1881 헤리티지(1881 Heritage)</h3>
				</div>
			</a>
		</div>
		<!-- end colored -->
		<!-- colored -->
		<div class="colored effect3 from_top_and_bottom">
			<a href="#">
				<div class="img">
					<img alt="" src="resources/images/test.jpg" />
				</div>
				<div class="info">
					<h3>1881 헤리티지(1881 Heritage)</h3>
				</div>
			</a>
		</div>
		<!-- end colored -->
		<!-- colored -->
		<div class="colored effect3 from_top_and_bottom">
			<a href="#">
				<div class="img">
					<img alt="" src="resources/images/test.jpg" />
				</div>
				<div class="info">
					<h3>1881 헤리티지(1881 Heritage)</h3>
				</div>
			</a>
		</div>
		<!-- end colored -->
		<!-- colored -->
		<div class="colored effect3 from_top_and_bottom">
			<a href="#">
				<div class="img">
					<img alt="" src="resources/images/test.jpg" />
				</div>
				<div class="info">
					<h3>1881 헤리티지(1881 Heritage)</h3>
				</div>
			</a>
		</div>
		<!-- end colored -->
		<!-- colored -->
		<div class="colored effect3 from_top_and_bottom">
			<a href="#">
				<div class="img">
					<img alt="" src="resources/images/test.jpg" />
				</div>
				<div class="info">
					<h3>1881 헤리티지(1881 Heritage)</h3>
				</div>
			</a>
		</div>
		<!-- end colored -->
	<!-- end From top and bottom-->
	</div>
	<!-- ======================================================================================================= -->
	
	
	<div class="container-fluid">
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