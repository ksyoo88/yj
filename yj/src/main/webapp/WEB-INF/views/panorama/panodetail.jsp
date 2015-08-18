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
							<c:forEach items="${panorama.panodays }" var="panodays">
								
								<p>
									<a class="moveScroll" href="#photo-${panodays.date }"><fmt:formatDate value="${panodays.date }" pattern="d"/></a>
								</p>
							</c:forEach>
							</div>
						</div>
						
					
				</div>
				<div id="photolog-container" class="mCustomScrollbar _mCS_7"
					style="height: 879px;">
						
						<div class="mCSB_container" style="position: relative; top: 0px;">
							
							<c:choose>
								<c:when test="${panorama.panodays[0].photos[0].photo !=null}">
							<div class="photolog-header" style="background: url(resources/images/temphoto/${panorama.panodays[0].photos[0].photo }); background-repeat: round;">
								</c:when>
								<c:otherwise>
							<div class="photolog-header" style="background: url(resources/images/cat.jpg); background-repeat: round;">
								</c:otherwise>
							
							</c:choose>
							
								
								<div class="mask"></div>
								<div class="title" data-pano-no="${panorama.panoNo }" ><c:out value="${panorama.panoTitle }"></c:out> </div>
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
										
										<c:choose>
											<c:when test="${panorama.likecheck =='T' }">
											<img id="photologLikeButton" likecheck="likeafter" class="hand"
											src="resources/images/panorama/likeafter.png" style="width: 30px"  alt="좋아요">
											</c:when>
											<c:otherwise>
											<img id="photologLikeButton" likecheck="likebefore" class="hand"
											src="resources/images/panorama/likebefore.png" style="width: 30px"  alt="좋아요">
											</c:otherwise>
											
										</c:choose>
											<p></p>
										<p class="t-subj">좋아요</p>
											<p></p>
											<p class="count like">${panorama.panoLike }</p>
											</li>
										
										
										
										<li></li>
									</ul>
								</div>
							</div>
							<c:if test="${panorama.member.no == member.no }">
							<div class="button-set">		
							
								<div id="dialog" title="삭제 여부입니다">
								  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>정말 삭제하시겠습니까?</p>
								</div>
								<div id="dialogmodify" title="수정여부입니다.">
								  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>수정 하시겠습니까?</p>
								</div>
																		
										<div class="btn-delete hand">
											<img src="resources/images/panorama/trash1.png" alt="delete">
										</div>		
											<div class="btn-modify hand"><span>수정</span>
										</div>		
							</div>
                 			</c:if>
							<c:forEach items="${panorama.panodays }" var="panodays" varStatus="day">
							
												
							<div class="photolog-day">
								<div class="title-box" id="photo-${panodays.date }">
									<div class="day">
										DAY ${panodays.dayCnt } <span><fmt:formatDate value="${panodays.date }" pattern="d/M/yyyy"/></span>
									</div>
									<div class="location"></div>
								</div>
								
								<div class="photo-box">
									<div class="place">
									<c:choose>
										<c:when test="${panodays.place.title !=null }">
											<img src="resources/images/panorama/pinok.png" alt="place pin">
										</c:when>
										<c:otherwise>
											<img src="resources/images/panorama/pinno.png" alt="place pin">
										</c:otherwise>
									</c:choose>
									
										${panodays.place.title }
									</div>
									<div class="photo-cont">
									
									<c:forEach items="${panodays.photos }" var="photos" varStatus="i">
									
										<a href="resources/images/temphoto/${photos.photo }" data-lightbox="${day.index }" data-photo="${photos.photo }">
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
								<div class="palceInfo">
									<p class="distance"><small></small></p>
									<p hidden class="mapX"><small>${panodays.place.mapx }</small></p>
									<p hidden class="mapY"><small>${panodays.place.mapy }</small></p>
									<p hidden class="cate">${panodays.place.cat1}</p>
									<p hidden class="pTitle">${panodays.place.title }</p>
									<p hidden class="image">${panodays.place.firstimage }</p>
									<p hidden class="contentid">${panodays.place.contentid }</p>
								</div>
								
							</c:forEach>
							
							
							<div id="panoReplyShow">
								<table style="width: 100%">
								<tbody>
								<c:forEach items="${panorama.replys }" var="replys">
								
									<tr id="replyNO${replys.panoReplyNo }">
										<td>
											<div class="user">
												<div class="profile user-photo">
													<div class="memberProfileImage profileImageMedium" style="position: relative; ">
														<img src="resources/images/profilephoto/${replys.member.photo }" class="img-circle" width="45px" height="45px"style="margin-top: 3px;">
													</div>
												</div>
											</div>
										</td>
										<td>
											<div class="userName t-name">${replys.member.name }</div>
										</td>
										<td> 
											<div id="reply"><c:out value="${replys.reply }"></c:out> </div>
										</td>
										<td>
											<div><fmt:formatDate value="${replys.date }" pattern="yyyy/M/d"/> </div>
										</td>
										<td>
											<c:if  test="${replys.member.no == member.no }">
												<button type="button" onclick="deletereply(${replys.panoReplyNo })" data-reply-no="${replys.panoReplyNo }" class="btn btn-danger">삭제</button>
							                </c:if>
										</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
								
							</div>
							
							<div id="panoReplyWrite" >
								<table style="width: 100%">
									<tr>
										<td>
											<div class="user">
												<div class="profile user-photo">
													<div class="memberProfileImage profileImageMedium" style="position: relative; ">
														<img src="resources/images/profilephoto/${member.photo }" class="img-circle" width="45px" height="45px"style="margin-top: 3px;">
													</div>
													
												</div>
												
											</div>
										</td>
										<td>
										
											<div class="userName t-name" >${member.name }</div>
										</td>
										<td>
											 <input type="text" class="form-control" onkeypress="if(event.keyCode==13) {replywrite(); return false;}" id="replyinput">
										</td>
										<td>
											<button type="button" class="btn btn-default" id="replywrite">작성</button>
										</td>
									</tr>
								</table>
							</div>
							
							
						</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div id="map-box" style="position:absolute; top:60px; left:680px; width:1200px; height:880px; float:left;"></div>
<!-- <script type="text/javascript" src="resources/js/lightbox.js"></script> -->
