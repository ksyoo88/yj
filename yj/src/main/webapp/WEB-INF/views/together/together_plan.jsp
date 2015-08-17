<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<div id="imagetrevel" style="width: 100%; height: 200px;">
	<div class="container">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 transbox">
			<h1>같이보자 OPEN</h1>
			<h3>사진으로 돌아보는 여행 이야기, 같이보자로 특별한 여행이야기를 만들어 보세요</h3>
		</div>
		<div class="col-sm-3">
			<button type="button" id="headimgclose" class="close">&times;</button>
		</div>
	</div>
</div>
<div class="container">
	<div class="page-header">
		<button class="btn btn-danger" data-toggle="modal" data-target="#makePano">
			<span class="glyphicon glyphicon-camera"></span> 파노라마 만들기
		</button>
		<a href="/plan.do" class="btn btn-default"> <span class="glyphicon glyphicon-camera"></span> 일정만들기
		</a>
	</div>
	<div class="modal fade" id="cityModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<strong> 관심있는 도시는 어디인가요</strong>
					</h4>
					<p>관심있는 도시를 선택하려면 도시만의 선별된 최근여행 및 관심사를 보실수있습니다.</p>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">검색어</span> <input type="text" class="form-control" placeholder="검색할도시"
							aria-describedby="basic-addon1">
					</div>
					<p>요기조기 추천도시</p>
					<div class="row">
						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
							</a>
						</div>
						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
							</a>
						</div>
						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
							</a>
						</div>
						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
							</a>
						</div>
						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
							</a>
						</div>
						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
							</a>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<p>나중에 언제든지 관심도시를 바꿀수 있습니다</p>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="container">
	<ul class="nav nav-tabs content-tabs">
		<li class=""><a href="together.do?type=pano">파노라마</a></li>
		<li class="active"><a href="together.do?type=plan">일정</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active in" id="plan">
			<div class="row">
				<div>
					<c:if test="${param.order ne 'asc' }">
					<a href="?type=${param.type }&amp;order=asc"> 최신순 <span class="glyphicon glyphicon-chevron-down"></span> </a>
					</c:if>
					<c:if test="${param.order eq 'asc' }">
					<a href="?type=${param.type }&amp;order=desc"> 최신순 <span class="glyphicon glyphicon-chevron-up"></span> </a>
					</c:if>
					<!-- <a data-toggle="modal" data-target="#cityModal"> 여행도시 <span class="glyphicon glyphicon-plane"></span> </a> -->
				</div>
				<br />
			</div>
			<div class="row">
				<c:forEach var="item" items="${list }">
				<div class="col-md-3">
					<a href="plandetail.do?no=${item.no }" class="thumbnail">
						<div class="thumbnail">
							<img src="${item.firstimage }" alt="${item.place_title }">
						</div>
						<h3>${item.title }</h3>
						<p>작성자</p> <span> 좋아요 ${item.like }</span>
					</a>
				</div>
				</c:forEach>
			</div>
			<!-- paging -->
			<tags:paginate total="${totalCnt }" page="${currPage }" max="8" cssClass="pagination" pageName="currPage" queryString="&amp;type=${param.type }&amp;order=${param.order }"/>

		</div>
		<div class="tab-pane fade" id="plan">
			<div class="row">
			</div>
		</div>
	</div>
</div><!-- /.container -->
<img src="resources/images/common/loading.gif" id="loading-indicator" style="display:none;" />
<div class="modal fade" id="makePano" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" onclick="delTemPhoto()" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<strong>파노라마 만들기</strong>
				</h4>
			</div>
			<div class="modal-body">
				<div id="photologImageArea"	style="position: relative; border: 2px dashed #cfd6e3; background: #f6f8fa; height: 228px; text-align: center; background-repeat: round;     background-size: contain; background-repeat: no-repeat; background-position: center;">

					<img id="selectPhotologImage" class="hand" onclick="photoupload()" src="resources/images/addPhoto.jpg" width="75" alt="Add photo"
						style="cursor: pointer; display: inline-block; margin-top: 80px; position: relative; z-index: 1;">

					<div id="imageListArea" style="position: absolute; height: 64px; left: 15px; bottom: 5px; right: 15px;">

						<div style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
							<div id="tempphotoList" class="mCSB_container mCS_no_scrollbar mCSB_horizontal"></div>
							<div style="position: absolute; display: none;">
								<div>
									<div style="position: absolute; left: 0px;" oncontextmenu="return false;">
										<div style="position: relative;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div style="height: 0px; overflow: hidden">
						<form action="savetempphoto.do" id=photoUpForm method="post" enctype="multipart/form-data">
							<input name="day" value="1"> <input id="photoupload" name="filename" type="file" onchange="savetempphoto()"
								style="font-size: 1px; opacity: 0;" multiple="" accept="image/jpeg,image/png"> <input id="savetempphoto" onclick="saveajax();"
								type="button">
						</form>
					</div>
				</div>
				<div class="paddingTop20" style="text-align: right;">
					<input type="button" onclick="delTemPhoto()" value="전부삭제" class="submitButton blueFillButton" style="width: 120px; padding: 10px;"> <input
						type="button" value="등록" onclick="location.href='/panorama.do';" class="submitButton blueFillButton" style="width: 120px; padding: 10px;">
				</div>

			</div>
		</div>
	</div>
</div>
