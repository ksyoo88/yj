<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
	<!-- 왼쪽 탭 -->
	<div class="col-md-2" id="left-tab">
		<div class="col-md-2" id="left-tab-left" >
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
				<li class="active" id="bookmark" data-cat="bookmark"><h3>
						<a href="#"><img class="media-object img-rounded"
							src="resources/images/icon_bookmark.png" /> </a>
					</h3></li>
			</ul>
		</div>
		<div class="col-md-10" id="left-tab-right" style="overflow: auto;">
			<div class="row">
				<div class="col-md-12" id="left-tab-header">
					<h4>
						<strong> 일정만들기 </strong>						
					</h4>
					<!-- 출발일 설정 -->
					<div class="input-append date form_datetime form-group input-group">
						<input class="form-control" size=18" type="text" value=""  placeholder="출발 날짜를 입력하세요!" id="startDate" readonly/>
						<span class="add-on input-group-addon"><i class="icon-th glyphicon glyphicon-calendar "></i></span>
					</div>
				</div>
				
				<div class="btn-group btn-group-justified" role="group">
					<a href="#" class="btn btn-default" id="addplan">추가하기</a>
					<a href="#" class="btn btn-default" id="retryplan">다시하기</a>
				</div>
				<div class="btn-group btn-group-justified" role="group">
					<a href="#" class="btn btn-default" data-toggle="modal" data-target="" id="saveBtn">저장하기</a>
				</div>
				
				<!-- msg Modal -->
				<div class="modal fade" id="msgPlanModal" role="dialog">
					<div class="modal-dialog">
					
						<!-- 로그인실패 -->
						<div class="modal-content">
							<div class="modal-header" style="padding: 35px 50px;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4>
									<span class="glyphicon glyphicon-search"></span> 알림
								</h4>
							</div>
							<div class="modal-body" style="padding: 40px 50px; text-align: center; ">
								<h3>
									출발 날짜를 입력해주세요! 
								</h3><br><br><br><br>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 저장 모달 -->
				<div id="saveModal" class="modal fade" role="dialog">
					<div class="modal-dialog">	
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header modal-primary"  style="padding: 35px 50px;" >
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4>
									<span class="glyphicon glyphicon-search"></span>일정을 저장하시겠습니까?
								</h4>
							</div>
							<div class="modal-body">
								<form role="form" action="planinsert.do" class="form-horizontal" method="post">
									<div class="form-group">
										<label class="control-label col-md-2" for="title">제목 :</label>
										<div class="col-md-10">
											<input type="text" class="form-control" id="save-title" name="title" maxlength="20" placeholder="제목을 입력하세요.">
										</div>										
									</div>
									<div class="form-group">
										<label class="control-label col-md-2" >날짜 :</label>
										<div class="col-md-5">
											<input type="text" id="startDay" name="startDay" class="form-control" value="2015년 8월 9일" readonly>
										</div>										
										<div class="col-md-5">
											<input type="text" id="finishDay" name="finishDay" class="form-control" value="2015년 8월 12일" readonly>
										</div>										
									</div>
									<div class="from-group" id="insertPlan">
									
									</div>
									
									<button type="submit" class="btn btn-primary pull-right" id="plansaveBtn">일정 저장하기</button>
								</form>
							</div>
							<div class="modal-footer">
							</div>
						</div>	
					</div>
				</div>
				
			</div>
		
			<div class="row" id="left-tab-plan-contents">
				<div class="col-md-12">
					<div class="panel-group" id="1dateStr">
						 <div class="panel-heading ui-state-default"><strong>출발일을 입력해주세요</strong></div>
					</div>			
				</div>
			</div>
		</div>
	</div>
	

	<!-- 왼쪽 장소 탭 -->	
	
	<div class="col-md-2" id="place-tab" style="overflow: auto;">
		<div class="page-header">
		  	<h3>
		  		<strong>타이틀</strong><small>전화번호</small>
		  		<button type="button" id="closePlaceBtn" class="btn btn-danger btn-xs pull-right">X</button>
		  	</h3>
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
						<td id="overview">오버뷰</td>
					</tr>
				</table>
			</div>
	  		<div class="col-md-12">
				<table class="table">
					<tr>
						<th>주소</th><td id="addr">주소</td>
					</tr>
				</table>
			</div>
	  		<div class="col-md-12">
				<div class="form-group" >
					<select class="form-control" id="dateSelect">
						<option>날짜를 선택해주세요!</option>
					</select>
				</div>
			</div>
			<div class="col-md-12">
				<div class="btn-group btn-group-justified" role="group">
					<a href="#" class="btn btn-default" id="placeToPlanAddBtn">일정에 추가</a>
					<a href="#" class="btn btn-default" id="addBookmark">북마크에 추가</a>
				</div>
			</div>
			<p id="mapx" hidden></p>
			<p id="mapy" hidden></p>
			<p id="contentid" hidden></p>
		</div>
	</div>
	
	<!-- 지도 컨텐츠  -->
	
	<div class="col-md-8" id="contents-tab">	
		<div id="map-box" class="ui-shadow"></div>
	</div>
	
	<!-- 오른쪽 탭 -->
	
	<div class="col-md-2" id="right-tab">
		<div class="row" id="right-tab-header">
			<h4>국내 대표 관광지 TOP 100</h4>
			<div class="col-md-3">
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><h3>
							<a href="#"><img class="media-object img-rounded" data-top="ALL"
								src="resources/images/icon_mapAll.png" /></a>
								</h3>
								<p><strong>명소</strong></p></li>
						
				</ul>
				
			</div>
			<div class="col-md-3">
				<ul class="nav nav-tabs">
					<li role="presentation"><h3>
							<a href="#"><img class="media-object img-rounded" data-top="A04"
								src="resources/images/icon_shopping.png" /></a>
						</h3>
						<p><strong>쇼핑</strong></p></li>
				</ul>
			</div>
			<div class="col-md-3">
				<ul class="nav nav-tabs">
					<li role="presentation"><h3>
							<a href="#"><img class="media-object img-rounded" data-top="A05"
								src="resources/images/icon_food.png" /></a>
						</h3>
						<p><strong>음식점</strong></p></li>
				</ul>
			</div>
			<div class="col-md-3">
				<ul class="nav nav-tabs">
					<li role="presentation"><h3>
							<a href="#"><img class="media-object img-rounded" id="bookmark-tab" data-top="Bookmark"
								src="resources/images/icon_bookmark.png" /></a>
						</h3>
						<p><strong>북마크</strong></p></li>
				</ul>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="list-group" id="topPlace">
<c:forEach var="place" items="${topPlaces }" varStatus="index">
				<button type="button" class="list-group-item" data-mapx="${place.mapx }" data-mapy="${place.mapy }" >${index.count}. ${place.title }</button>
</c:forEach>
			</div>
		</div>


	</div>
	