<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/x-handlebars-template" id="form-template">
<div id ="newtemp" class="mCSB_container mCS_no_scrollbar"   style="position: relative; top: 0px;">		
	<div class="day-box" id="day-box">	
		<div class="title-box" id="photo-${day }-${month }-${year }">			
			<div class="day" id="day">ddddaaaayyyy <span>${day }/${month }/${year }</span>				
				<div class="city">				
				</div>			
				</div>			
				<div class="location" >			
				</div>			
			</div>		
			<div class="photo-box">				
				<div class="place">					
					<span class="spotname" ></span> 
											
				</div>				
				<div class="modify-button">					
				<div class="place-modify location" data-code="c3604ec6241c02961917854c2ff5c34d" data-lat="35.16596260390035" data-lng="129.16750430824553">
					<span class="glyphicon glyphicon-plane"></span>위치변경
				</div>					
													
				<div class="place-modify delete" onclick="delTemPhotoByday(1)" data-code="c3604ec6241c02961917854c2ff5c34d">
				 	<span class="glyphicon glyphicon-trash"></span>삭제
				</div>				
				</div>				
				<div class="photo-cont-modify" >

					<div id="photoView">					
							
					</div>				
														
					<div style="height:0px;overflow:hidden">
										<form action="savetempphoto.do" id="photoUpForm1" method="post" enctype="multipart/form-data">
											<input name="day" value="1">		  
											<input id="photoupload1" name="filename" type="file" onchange="savetempphoto(1)" style="font-size: 1px; opacity: 0;" multiple="" accept="image/jpeg,image/png">
											<input id="savetempphoto1" onclick="saveajax(1)" type="button">
										</form>
									</div>
										<div class="photo-add" onclick="photoupload(1)" data-seqcode="c3604ec6241c02961917854c2ff5c34d">
											<div class="add-btn"  style="background-size: contain; background-repeat:no-repeat; 
										background-image:url(resources/images/addPhoto.jpg)">
												
											</div>
										</div>

					<div class="clearBoth">
					</div>				
				</div>				
				<div class="clearBoth">
				</div>				
				<div id="Memo1" class="memo memo-modify">
					<textarea name="memo[]" class="no-line-input" data-code="c3604ec6241c02961917854c2ff5c34d"></textarea> 	
					<img class="clearMemo" onclick="clearmemo(1)" src="resources/images/panorama/cross-mark1.png" alt="delete">
										
				</div>			
			</div>		
		</div>
	</div>					
