<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
 
    <script type="text/javascript">

      google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawVisualization);

function drawVisualization() {
  // Some raw data (not necessarily accurate)
  var data = google.visualization.arrayToDataTable([
    ['성향', '', ''],
    ['',  10,     10],
    ['',  8,       8],
    ['',  3,       3],
    ['',  5,       5],
    ['',  8,       8],
    ['',  2,       2]
  ]);

  var options = {

    seriesType: "bars",
    series: {1: {type: "line"}},
    width:600
    
  };

  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
  chart.draw(data, options);
}
$(function() {

	$("#modify").hide();
	$("#profiletabs a:last").click(function(event) {
		event.preventDefault();
		$("#profile").hide();
		$("#profiletabs #tabs a.current").removeClass("current");
		$(this).addClass("current");
		$("#modify").show();
	});
	
	$("#profiletabs a:first").click(function(event) {
		event.preventDefault();
		$("#modify").hide();
		$("#profiletabs #tabs a.current").removeClass("current");
		$(this).addClass("current");
		$("#profile").show();
	});
	
	$("#newpassword").hide();
	
	$("#changepassword").click(function(event) {
		event.preventDefault();
		$("#newpassword").toggle();
	});
	
	$("#profiletabs #tabs a:first").click();
	
	//메뉴
	$(".tab-section").hide();
	$("#category #tabs a").click(function(event){
		event.preventDefault();
		$(".tab-section").hide();
		$("#category #tabs a.current").removeClass("current");
		$(this).addClass("current");
		var tabId = $(this).attr("href");
		$(tabId).show();
		
	});
	
	$("#category #tabs a:first").click();
	
	
	$("#imagetrevel").hide().slideDown("slow");
	
	$("#headimgclose").click(function(e) {
		$("#imagetrevel").slideUp("slow");
		
	})
})

    </script>
<style type="text/css">
#profileimg:hover {
	opacity: 0.4;
    filter: alpha(opacity=40);
}

#profile:hover { 
	display:"block";
}


#icon{
	padding-left: 70px
}
#icon img{
	
	width: 60px;
	height: 60px;
	margin-left: 10px
}

#imagetrevel{
	padding :0;
	background-image:  url("../images/sns/trevel.jpg");
}


</style>
</head>
<body>

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
					<div style="height: 150px;"" >
					<a href="/together.do"><h1><span class="glyphicon glyphicon-chevron-left"></span></h1> </a>
					</div>
				</div>
				<div class="col-sm-2" >
				  	<img src="../images/sns/puppy.jpg" class="img-circle" width="180px" height="180px"   > 
				
				</div>			
			
				
				<div class="col-sm-6" >
					
					<h1> 누구님 <small>의 블로그</small></h1>
					<button data-toggle="modal" data-target="#myPage">프로필수정 </button>
					
				</div>
				<div class="col-sm-3" >
					
					
					<button type="button" class="btn btn-danger">
						<span class="glyphicon glyphicon-camera"></span> 파노라마 만들기
					</button>

				</div>
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
				</a> <a data-toggle="modal" data-target="#myModal"> 여행도시 <span
					class="glyphicon glyphicon-plane"></span>
				</a>
			</div>
			<br /> <br />

		</div>

		<!-- 미리보기  -->
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>

			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
			<div class="col-xs-6 col-md-3">
				<a href="#" class="thumbnail"> <img src="../images/sns/puppy.jpg">
					<h3>명동</h3>
					<p>작성자</p> <span>2015.5.26 좋아요 2</span>
				</a>
			</div>
		</div>
		<!-- 여행추천 모달 -->
		<div class="modal fade" id="myModal" role="dialog">
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
							<div class="row"> 
								<table>
									<thead>
										<tr>
											<th>E-mail</th>
											<td>본인이메일</td>
										</tr>
										<tr>
											<th>name or nickname</th>
											<td><input type="text" value="wooho"></td>
										</tr>
										<tr>
											<th>password</th>
											<td><button id="changepassword" >change password</button> </td>
										</tr>
									</thead>
								</table>
										<div id="newpassword" >
										<table>
											<thead>
											<tr>
												<th>Old Password</th>
												<td><input type="text" placeholder="이번 비번" > </td>
											</tr>
											<tr>
												<th>NEW Password</th>
												<td><input type="text" placeholder="새로운비번" > </td>
											</tr>
											<tr>
												<th>Confirm Password</th>
												<td><input type="text" placeholder="한번더" > </td>
											</tr>
											
									</thead>
								</table>
										</div>
							</div>
							<div class="row"> 
								<button>save</button>
							</div>
							
						</div>
						<!-- 프로필 -->
						<div id="profile">
							<div class="row">
								<div class="col-sm-3">
								
				
									<img src="../images/sns/puppy.jpg" class="img-circle" id="profileimg" width="100px" height="100px"  /> 
							
								</div>
								<div class="col-sm-6">
									<h3>이름</h3>
								</div>
								
							</div>
							<hr>
							<div class="row">
								  <div id="chart_div"  >
								  
								  </div>
							<div id="icon">
							<img src="../images/sns/숙박.JPG" data-toggle="tooltip" data-placement="top" title="숙박">
							<img src="../images/sns/쇼핑.JPG" data-toggle="tooltip" data-placement="top" title="문화">
							<img src="../images/sns/음식.JPG" data-toggle="tooltip" data-placement="top" title="음식">
							<img src="../images/sns/자연.JPG" data-toggle="tooltip" data-placement="top" title="자연">
							<img src="../images/sns/레져.JPG" data-toggle="tooltip" data-placement="top" title="레져">
							<img src="../images/sns/문화.JPG" data-toggle="tooltip" data-placement="top" title="문화">
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
</body>
</html>