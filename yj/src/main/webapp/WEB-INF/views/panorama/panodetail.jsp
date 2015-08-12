<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="col-md-4" id="panodetail-">
		<div id="photolog" class="bAutoPane whiteOpacity30" data-boxs=""
			style="position: fixed; width: 0px; border: 0px; top: 62px; bottom: 50px; opacity: 1; min-width: 650px; ">
			<div id="photologDetailBox">
				<div id="photolog-timeline" class="mCustomScrollbar _mCS_6"
					style="height: 829px;">
					
						<div class="mCSB_container mCS_no_scrollbar"
							style="position: relative; top: 0px;">
							
							<div class="date-year"><fmt:formatDate value="${panorama.panoRegdate }" pattern="yyyy"/></div>
							<div class="date-month"><fmt:formatDate value="${panorama.panoRegdate }" pattern="M"/></div>
							<div class="date-day">
							<c:forEach items="${panorama.panodays }" var="panodays" varStatus="day">
								<p>
									<a class="moveScroll" href="#photo-2015-03-29"><fmt:formatDate value="${panodays.date }" pattern="d"/></a>
								</p>
							</c:forEach>
							</div>
						</div>
						
					
				</div>
				<div id="photolog-container" class="mCustomScrollbar _mCS_7"
					style="height: 879px;">
						
						<div class="mCSB_container" style="position: relative; top: 0px;">
							<div class="photolog-header"
								style="background: url(resources/images/cat.jpg); background-repeat: round;">
								<div class="mask"></div>
								<div class="title" data-pano-no="${panorama.panoNo }" >${panorama.panoTitle }</div>
								<div class="user">
									<div class="profile user-photo">
										<div class="memberProfileImage profileImageMedium"
											style="position: relative; ">
										<img src="resources/images/profilephoto/${panorama.member.photo }" class="img-circle" 
										width="45px" height="45px"style="margin-top: 3px;">
										</div>
										
									</div>
									<div class="userName t-name" data-uno="4060">${panorama.member.name }</div>
								</div>
								<div class="btn-act">
									<ul>
										<li id="LikeBtn">
											<img id="photologLikeButton" likecheck="likebefore" class="hand"
											src="resources/images/panorama/likebefore.png" style="width: 30px"  alt="좋아요">
											<p></p>
										<p class="t-subj">좋아요</p>
											<p></p>
											<p class="count like">${panorama.panoLike }</p>
											</li>
										
										
										
										<li></li>
									</ul>
								</div>
							</div>
							<div class="button-set">		
										
										<div class="btn-delete hand">
											<img src="resources/images/panorama/trash1.png" alt="delete">
										</div>		
										<div class="btn-modify hand"><span>수정</span>
										</div>		
												</div>
							<c:forEach items="${panorama.panodays }" var="panodays" varStatus="day">
							
												
							<div class="photolog-day">
								<div class="title-box" id="photo-2015-03-29">
									<div class="day">
										DAY ${panodays.dayCnt } <span><fmt:formatDate value="${panodays.date }" pattern="d/M/yyyy"/></span>
									</div>
									<div class="location"></div>
								</div>
								
								<div class="photo-box">
									<div class="place">
										<img src="resources/images/panorama/pinok.png" alt="place pin">
										${panodays.place.title }
									</div>
									<div class="photo-cont">
									
									<c:forEach items="${panodays.photos }" var="photos" varStatus="i">
									
										<a href="resources/images/temphoto/${photos.photo }" data-lightbox="${day.index }">
											<div title="23:38" class="photo images hand box size${photos.size}"
												style="background-image: url(resources/images/temphoto/${photos.photo }); background-repeat: round;">
											<div class="inline"></div>
											</div>
										</a>
											
									</c:forEach>
									</div>
									<div class="memo modify">${panodays.dayMemo }</div>
									</div>
								</div>
							</c:forEach>	
							
							
							<div id="panoReplyWei" >
								<table style="width: 100%">
									<tr>
										<td>
											<div class="user">
												<div class="profile user-photo">
													<div class="memberProfileImage profileImageMedium"
														style="position: relative; ">
													<img src="resources/images/profilephoto/${panorama.member.photo }" class="img-circle" 
													width="45px" height="45px"style="margin-top: 3px;">
													</div>
													
												</div>
												
											</div>
										</td>
										<td>
										
											<div class="userName t-name" data-uno="4060">${panorama.member.name }</div>
										</td>
										<td>
											 <input type="text" class="form-control" id="replywrite">
										</td>
										<td>
											<button type="button" class="btn btn-default">작성</button>
										</td>
									</tr>
								</table>
							</div>
							<div id="panoReplyShow">
								<table style="width: 100%">
									<tr>
										<td>
											<div class="user">
												<div class="profile user-photo">
													<div class="memberProfileImage profileImageMedium"
														style="position: relative; ">
													<img src="resources/images/profilephoto/${panorama.member.photo }" class="img-circle" 
													width="45px" height="45px"style="margin-top: 3px;">
													</div>
													
												</div>
												
											</div>
										</td>
										<td>
											<div class="userName t-name" data-uno="4060">${panorama.member.name }</div>
										</td>
										<td> 
											안녕하세요 구리네요
										</td>
										<td>
											<button type="button" class="btn btn-danger">삭제</button>
										</td>
									</tr>
								</table>
								
							</div>
							
						</div>
				</div>
				
			</div>
		</div>

	</div>
<!-- <script type="text/javascript" src="resources/js/lightbox.js"></script> -->
