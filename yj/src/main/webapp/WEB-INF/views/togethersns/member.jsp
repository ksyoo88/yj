<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script type="text/javascript">




</script>
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
				
					<div id="photologImageArea" class="marginTop10 ui-corner-all2" style="position: relative; 
						border: 2px dashed #cfd6e3; background: #f6f8fa; height: 228px; text-align: center;">	
							
						<img id="selectPhotologImage" class="hand" onclick="photoupload()" src="resources/images/addPhoto.jpg" width="75" 
						alt="Add photo" style="display: inline-block; 
						margin-top: 80px; position: relative; z-index: 1;">		
						
							<div id="imageListArea" style="position: absolute; height: 64px; left: 15px; bottom: 5px; 
							right: 15px;" class="mCustomScrollbar _mCS_2">
							
								<div class="mCustomScrollBox mCS-light mCSB_horizontal" id="mCSB_2" style="position:relative; height:100%; overflow:hidden; max-width:100%;">
									<div id="tempphotoList" class="mCSB_container mCS_no_scrollbar mCSB_horizontal">
										
									
									</div>
									<div class="mCSB_scrollTools" style="position: absolute; display: none;">
										<div class="mCSB_draggerContainer">
											<div class="mCSB_dragger" style="position: absolute; left: 0px;" oncontextmenu="return false;">
												<div class="mCSB_dragger_bar" style="position:relative;">
												</div></div><div class="mCSB_draggerRail">
											</div>
										</div>
									</div>
								</div>
							</div>	
							<div style="height:0px;overflow:hidden">
								<form action="savetempphoto.do" id=photoUpForm method="post" enctype="multipart/form-data">
									<input name="day" value="1">		  
									<input id="photoupload" name="filename" type="file" onchange="savetempphoto()" style="font-size: 1px; opacity: 0;" multiple="" accept="image/jpeg,image/png">
									<input id="savetempphoto" onclick="saveajax();" type="button">
								</form>
										
									   
							</div>
						
						</div>
						<div class="paddingTop20" style="text-align: right;">
							<input type="button" onclick="delTemPhoto()" value="전부삭제" class="submitButton blueFillButton" style="width: 120px; padding: 10px;">
							<input type="button" value="등록" onclick="location.href='/yj/panorama.do';" class="submitButton blueFillButton" style="width: 120px; padding: 10px;">
						</div>
		
			</div>
		</div>
	</div>
</div>



