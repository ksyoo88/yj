<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
	
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
					<p class="title">마음속에 이미 갈곳을 정해두셨다면?</p>
					<p class="content">여행일정을 추천 받을 도시는 선택해주시면 선택하신 도시에서의 여행일정을 추천해드려요~^^</p>
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
								<div class="city-box hand">
									<!-- <div class="city-img on"> -->
									<div class="city-img">
										<div class="mask"></div>
										<img title="서울" alt="서울"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										서울 <br> <span>Korea, Republic of</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="런던" alt="런던"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										런던 <br> <span>United Kingdom</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="방콕" alt="방콕"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										방콕 <br> <span>Thailand</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="홍콩" alt="홍콩"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										홍콩 <br> <span>Hong Kong</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="로마" alt="로마"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										로마 <br> <span>Italy</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="바르셀로나" alt="바르셀로나"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										바르셀로나 <br> <span>Spain</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="파리" alt="파리"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										파리 <br> <span>France</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="도쿄" alt="도쿄"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										도쿄 <br> <span>Japan</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="군산" alt="군산"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										군산 <br> <span>Korea, Republic of</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="산타 바바라" alt="산타 바바라"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										산타 바바라 <br> <span>United States</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="상하이" alt="상하이"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										상하이 <br> <span>China</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="싱가포르" alt="싱가포르"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										싱가포르 <br> <span>Singapore</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
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
						<span class="btn-next off">다음 &gt;</span>
					</div>
				</div>
				<div class="step step1" style="display: block;">
					<div class="title">여행 성향</div>
					<div class="row">
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="ex1" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="1" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">관광</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="ex2" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="1" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">쇼핑</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="ex3" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="1" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">쇼핑</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="ex4" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="1" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">쇼핑</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="ex5" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="1" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">쇼핑</span>
						</div>
						<div class="favorbar col-md-2" style="margin-top: 20px;">
							<input id="ex6" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="1" data-slider-orientation="vertical"/>
							<span style="display: block; margin-top: 10px;">쇼핑</span>
						</div>
					</div>
					<div class="btn-area">
						<span class="btn-prev">&lt; 여행도시</span>
						<span class="btn-next" id="getPlanbProvide">추천장소</span>
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
										<div class="mask"></div>
										<img title="서울" alt="서울"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										서울 <br> <span>Korea, Republic of</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="런던" alt="런던"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										런던 <br> <span>United Kingdom</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="방콕" alt="방콕"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										방콕 <br> <span>Thailand</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="홍콩" alt="홍콩"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										홍콩 <br> <span>Hong Kong</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="로마" alt="로마"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										로마 <br> <span>Italy</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="바르셀로나" alt="바르셀로나"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										바르셀로나 <br> <span>Spain</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="파리" alt="파리"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										파리 <br> <span>France</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="도쿄" alt="도쿄"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										도쿄 <br> <span>Japan</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="군산" alt="군산"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										군산 <br> <span>Korea, Republic of</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="산타 바바라" alt="산타 바바라"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										산타 바바라 <br> <span>United States</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="상하이" alt="상하이"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										상하이 <br> <span>China</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
										<img title="싱가포르" alt="싱가포르"
											src="resources/images/attraction/attraction.jpg">
									</div>
									<div class="city-name">
										싱가포르 <br> <span>Singapore</span>
									</div>
								</div>
								<div class="city-box hand">
									<div class="city-img">
										<div class="mask"></div>
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