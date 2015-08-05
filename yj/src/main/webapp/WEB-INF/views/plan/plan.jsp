<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
	<!-- 왼쪽 탭 -->
	
	<div class="col-md-2" id="left-tab">
		<div class="col-md-2" id="left-tab-left">
			<ul class="nav nav-pills nav-stacked left-image-icon"
				id="mapcategory">
				<li class="active" data-cat="icon_calender"><h3>
						<a href="#"><img class="media-object img-rounded" 
							src="resources/images/icon_calender.png" /></a>
					</h3></li>
				<li class="active" id="mapAll" data-cat="ALL"><h3>
						<a href="#"><img class="media-object img-rounded"
							src="resources/images/icon_mapAll.png" /> </a>
					</h3></li>
				<li class="active" id="shopping" data-cat="A04"><h3>
						<a href="#"><img class="media-object img-rounded"
							src="resources/images/icon_shopping.png" /> </a>
					</h3></li>
				<li class="active" id="food" data-cat="A05"><h3>
						<a href="#"><img class="media-object img-rounded"
							src="resources/images/icon_food.png" /> </a>
					</h3></li>
				<li class="active" id="hotel" data-cat="B02"><h3>
						<a href="#"><img class="media-object img-rounded"
							src="resources/images/icon_hotel.png" /></a>
					</h3></li>
				<li class="active" id="leports" data-cat="A03"><h3>
						<a href="#"><img class="media-object img-rounded"
							src="resources/images/icon_leports.png" /></a>
					</h3></li>
				<li class="active" id="culture" data-cat="A02"><h3>
						<a href="#"><img class="media-object img-rounded"
							src="resources/images/icon_culture.png" /></a>
					</h3></li>
				<li class="active" id="bookmark" data-cat="icon_bookmark"><h3>
						<a href="#"><img class="media-object img-rounded"
							src="resources/images/icon_bookmark.png" /> </a>
					</h3></li>
			</ul>
		</div>
		<div class="col-md-10" id="left-tab-right" style="overflow: auto;">
			<div class="row">
				<div class="col-md-12" id="left-tab-header">
					<h4>
						<strong> 일정만들기 </strong><br />
						<small>일정을 추가해주세요.</small>
					</h4>
					<!-- 출발일 설정 -->
					<form action="">
						<input type="date" id="startDate"/>
					</form>
				</div>
				<div class="btn-group btn-group-justified" role="group">
					<a href="#" class="btn btn-default" id="addplan">추가하기</a>
					<a href="#" class="btn btn-default" id="retryplan">다시하기</a>
				</div>
				<div class="btn-group btn-group-justified" role="group">
					<a href="#" class="btn btn-default" id="addplan">저장하기</a>
				</div>
			</div>
			<div class="row" id="left-tab-plan-contents">
				<div class="col-md-12">
					<div class="panel-group" id="1dateStr">
						 <div class="panel-heading"><strong ondrop='drop(event)' ondragover='allowDrop(event)'>출발일을 입력해주세요</strong></div>
					</div>			
				</div>
			</div>
		</div>
	</div>
	
	<!-- 왼쪽 장소 탭 -->	
	
	<div class="col-md-3" id="place-tab" style="overflow: auto;">
		<div class="page-header">
		  	<h2>
		  		<strong>다음카카오</strong><small>daumkakao</small>
		  		<button type="button" id="closePlaceBtn" class="btn btn-danger btn-xs pull-right">X</button>
		  	</h2>
		</div>
	  	<div class="row">
	  		<div class="col-md-12">
				<img src="resources/images/daumkakao.jpg" class="img-rounded" alt="Cinque Terre" width="100%" height="236"/>
			</div>
	  		<div class="col-md-12">
				<table class="table">
					<tr>
						<th>상세정보</th>
					</tr>
					<tr>
						<td id="overview">여기는말이야 우리집이고 내가 20년동안 살아왔는데 개좋음. 일단 놀이터가 자유롭고 굉장히 좋아 그리고 노인정이있는데 아주 잘지내고 아주 편리하고 바로앞에 초등학교가 위치해있어 어린이들이
						뛰고놀기에 아주 적합한장소야 아주아주 좋아 배리배리굳</td>
					</tr>
				</table>
			</div>
	  		<div class="col-md-12">
				<table class="table">
					<tr>
						<th>주소</th><td id="addr">인천시 부평구 일신동 풍림아파트 105동 905호</td>
					</tr>
				</table>
			</div>
	  		<div class="col-md-8">
				<div class="form-group" >
					<select class="form-control" id="dateSelect">
						<option>날짜를 선택해주세요!</option>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<button type="button" id="placeToPlanAddBtn" class="btn btn-success">일정에 추가</button>	
			</div>
			<p id="mapx" hidden></p>
			<p id="mapy" hidden></p>
		</div>
	</div>
	
	<!-- 지도 컨텐츠  -->
	
	<div class="col-md-8" id="contents-tab">
		<div id="map-box" class="ui-shadow"></div>
	</div>
	
	<!-- 오른쪽 탭 -->
	
	<div class="col-md-2" id="right-tab">
		<h4>서울 한국</h4>
		<p>근처의 호텔</p>
		<div class="media">
			<div class="media-left">
				<a href="#"> <img class="media-object img-rounded"
					src="resources/images/cat.jpg" alt="cat" width="50" height="50">
				</a>
			</div>
			<div class="media-body">
				<h5 class="media-heading">신라호텔</h5>
				<button type="button" class="btn btn-primary btn-sm">자세히 보기</button>
			</div>
		</div>
		<div class="media">
			<div class="media-left">
				<a href="#"> <img class="media-object img-rounded"
					src="resources/images/cat.jpg" alt="cat" width="50" height="50">
				</a>
			</div>
			<div class="media-body">
				<h5 class="media-heading">신라호텔</h5>
				<button type="button" class="btn btn-primary btn-sm">자세히 보기</button>
			</div>
		</div>

		<hr>
		<div class="btn-group btn-group-justified" role="group">
			<a href="#" class="btn btn-defualt">더보기</a>
		</div>
		<hr>



		<div class="row">
			<div class="col-md-4">
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><h3>
							<a href="#"><img class="media-object img-rounded"
								src="resources/images/icon_mapAll.png" /></a>
						</h3>
						<p>명소</p></li>
				</ul>
			</div>
			<div class="col-md-4">
				<ul class="nav nav-tabs">
					<li role="presentation"><h3>
							<a href="#"><img class="media-object img-rounded"
								src="resources/images/icon_shopping.png" /></a>
						</h3>
						<p>쇼핑</p></li>
				</ul>
			</div>
			<div class="col-md-4">
				<ul class="nav nav-tabs">
					<li role="presentation"><h3>
							<a href="#"><img class="media-object img-rounded"
								src="resources/images/icon_food.png" /></a>
						</h3>
						<p>음식점</p></li>
				</ul>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="list-group">
				<button type="button" class="list-group-item">1. Cras justo
					odio</button>
				<button type="button" class="list-group-item">2. Dapibus ac
					facilisis in</button>
				<button type="button" class="list-group-item">3. Morbi leo
					risus</button>
				<button type="button" class="list-group-item">4. Porta ac
					consectetur ac</button>
				<button type="button" class="list-group-item">5. Vestibulum
					at eros</button>
				<button type="button" class="list-group-item">6. Vestibulum
					at eros</button>
				<button type="button" class="list-group-item">7. Vestibulum
					at eros</button>
				<button type="button" class="list-group-item">8. Vestibulum
					at eros</button>
				<button type="button" class="list-group-item">9. Vestibulum
					at eros</button>
				<button type="button" class="list-group-item">10.Vestibulum at eros</button>
			</div>
		</div>


	</div>
	