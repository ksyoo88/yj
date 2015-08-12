<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

#imagetrevel{
	padding :0;
	background:  url("resources/images/sns/trevel.jpg") center no-repeat;
	background-size:cover;
}

</style>
</head>
<body>
<script type="text/javascript">
$(function(){
	$("#tabs a:first").click();
	$("#imagetrevel").hide().slideDown("slow");
	$("#headimgclose").click(function(e) {
		$("#imagetrevel").slideUp("slow");
	})
});
</script>

<div id="imagetrevel" style="width: 100%;height: 200px;">
	<div class="container">
		<div class="col-sm-3">
		</div>
		<div class="col-sm-6 transbox">
			<h1>같이보자 OPEN</h1>
			<h3>사진으로 돌아보는 여행 이야기, 같이보자로 특별한 여행이야기를 만들어 보세요</h3>
		</div>
		<div class="col-sm-3">
			<button type="button" id="headimgclose" class="close" >&times;</button>
		</div>
	</div>
</div>
	<div class="container">
		<div class="page-header">
			<button type="button" class="btn btn-danger">
				<span class="glyphicon glyphicon-camera"></span> 파노라마 만들기
			</button>
			<a href="/plan.do" class="btn btn-default">
				<span class="glyphicon glyphicon-camera"></span> 일정만들기
			</a>
		</div>
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
		<div class="row">

			<div>
				<a> 최신순 <span class="glyphicon glyphicon-chevron-down"></span>
				</a> <a data-toggle="modal" data-target="#myModal"> 여행도시 <span
					class="glyphicon glyphicon-plane"></span>
				</a>
			</div>
			<br /> <br />

		</div>

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
				<a href="#" class="thumbnail"> <img src=".../images/sns/puppy.jpg">
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
	</div>
</body>

</html>