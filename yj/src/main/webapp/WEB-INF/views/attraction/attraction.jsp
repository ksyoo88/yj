<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

	<div class="container-fluid text-center">
		<div class="header">
			<div class="title">
				<h1>여기? 저기!</h1>
			</div>
			<ul class="tab_step">
				<li class="step0 on"><strong>STEP1</strong> &nbsp;<br><span class="select">여행도시</span></li>
				<li class="step1"><strong>STEP2</strong> &nbsp; <br><span>여행성향</span></li>
				<li class="step2 last"><strong>STEP3</strong> &nbsp; <br><span>추천장소</span></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="body">
			<div id="planb_help">
				<div class="people">
					<img class="icon hide" style="display: inline;" src="resources/images/attraction/planb_icon_set_city.png"> <img class="character"
						src="resources/images/attraction/planb_icon_people03.png">
				</div>
				<div class="help">
					<p class="title">어디를 갈지 아직 정하지 못하셨다면?</p>
					<p class="content">추천 받은 도시를 선택해주시면 선택하신 도시 인근의 여행장소을 추천해드려요~^^</p>
				</div>
			</div>
			<div class="step_area">
				<div class="step step0" style="display: block;">
					<div class="title">여행도시</div>
					<div class="content">
						<div class="theme-city-layout">
							<div class="theme-title">
								<img title="citis" alt="citis" src="resources/images/attraction/icon_pin_city.png"> 여기저기 추천도시
							</div>
							<div class="theme-city-list">
<c:forEach var="attraction" items="${attractionList }">
								<div class="city-box hand" data-areacode="${attraction.areacode }">
									<!-- <div class="city-img on"> -->
									<div class="city-img">
										<div class="mask"></div>
										<img title="${attraction.areaname }" alt="${attraction.areaname }"
											src="${attraction.firstimage }" style="width: 140px; height: 130px;">
									</div>
									<div class="city-name">
										${attraction.areaname } <br> <span>${attraction.title }</span>
									</div>
								</div>
</c:forEach>
							</div>
						</div>
					</div>
					<div class="btn-area">
						<span class="btn-next off">건너뛰기 &gt;</span>
					</div>
				</div>
				<div class="step step1" style="display: block;">
					<div class="title">여행 성향</div>
					<!-- 
					B02	숙박
					A04	쇼핑
					A05	음식
					A01	자연
					A03	레져
					A02	문화
					 -->
					<div class="row">
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="favor1" name="B02" type="text" data-slider-min="1" data-slider-max="3" data-slider-step="1" data-slider-value="2" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">숙박</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="favor2" name="A04" type="text" data-slider-min="1" data-slider-max="3" data-slider-step="1" data-slider-value="2" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">쇼핑</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="favor3" name="A05" type="text" data-slider-min="1" data-slider-max="3" data-slider-step="1" data-slider-value="2" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">음식</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="favor4" name="A01" type="text" data-slider-min="1" data-slider-max="3" data-slider-step="1" data-slider-value="2" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">자연</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="favor5" name="A03" type="text" data-slider-min="1" data-slider-max="3" data-slider-step="1" data-slider-value="2" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">레져</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="favor6" name="A02" type="text" data-slider-min="1" data-slider-max="3" data-slider-step="1" data-slider-value="2" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">문화</span>
						</div>
					</div>
					<div class="btn-area">
						<span class="btn-prev">&lt; 여행도시</span>
						<span class="btn-next" id="getfavorplace">추천장소 &gt;</span>
					</div>
				</div>
				<div class="step step2" style="display: block;">
					<div class="title">추천장소</div>
					<div class="content">
						<div class="theme-city-layout">
							<div class="theme-title">
								<img title="citis" alt="citis" src="resources/images/attraction/icon_pin_city.png"> 여기저기 추천장소
							</div>
							<div class="theme-city-list">
								<div class="city-box hand">
									<!-- <div class="city-img on"> -->
								</div>
							</div>
						</div>
					</div>
					<div class="btn-area">
						<span class="btn-prev">&lt; 여행성향</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%-- <tags:paginate total="${relicForm.count }" page="${relicForm.cPage }" max="${relicForm.pages }" /> --%>