</script>

	<div class="col-md-4" id="panoform-tab">
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
						<td>여기는말이야 우리집이고 내가 20년동안 살아왔dfg는데 개좋음. 일단 놀이터가 자유롭고 굉장히 좋아 그리고 노인정이있는데 아주 잘지내고 아주 편리하고 바로앞에 초등학교가 위치해있어 어린이들이
						뛰고놀기에 아주 적합한장소야 아주아주 좋아 배리배리굳</td>
					</tr>
				</table>
			</div>
	  		<div class="col-md-12">
				<table class="table">
					<tr>
						<th>주소</th><td>인천시 부평구 일신동 풍림아파트 105동 905호</td>
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
		</div>
	</div>
	<div class="col-md-4" id="panoform-">
	<div id="photologDetailBox">	
		<div id="photolog-timeline"  class="mCustomScrollbar _mCS_90 _mCS_94" >
			<div class="mCustomScrollBox mCS-light" id="mCSB_94" style="position:relative; height:100%; overflow:hidden; max-width:100%;">
			
				<div class="mCSB_container mCS_no_scrollbar" onclick="datepick()" style="position: relative; top: 0px;">
					<div class="date-year" id="date-year">${year }</div>
					<div class="date-month" id="date-month">${month }</div>
					<div class="date-day" id="date-day">	
						<p><a class="moveScroll" href="#photo-2015-07-27">${day }</a></p>
					</div>
				</div>
				
				
				<div class="mCSB_scrollTools" style="position: absolute; display: none; overflow: auto;">
					<div class="mCSB_draggerContainer">
						<div class="mCSB_dragger" style="position: absolute; top: 0px;" oncontextmenu="return false;">
							<div class="mCSB_dragger_bar" style="position:relative;">
							</div>
						</div>
						<div class="mCSB_draggerRail">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="photolog-container" class="mCustomScrollbar _mCS_91" >	
			<div id="hiddenCalander" hidden>
					<div id="datepicker"></div>
				</div>
			<div style="height:65px" class="title">
			</div>	
			<div class="button-set set-modify">	
				<div class="btn-addphoto" data-photoidx="473">
					<img src="resources/images/panorama/photos13.png" alt="save">
					 <span>일정 추가</span>
				</div>	
				<div class="btn-cancel" >
					<img src="resources/images/panorama/delete85.png" alt="save">
					<span>취소</span>
				</div>	
				<div class="btn-save">
					<img src="resources/images/profilephoto/download168.png" alt="save">
					 <span>저장</span>
				</div>	
			</div>	
				<div class="header-edit">	
					<div>			
						<p>파노라마 타이틀</p>			
							<p class="title">
							<input type="text" name="title" class="no-line-input" value="${member.name }님의 파노라마">
							 <span class="glyphicon glyphicon-remove"></span></p>	
						
					</div>
				</div>	
				<div class="photolog-day mCustomScrollbar _mCS_95" style="height: 629px;">
				
				
					<div class="mCustomScrollBox mCS-light"  id="mCSB_95" style="position:relative; height:100%; overflow:hidden; max-width:100%;">
						
						<div id ="newtemp1" class="mCustomScrollBox mCS_no_scrollbar"  style="position: relative; top: 0px;">		
							<div class="day-box" id="day-box">	
								<div class="title-box" id="photo-${day }-${month }-${year }">			
									<div class="day" id="day1">DAY 1 <span>${day }/${month }/${year }</span>				
										<div class="city">				
										</div>			
									</div>			
								<div class="location" id="location">				
								</div>			
								</div>		
								<div class="photo-box">				
									<div class="place">					
										<span class="spotname" id="spotname"></span> 
										<!-- <span class="time">15:55</span>		 -->		
									</div>				
									<div class="modify-button">					
										<div class="place-modify location" data-code="c3604ec6241c02961917854c2ff5c34d" data-lat="35.16596260390035" data-lng="129.16750430824553">
											 <span class="glyphicon glyphicon-plane"></span>위치변경
										</div>					
										<!-- <div class="place-modify timechange" data-date="2015-07-27" data-time="15:55" data-code="c3604ec6241c02961917854c2ff5c34d">
											<img src="../_images/icon_time_on.png" alt="place pin">시간 변경
										</div>	 -->				
										<div class="place-modify delete" onclick="delTemPhotoByday(1)" data-code="c3604ec6241c02961917854c2ff5c34d">
											 <span class="glyphicon glyphicon-trash"></span>삭제
										</div>				
									</div>				
									<div class="photo-cont-modify" id="photo-cont-modify">		
									
									<div id="photoView">
										<c:forEach var="photo" items="${photos }">
											<div class="photo" data-idx="904456" data-imagename="${photo}" style="background-size: contain; background-repeat:no-repeat; 
											background-image:url(resources/images/temphoto/${photo})">						
												<div class="delete hand" data-idx="904456" data-uploaded="true">
													<span class="glyphicon glyphicon-remove"></span>
												</div>					
											</div>	
										
										</c:forEach>
									</div>
									
									<div style="height:0px;overflow:hidden">
										<form action="savetempphoto.do" id="photoUpForm1" method="post" enctype="multipart/form-data">
											<input name="day" id="day" value="1">
											<input id="photoupload1" name="filename" type="file" onchange="savetempphoto(1)" style="font-size: 1px; opacity: 0;" multiple="" accept="image/jpeg,image/png">
											<input id="savetempphoto1" onclick="saveajax(1);" type="button">
										</form>
									</div>
									<div class="photo-add" onclick="photoupload(1)" data-seqcode="c3604ec6241c02961917854c2ff5c34d">
										<div class="add-btn"  style="background-size: contain; background-repeat:no-repeat; 
									background-image:url(resources/images/addPhoto.jpg)">
											
										</div>
									</div>
										
										<div class="clearBoth">
										</div>				
									</div>				
									<div class="clearBoth">
									</div>				
									<div id="Memo1" class="memo memo-modify">
										<textarea name="memo[]" class="no-line-input" data-code="c3604ec6241c02961917854c2ff5c34d"></textarea> 	
											<img  class="clearMemo" onclick="clearmemo(1)" src="resources/images/panorama/cross-mark1.png" alt="delete">
										
									</div>			
								</div>		
							</div>
						</div>
						
						
					
					
						
						
						<div class="mCSB_scrollTools" style="position: absolute; display: none;">
							<div class="mCSB_draggerContainer">
								<div class="mCSB_dragger" style="position: absolute; top: 0px;" oncontextmenu="return false;">
									<div class="mCSB_dragger_bar" style="position:relative;">
									</div>
								</div>
								<div class="mCSB_draggerRail">
								</div>
							</div>
						</div>
					
					
					
					</div>
						<button id="daydeletebutton" >지우기</button>
				</div>
			</div>
		</div>
		</div>