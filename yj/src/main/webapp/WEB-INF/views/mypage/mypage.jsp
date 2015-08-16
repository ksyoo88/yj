<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

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


<div class="container">
	<div class="page-header">
		<div class="row mypage-header">
			<div class="col-sm-1">
				<div style="height: 150px;">
					<a href="together.do"><h1>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</h1> </a>
				</div>
			</div>
			<div class="col-sm-2">
				<img src="resources/images/profilephoto/${member.photo}" class="img-circle" width="180px" height="180px">


			</div>


			<div class="col-sm-9">

				<h1>
					${member.name } <small>님의 마이페이지</small>
				</h1>
				<button class="btn btn-default" data-toggle="modal" data-target="#myPage">프로필수정</button>
				<button class="btn btn-danger" data-toggle="modal" data-target="#makePano">
					<span class="glyphicon glyphicon-camera"></span> 파노라마 만들기
				</button>
			</div>
		</div>
	</div>
</div>

<!-- 프로필 모달 -->
<div class="modal fade profile" id="myPage" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<strong>프로필 수정</strong>
				</h4>
			</div>
			<div class="modal-body">
				<div id="profiletabs">
					<ul class="tabs">
						<li><a id="profile-tab">프로필</a></li>
						<li><a id="modify-tab">계정</a></li>
					</ul>
				</div>
				<hr>
				<!-- 프로필 수정 -->
				<div id="modify" class="tab">
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" method="post" action="modify.do">
							<div class="form-group">
								<label for="username"><span class="glyphicon glyphicon-user"></span> 회원이름</label> <input type="text" class="form-control" name="modifyname"
									id="username" value="${member.name }">
							</div>
							<div class="form-group">
								<button type="button" id="changepassword" class="btn btn-info btn-default">change password</button>
							</div>

							<div id="newpassword">
								<div class="form-group">
									<label for="oldpassword"><span class="glyphicon glyphicon-eye-open"></span> 비밀번호 </label>
									<p></p>
									<input type="password" class="form-control" onblur="pwdCheck()" id="oldpassword" name="password1" placeholder="Enter password">
								</div>
								<div class="form-group">
									<label for="newpassword1"><span class="glyphicon glyphicon-eye-close"></span>새로운 비밀번호</label> <input type="password" class="form-control"
										onblur="validationCheck();" id="newpassword1" name="password2" placeholder="비밀번호는 문자, 숫자, 특수문자의 조합으로 입력해주세요. (6~16자리)">
								</div>
								<div class="form-group">
									<label for="newpassword2"><span class="glyphicon glyphicon-eye-close"></span> 비밀번호 확인</label>
									<p></p>
									<input type="password" class="form-control" onkeyup="samepwd()" id="newpassword2" name="password3" placeholder="Enter password">
								</div>
							</div>

							<button type="submit" class="btn btn-success btn-block">
								<span class="glyphicon glyphicon-new-window"> </span> save
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
					</div>
				</div>
				<!-- 프로필 -->
				<div id="profile" class="tab">
					<div class="row">
						<div class="col-sm-3">

							<div style="height: 0px; overflow: hidden">
								<form action="profileup.do" method="post" enctype="multipart/form-data">
									<input type="file" id="fileInput" onchange="myauto()" name="upfile" /> <input id="autosubmit" type="submit">
								</form>
							</div>

							<img src="resources/images/profilephoto/${member.photo}" onclick="chooseFile()" class="img-circle" id="profileimg" width="100px" height="100px" />
						</div>
						<div class="col-sm-9">
							<h3 id="membername"></h3>
							<span>이미지 파일, 적당한 사이즈의 이미지를 등록 해 주세요.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="container">
	<ul class="nav nav-tabs content-tabs">
		<li class="active" data-tab="pano"><a href="#pano" data-toggle="tab" aria-expanded="false">파노라마</a></li>
		<li class="" data-tab="plan"><a href="#plan" data-toggle="tab" aria-expanded="false">일정</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active in" id="pano">
			<div class="row">
			</div>
			<!-- paging -->
			<%-- <tags:paginate total="50" page="1" max="10" cssClass="pagination"/> --%>

		</div>
		<div class="tab-pane fade" id="plan">
			<div class="row">
			</div>
		</div>
	</div>