<div id="imagetrevel" style="width: 100%;height: 200px;">
		<div class="container">
			<div class="col-sm-3">
			
			</div>
			<div class="col-sm-6">
				
					<h1>PHOLOG OPEN</h1>
					<h3>사진으로 돌아보는 여행 이야기, 포토로그로 특별한 여행이야기를 만들어 보세요</h3>
				</div>
			
			<div class="col-sm-3">
				<button type="button" id="headimgclose" class="close" >&times;</button>
			</div>
		
		</div>
	</div>
			

	<div class="container">
		<div class="page-header">
			
			
		
			<div class="row">
				<div class="col-sm-1">
					<div style="height: 150px;">
					<a href="together.do"><h1><span class="glyphicon glyphicon-chevron-left"></span></h1> </a>
					</div>
				</div>
				<div class="col-sm-2" >
				
					  	<img src="resources/images/profilephoto/${member.photo}" class="img-circle" width="180px" height="180px"   > 
				
				
				</div>			
			
				
				<div class="col-sm-6" >
					
					<h1> ${member.name } <small>님의 블로그</small></h1>
					<button data-toggle="modal" data-target="#myPage">프로필수정 </button>
					
				</div>
				<div class="col-sm-3" >
					
					
					<button  class="btn btn-danger" data-toggle="modal" data-target="#makePano">
						<span class="glyphicon glyphicon-camera"></span> 파노라마 만들기
					</button>

			</div>
			<hr/>
			<div class="row" id="category">
			
					<ul id="tabs">
						<li><a href="#tab1">전부</a></li>
						<li><a href="#tab2">PLAN</a></li>
						<li><a href="#tab3">PLACE</a></li>
						<li><a href="#tab4">PANORAMA</a></li>
						<li><a href="#tab5">Etc</a></li>
					</ul>
		</div>
	</div>
		<div class="row">

			<div>
				<a> 최신순 <span class="glyphicon glyphicon-chevron-down"></span>
				</a> <a data-toggle="modal" data-target="#myAdvice"> 여행도시 <span
					class="glyphicon glyphicon-plane"></span>
				</a>
			</div>
			<br /> <br />

		</div>

		<!-- 미리보기  -->
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>

			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
		</div>
		<!-- 여행추천 모달 -->
		<div class="modal fade" id="myAdvice" role="dialog">
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
							<span class="input-group-addon" id="basic-addon1">검색어</span> <input
								type="text" class="form-control" placeholder="검색할도시"
								aria-describedby="basic-addon1">
						</div>
						<p>요기조기 추천도시</p>
						<div class="row">
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
								</a>
							</div>
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
								</a>
							</div>
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
								</a>
							</div>
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
								</a>
							</div>
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
								</a>
							</div>
							<div class="col-xs-6 col-md-3">
								<a href="#" class="thumbnail"> <img src="resources/images/sns/puppy.jpg">
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
		<!-- 프로필 모달 -->
		<div class="modal fade" id="myPage" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<strong>마이 페이지</strong>
						</h4>
					</div>
					<div class="modal-body">
						<div id="profiletabs">
						
							<ul id="tabs">
								<li><a id="profile-tab" >프로필</a></li>
								<li><a id="modify-tab">수정</a></li>
							</ul>
							
						</div>
						<hr>
						<!-- 프로필 수정 -->
						<div id="modify">
							<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" method="post" action="modify.do" >
							
							<div class="form-group">
								<label for="username"><span
									class="glyphicon glyphicon-user"></span> 회원이름</label> <input
									type="text" class="form-control" name="modifyname" id="username" value="${member.name }"
									>
							</div>
							<div class="form-group">
							<button type="button" id="changepassword" class="btn btn-info btn-default">
							 	change password
							</button>
							</div>
							
							<div id="newpassword" >
								<div class="form-group">
									<label for="password1"><span class="glyphicon glyphicon-eye-open"></span> 비밀번호 </label><p></p>
									<input type="text" class="form-control" onblur="pwdCheck()" id="oldpassword" name="password1" placeholder="Enter password">
								</div>
								<div class="form-group">
									<label for="password2"><span class="glyphicon glyphicon-eye-close"></span>새로운 비밀번호</label> 
									<input type="text" class="form-control" id="newpassword1" name="password2"  placeholder="Enter password">
								</div>
								<div class="form-group">
									<label for="password3"><span class="glyphicon glyphicon-eye-close"></span> 비밀번호 확인</label><p></p>
									<input type="text" class="form-control" onkeyup="samepwd()" id="newpassword2" name="password3"  placeholder="Enter password">
								</div>
							</div>
							
							<button type="submit" class="btn btn-success btn-block">
								<span class="glyphicon glyphicon-new-window">
							</span> save
							</button>
						</form>
					</div>
				
					
							<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove" ></span> Cancel
						</button>
							</div>
						
							
						</div>
						<!-- 프로필 -->
						<div id="profile">
							<div class="row">
								<div class="col-sm-3">
								
									<div style="height:0px;overflow:hidden">
										<form action="profileup.do" method="post" enctype="multipart/form-data">
										   <input type="file" id="fileInput" onchange="myauto()"  name="upfile" />
										   <input id="autosubmit" type="submit">
										</form>
									</div>
								
									<img src="resources/images/profilephoto/${member.photo}" onclick="chooseFile()" class="img-circle" id="profileimg" width="100px" height="100px"  /> 
									
							
								</div>
								<div class="col-sm-6">
									<h3 id="membername"></h3>
								</div>
								
							</div>
							<hr>
							<div class="row">
								  <div id="chart_div"  >
								  
								  </div>
							<div id="icon">
							<img src="resources/images/sns/숙박.JPG" data-toggle="tooltip" data-placement="top" title="숙박">
							<img src="resources/images/sns/쇼핑.JPG" data-toggle="tooltip" data-placement="top" title="문화">
							<img src="resources/images/sns/음식.JPG" data-toggle="tooltip" data-placement="top" title="음식">
							<img src="resources/images/sns/자연.JPG" data-toggle="tooltip" data-placement="top" title="자연">
							<img src="resources/images/sns/레져.JPG" data-toggle="tooltip" data-placement="top" title="레져">
							<img src="resources/images/sns/문화.JPG" data-toggle="tooltip" data-placement="top" title="문화">
							</div>
							</div>
							<div class="row">
							</div>
							
						</div>
						
					
				</div>

			</div>
		</div>
		
	</div>

</div>

