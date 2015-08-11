<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>

<div class="container-fuild">
	<div class="col-md-4" id="left-tab">
	
	<div class="row">
		<div class="col-md-12" id="title" style="background-image : url(${planDay[0].place.firstimage })">
			<hr/>
			<h3><strong>${plan.title }</strong></h3>
			<p>${plan.strStartDay } ~ ${plan.strFinishDay }</p>
			<hr/>
		</div>
		<div class="col-md-12" id="topContent">
			<div class="panel panel-default">
				<div class="panel-body">
					<p>총 여행일 수 : ${plan.trevelCnt } 좋아요 ${plan.likeCnt } 작성자 : ${member.no }</p>
					<button type="button" class="btn btn-default">URL 복사</button>
					<button type="button" class="btn btn-default">수정하기</button>
					<button type="button" class="btn btn-default">좋아요</button>
					<button type="button" class="btn btn-default">공유하기</button>
				</div>
			</div>			
		</div>
	</div>
	
	<div class="row" id="centerContent">
		<div class="col-md-4" id="centerLeftContent">
		<hr/>
		
<c:forEach var="day" items="#{planDay }" varStatus="index">
<c:if test="${ (day.dayDate != planDay[index.count-2].dayDate) || (planDay[index.count-2].dayDate == null) }">

			<p class="palceName"><strong> DAY ${count=count+1 }. </strong></p>	
			
</c:if>
			<p><img src='resources/images/icon_${day.place.cat1}.png' width='18px' height='18px'/><strong> ${day.place.title}</strong></p>
			<div class="palceInfo">
				<p class="mapX"><small>${day.place.mapx }</small></p>		
				<p class="mapY"><small>${day.place.mapy }</small></p>
				<p hidden class="cate">${day.place.cat1}</p>		
			</div>				
</c:forEach>

		</div>
		<div class="col-md-8" id="centerRightContent">
<c:forEach var="day" items="#{planDay }" varStatus="index">	
<c:if test="${ (day.dayDate != planDay[index.count-2].dayDate) || (planDay[index.count-2].dayDate == null) }">
			<div class="col-md-12">
				<hr/>
				<p class="placeNameRight"><strong> * ${day.strDayDate} </strong></p>	
				<hr/>	
			</div>
</c:if>	
			<div class="col-md-6">
				<img src="${day.place.firstimage }" width="180" height="120"/>
				<p style="text-align : center"><strong><small>${day.place.title }</small></strong></p>
			</div>
<%-- 		<div class="col-md-6"><p style="font-size:80%"><strong> ${day.place.overview }"</strong></p></div> --%>
</c:forEach>			
		</div>
	</div>
	
	<hr/>
	
	<div id="commentContent">
		<div class="panel panel-default">
			<div class="panel-body">
				<p>와 이 일정 괜찮다 <img src="#" width="30" height="30"> <strong>곽태민</strong> (2015.08.10) 11:30:22 </p>
			</div>		
		</div>
	</div>
	
	<div id="footerContent">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="input-group input-group-lg">
					<input type="text" class="form-control"	placeholder="뎃글을 입력해주세요." aria-describedby="basic-addon2"> 
					<span class="input-group-btn">
				        <button class="btn btn-default" type="button">곽태민 <img src="#" width="30" height="30"> </button>
				    </span>
				</div>
			</div>		
		</div>
	</div>
	
	<hr/>
			
	</div>

	
	

	
	<div class="col-md-8" id="contents-tab">	
		<div id="map-box"></div>
	</div>
</div>