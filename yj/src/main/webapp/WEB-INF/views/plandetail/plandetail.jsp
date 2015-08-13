<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>

<div class="container-fuild">
	<div class="col-md-4" id="left-tab">
		<div class="row">
			<div class="col-md-12" id="title"
				style="background-image : url(${planDay[0].place.firstimage })">
				<hr />
				<h3>
					<strong>${plan.title }</strong>
				</h3>
				<p>${plan.strStartDay }~ ${plan.strFinishDay }</p>
				<hr />
			</div>
			<div class="col-md-12" id="topContent">
				<div class="panel panel-default">
					<div class="panel-body">
						<p>총 여행일 수 : ${plan.trevelCnt } 좋아요 ${plan.likeCnt } 작성자 :
							${plan.member.name }</p>
						<button type="button" class="btn btn-default">URL 복사</button>
						<c:if test="${plan.member.no == member.no }">
							<button type="button" class="btn btn-default">수정하기</button>
						</c:if>
						<button type="button" class="btn btn-default">좋아요</button>
						<button type="button" class="btn btn-default">공유하기</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="centerContent">
			<div class="col-md-4" id="centerLeftContent">
				<hr />

				<c:forEach var="day" items="${planDay }" varStatus="index">
					<c:if
						test="${ (day.dayDate != planDay[index.count-2].dayDate) || (planDay[index.count-2].dayDate == null) }">

						<h3 class="palceName">
							<strong> DAY ${count=count+1 }. </strong>
						</h3>

					</c:if>
					<p>
						<img src='resources/images/icon_${day.place.cat1}.png'
							width='18px' height='18px' /><strong> ${day.place.title}</strong>
					</p>
					<div class="palceInfo">
						<p class="distance"><small></small></p>
						<p hidden class="mapX"><small>${day.place.mapx }</small></p>
						<p hidden class="mapY"><small>${day.place.mapy }</small></p>
						<p hidden class="cate">${day.place.cat1}</p>
						<p hidden class="pTitle">${day.place.title }</p>
						<p hidden class="image">${day.place.firstimage }</p>
						<p hidden class="tel">${day.place.tel }</p>
						<p hidden class="contentid">${day.place.contentid }</p>
						<p hidden class="overview">${day.place.overview }</p>
						<p hidden class="addr">${day.place.addr1 }</p>
					</div>
				</c:forEach>

			</div> <!-- col-md-4 -->
			<div class="col-md-8" id="centerRightContent">
				<c:forEach var="day" items="#{planDay }" varStatus="index">
					<c:if
						test="${ (day.dayDate != planDay[index.count-2].dayDate) || (planDay[index.count-2].dayDate == null) }">
						<div class="col-md-12">
							<hr />
							<p class="placeNameRight">
								<strong> - ${day.strDayDate} </strong>
							</p>
							<hr />
						</div>
					</c:if>
					<div class="col-md-6">
						<img src="${day.place.firstimage }" width="180" height="120" />
						<p style="text-align: center">
							<strong><small>${day.place.title }</small></strong>
						</p>
					</div>
					<%-- 		<div class="col-md-6"><p style="font-size:80%"><strong> ${day.place.overview }"</strong></p></div> --%>
				</c:forEach>			
			</div> <!-- col-md-8 -->
			<div class="col-md-12">
				<div id="commentContent">
					<div class="panel panel-default">
						<div class="panel-body" id="commentContent">
							<p>
								와 이 일정 괜찮다 <img src="#" width="30" height="30"> <strong>곽태민</strong>
								(2015.08.10) 11:30:22
							</p>
						</div>
					</div>
				</div><!-- commentContent -->		
				<div id="footerContent">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="input-group input-group-lg">				
									
								<input id="commentText" type="text" class="form-control" name="comment" placeholder="뎃글을 입력해주세요." aria-describedby="basic-addon2"/> 
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit" id="commentInsert" data-plan-no="${plan.no }">
										<strong>${member.name }</strong> <img src="#" width="30" height="30">
									</button>
								</span>
								
							</div>
						</div>
					</div>
				</div> <!-- footerContent -->
			<hr />
			</div> <!-- colmd12 -->
		</div> <!-- row -->
		</div> <!--col-md-4 -->
		
		<div hidden class="col-md-2" id="place-tab">
			<div class="col-md-12" id="place-tab-image">
				<img src="" alt="place" width=100%/>
				<hr/>				
			</div>
			<div id="place-tab-content">					
				<h3 id="place-tab-title"><strong>title</strong></h3>
				<kbd>상세정보</kbd>
				<p id="place-tab-overview">overview</p>
				<kbd>주소</kbd>
				<p id="place-tab-addr"><strong>addr</strong></p>
				<kbd>전화번호</kbd>
				<p id="place-tab-tel"><strong>tel</strong></p>
			</div>
		</div>
		<div class="col-md-8" id="contents-tab">
			<div id="map-box"></div>
		</div>
		
</div>





