<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

	<div class="container-fluid">
		<div class="header">
			<div class="title">
				<img src="resources/images/attraction/title_smartplanb.jpg">
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
									<div class="city-img">
										<img title="서울" alt="서울"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										서울 <br> <span><tags:out text="Korea, Republic of" byteLength="10" ellipsis="..." /></span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="런던" alt="런던"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										런던 <br> <span>United Kingdom</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="방콕" alt="방콕"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										방콕 <br> <span>Thailand</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="홍콩" alt="홍콩"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										홍콩 <br> <span>Hong Kong</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="로마" alt="로마"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										로마 <br> <span>Italy</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="바르셀로나" alt="바르셀로나"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										바르셀로나 <br> <span>Spain</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="파리" alt="파리"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										파리 <br> <span>France</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="도쿄" alt="도쿄"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										도쿄 <br> <span>Japan</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="군산" alt="군산"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										군산 <br> <span>Korea, Republic of</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="산타 바바라" alt="산타 바바라"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										산타 바바라 <br> <span>United States</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="상하이" alt="상하이"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										상하이 <br> <span>China</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="싱가포르" alt="싱가포르"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										싱가포르 <br> <span>Singapore</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<img title="말레이" alt="말레이"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										말레이 <br> <span>Philippines</span>
									</div>
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