</div><!-- /.container -->
<img src="resources/images/common/loading.gif" id="loading-indicator" style="display:none;" />
<script id="panoTpl" type="text/template">
<div class="col-md-3">
	<a href="panodetail.do?panoNo={{no}}" class="thumbnail">
		<div class="thumbnail">
			<div class="caption">
				<h4>{{day_memo}}</h4>
				<p></p>
			</div>
			<img src="resources/images/temphoto/{{#day_photo}}{{.}}{{/day_photo}}" alt="{{#day_photo}}{{.}}{{/day_photo}}">
		</div>
		<h3>{{title}}</h3>
		<span>{{regdate}} 좋아요 {{like}}</span>
	</a>
</div>
</script>
<script id="planTpl" type="text/template">
<div class="col-md-3">
	<a href="plandetail.do?no={{no}}" class="thumbnail">
		<div class="thumbnail">
			<img src="{{firstimage}}" alt="{{place_title}}">
		</div>
		<h3>{{title}}</h3>
		<p>작성자</p> <span> 좋아요 {{like}}</span>
	</a>
</div>
</script>

<script type="text/javascript">
$(document).ready(function() {
    var pano_load = 1; //total loaded record group(s) 난 이게 두개 필요하네
    var plan_load = 1;
    var tab = 'pano';
    var loading  = false; //to prevents multipal ajax loads
    var pano_total_groups = 0; //total record group(s)
    var plan_total_groups = 0; //total record group(s)
    
    $.getJSON("loadtotalgroups.json").done(function(json) {
    	pano_total_groups = json.panoTotalGroups;
    	plan_total_groups = json.planTotalGroups;
    });
    
    $('#loading-indicator').show();
    $.getJSON("loadpano.json", {
    	currPage : pano_load
    }).done(function(json) {
    	$('#loading-indicator').hide();
    	pano_load++;
    	var template = $('#panoTpl').html();
    	$(json).each(function() {
	        var html = Mustache.to_html(template, this);
	        var $html = $(html).hide().fadeIn(2000);
	        $('#pano .row').append($html);
    	});
    	$('#pano .row > div:nth-child(4n+1)').css("clear","both");
    	thumbnailHover();
    });
    
    $('#loading-indicator').show();
    $.getJSON("loadplan.json", {
    	currPage : plan_load
    }).done(function(json) {
    	console.log(json);
    	$('#loading-indicator').hide();
    	plan_load++;
    	var template = $('#planTpl').html();
    	$(json).each(function() {
    		console.log(this);
	        var html = Mustache.to_html(template, this);
	        var $html = $(html).hide().fadeIn(2000);
	        $('#plan .row').append($html);
    	});
    	$('#plan .row > div:nth-child(4n+1)').css("clear","both");
    });
    
    $(window).scroll(function() {
    	tab = $(".content-tabs li.active").data("tab");
    	if ($(window).scrollTop() >= ($(document).height() - $(window).height())*0.9){
    		if(tab == "pano") {
	            if(pano_load <= pano_total_groups && loading==false){
	                loading = true;
	                $('#loading-indicator').show();
	                
	                $.getJSON("loadpano.json", {
	                	currPage : pano_load
	                }).done(function(json) {
	                	$('#loading-indicator').hide();
	                	pano_load++;
	                	var template = $('#panoTpl').html();
	                	$(json).each(function() {
	            	        var html = Mustache.to_html(template, this);
	            	        var $html = $(html).hide().fadeIn(2000);
	            	        $('#pano .row').append($html);
	                	});
	                	$('#pano .row > div:nth-child(4n+1)').css("clear","both");
	                	thumbnailHover();
	                    loading = false;
	                });
	            }
    		} else if(tab == "plan") {
    			if(plan_load <= plan_total_groups && loading==false){
	                loading = true;
	                $('#loading-indicator').show();
	                
	                $.getJSON("loadplan.json", {
	                	currPage : plan_load
	                }).done(function(json) {
	                	$('#loading-indicator').hide();
	                	plan_load++;
	                	var template = $('#planTpl').html();
	                	$(json).each(function() {
	            	        var html = Mustache.to_html(template, this);
	            	        var $html = $(html).hide().fadeIn(2000);
	            	        $('#plan .row').append($html);
	                	});
	                	$('#plan .row > div:nth-child(4n+1)').css("clear","both");
	                    loading = false;
	                });
	            }
    		}
        }
    });
});
</script>