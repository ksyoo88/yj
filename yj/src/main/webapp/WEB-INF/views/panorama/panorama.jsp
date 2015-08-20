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
				<div class="location" id="location">		
				</div>			
			</div>		
			<div class="photo-box">				
				<div class="place">					
					<span class="spotname" id="spotname" ></span> 
											
				</div>				
				<div class="modify-button">					
				<div class="place-modify location" onclick="locachoice(1)">
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
					<textarea name="memo[]" class="no-line-input" ></textarea> 	
					<img class="clearMemo" onclick="clearmemo(1)" src="resources/images/panorama/cross-mark1.png" alt="delete">
										
				</div>			
			</div>		
		</div>
	</div>					
</script>


<div style="min-width: 512px;" id="panoform-">
	<form action="savePanorama.do" method="post" id="submitForm" hidden>
		<input type="text" id="title" name="title"> <input type="text"
			id="datepick" name="date"> <input type="text" id="locaform1"
			name="locaform">
		<textarea id="memoform1" name="memoform">
		</textarea>
		<button id="submitBtn" type="submit"></button>
	</form>
	<div id="photologDetailBox">
		<div id="photolog-timeline" class="mCustomScrollbar _mCS_90 _mCS_94">
			<div class="mCustomScrollBox mCS-light" id="mCSB_94"
				style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
	
				<div class="mCSB_container mCS_no_scrollbar"
					style="position: relative; top: 0px;">
					<div onclick="datepick()">
						<div class="date-year" id="date-year">${year }</div>
						<div class="date-month" id="date-month">${month }</div>
					</div>
	
					<div class="date-day" id="date-day">
						<p>
							<a class="moveScroll" href="#photo-2015-07-27">${day }</a>
						</p>
					</div>
				</div>
	
	
				<div class="mCSB_scrollTools"
					style="position: absolute; display: none; overflow: auto;">
					<div class="mCSB_draggerContainer">
						<div class="mCSB_dragger" style="position: absolute; top: 0px;"
							oncontextmenu="return false;">
							<div class="mCSB_dragger_bar" style="position: relative;"></div>
						</div>
						<div class="mCSB_draggerRail"></div>
					</div>
				</div>
			</div>
		</div>
		<div id="photolog-container" class="mCustomScrollbar _mCS_91">
			<div id="hiddenCalander" hidden>
				<div id="datepicker"></div>
			</div>
			<div style="height: 65px" class="title"></div>
			<div class="button-set set-modify">
				<div class="btn-addphoto" data-photoidx="473">
					<img src="resources/images/panorama/photos13.png" alt="save">
					<span>일정 추가</span>
				</div>
				<div class="btn-cancel">
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
						<input type="text" name="title" class="no-line-input"
							value="${member.name }님의 파노라마"> <span
							class="glyphicon glyphicon-remove"></span>
					</p>
	
				</div>
			</div>
			<div class="photolog-day mCustomScrollbar _mCS_95"
				style="height: 629px;">
	
	
				<div class="mCustomScrollBox mCS-light" id="mCSB_95"
					style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
	
					<!-- 위치 검색 다이알로그 -->
					<div id="dialog" title="Basic dialog"
						style="width: 200px; height: 400px" hidden>
						<p>여행한 도시를 선택해주세요</p>
						<input class="form-control input-lg" type="text" id="tag"
							onkeyup="search();" placeholder="2자 이상 검색" maxlength="40">
	
	
						<input class="form-control input-lg" type="text" id="tagtext"
							readonly="readonly" style="top: 250px; position: relative;">
					</div>
	
					<div id="newtemp1" class="mCustomScrollBox mCS_no_scrollbar"
						style="position: relative; top: 0px;">
						<div class="day-box" id="day-box">
							<div class="title-box" id="photo-${day }-${month }-${year }">
								<div class="day" id="day1">
									DAY 1 <span>${day }/${month }/${year }</span>
									<div class="city"></div>
								</div>
	
								<div class="location" id="location"> </div>
							<input id="changelocation" type="text" value="" hidden>
							</div>
							<div class="photo-box">
								<div class="place">
									<span class="spotname" id="spotname"></span>
	
								</div>
								<div class="modify-button">
									<div class="place-modify location" onclick="locachoice(1)">
										<span class="glyphicon glyphicon-plane"></span>위치변경
									</div>
	
									<div class="place-modify delete" onclick="delTemPhotoByday(1)"
										data-code="c3604ec6241c02961917854c2ff5c34d">
										<span class="glyphicon glyphicon-trash"></span>삭제
									</div>
								</div>
								<div class="photo-cont-modify" id="photo-cont-modify">
	
									<div id="photoView">
										<c:forEach var="photo" items="${photos }">
											<div class="photo" data-imagename="${photo}"
												style="background-size: contain; background-repeat:no-repeat; 
												background-image:url(resources/images/temphoto/${photo})">
												<div class="delete hand" data-idx="904456"
													data-uploaded="true">
													<span class="glyphicon glyphicon-remove"></span>
												</div>
											</div>
	
										</c:forEach>
									</div>
	
									<div style="height: 0px; overflow: hidden">
										<form action="savetempphoto.do" id="photoUpForm1" method="post"
											enctype="multipart/form-data">
											<input name="day" id="day" value="1"> <input
												id="photoupload1" name="filename" type="file"
												onchange="savetempphoto(1)"
												style="font-size: 1px; opacity: 0;" multiple=""
												accept="image/jpeg,image/png"> <input
												id="savetempphoto1" onclick="saveajax(1);" type="button">
										</form>
									</div>
									<div class="photo-add" onclick="photoupload(1)"
										data-seqcode="c3604ec6241c02961917854c2ff5c34d">
										<div class="add-btn"
											style="background-size: contain; background-repeat: no-repeat; background-image: url(resources/images/addPhoto.jpg)">
	
										</div>
									</div>
	
									<div class="clearBoth"></div>
								</div>
								<div class="clearBoth"></div>
								<div id="Memo1" class="memo memo-modify">
									<textarea name="memo[]" class="no-line-input"> </textarea>
									<img class="clearMemo" onclick="clearmemo(1)"
										src="resources/images/panorama/cross-mark1.png" alt="delete">
	
								</div>
							</div>
						</div>
					</div>
	
	
	
	
	
	
					<div class="mCSB_scrollTools"
						style="position: absolute; display: none;">
						<div class="mCSB_draggerContainer">
							<div class="mCSB_dragger" style="position: absolute; top: 0px;"
								oncontextmenu="return false;">
								<div class="mCSB_dragger_bar" style="position: relative;">
								</div>
							</div>
							<div class="mCSB_draggerRail"></div>
						</div>
					</div>
	
	
	
				</div>
				<button id="daydeletebutton">지우기</button>
			</div>
		</div>
	</div>
	
	
	<div id="map-box" style="position:absolute; top:75px; left:660px; width:1200px; height:880px; float:left;"></div>
</div>
	
	