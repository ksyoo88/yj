<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>
<%@taglib prefix="tilesx" uri="http://tiles.apache.org/tags-tiles-extras"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tilesx:useAttribute name="current"/>

	<!-- Fixed navbar -->
 	<nav class="navbar nav-pills navbar-inverse" id="navigationBar">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand glyphicon glyphicon-plane" href="/"></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="${current == 'attraction' ? 'active' : '' }"><a href="attraction.do">여기추천</a></li>
					<li class="${current == 'plan' ? 'active' : '' }"><a href="plan.do">저기가자</a></li>
					<li class="${current == 'together' ? 'active' : '' }"><a href="together.do">같이보자</a></li>
				</ul>
			</div>
			<input type="hidden" id="hdnSession" data-value="${member }">
			
			<ul class="nav navbar-nav navbar-right">
				<!-- 
					<li><a href="#formModal"><span class="glyphicon glyphicon-user"></span>
						회원가입</a></li> 
				-->
				<c:choose>
					<c:when test="${member!=null}">
						<li class="${current == 'mypage' ? 'active' : '' }"><a href="/mypage.do" id="membername" >
						<img src="resources/images/profilephoto/${member.photo}" class="img-circle" width="30px" height="30px">
								${member.name }</a>
						</li>
						<li>
							<a href="<c:url value='/logout' />" ><span class="glyphicon glyphicon-log-in"></span>	로그아웃</a>
						</li>
						<c:url var="logoutUrl" value="/j_spring_security_logout"/>
						<form action="${logoutUrl}" method="post" id="logoutForm" style="display: none;">
						</form>
						
					</c:when>
					<c:otherwise>
						<li><a href="#" id="myBtn"><span class="glyphicon glyphicon-log-in"></span>
								로그인</a></li>
					</c:otherwise>
				</c:choose>
				
				
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" onkeyup="searchheader();" id="searchkeyword" maxlength="40" class="form-control" placeholder="어디를 여행하고 싶으세요?">
						<input type="text" id="hidekey" hidden >
					</div>
					<button type="button" onclick="searchkey()" class="btn btn-default">검색</button>
				</form>
				
			</ul>
		</div>
	</nav>

<script type="text/javascript">
function searchkey() {
	var hidekey = $("#hidekey").val();
	$.ajax({
		  url:"movelocation.do",
			data:{title:hidekey},
			type:"post",
			dataType:"json",
			success: function(result) {
				place=result.place;
				var conID = place.contentid; 
				var uri=window.location.pathname;
				console.log(uri);
				var result = uri.indexOf('plan.do')
				console.log(result);
				
				if(result != -1 ){
					
					var mapX = place.mapx; 
					var mapY = place.mapy; 
					var moveLatLon = new daum.maps.LatLng(mapY, mapX);
	     		 	map.panTo(moveLatLon);   
				}else{
				location.replace("plan.do?contentid="+conID);  
					
				}
				
			}
	 })
}

function searchheader() {
	var inputkeyword = $("#searchkeyword").val();
	if(inputkeyword.length>=2){
		
		$.ajax({
			Type:"post",
			url:"searchlocation.do",
			data:{inputkeyword:inputkeyword},
			dataType:"json",
			success:function(result){
				
				var data='';
				var titlevalue = new Array();
				
				
				places=result.places
				    	  
				 for(var i =0; i<places.length;i++){
					var place = places[i];
				   	console.log(place.title);
					 title=place.title;
					titlevalue.push(title);
					
				}
				
				$("#searchkeyword").autocomplete({
				      source: titlevalue,
				    
				      select:function(e, i){
				    	 
				      	$("#hidekey").val(i.item.value);
				      	var hidekey=i.item.value
				      	
				      	console.log("숨겨진-"+hidekey);
				      	
				      }
				 });
			}
		})
	}
};


</script>

<script type="text/javascript">

$(document).ready(function(){
	<c:if test="${not empty error}">
		$("#loginfail").modal();
	</c:if>
	<c:if test="${not empty msg}">
		$("#msgModal").modal();
	</c:if>
	
	var $frm = $("form[name=checkmail]");
	
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
    
    $("#checkEmail").click(function(e) {
		var email=$("#useremail").val();
    	
    	$.ajax({
    		url : "checkEmail.do",
    		type : "post",
    		data : {email:email},
    		dataType : "text",
    		success : function (result) {
    			
    			if(result == "true") {
    				$frm.submit();
    			}else{
    				var content="";
    				content +="<h4>없는 이메일입니다.</h4>";
    				content +="<h4>다시 확인해주세요.</h4>";
    				
    			}
    			
    			$("#checkEmaildiv").html(content);
    		}
    	});
		
	});
    
    
});

</script>



	<div class="container">

		<!-- Trigger the modal with a button -->
		<!-- 		
			<button type="button" class="btn btn-default btn-lg" id="myBtn">로그인</button>
		 -->
		<!-- Login Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Login
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" action="<c:url value='/j_spring_security_check' />" method="post">
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span> Username</label> <input
									type="text" class="form-control" name="j_username" id="loginEmail"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span> Password</label> <input
									type="password" class="form-control" name="j_password" id="pwd"
									placeholder="Enter password">
							</div>
							<div class="checkbox">
								<label><input type="checkbox" name="remember-me" checked>Remember
									me</label>
							</div>
							<button type="submit" class="btn btn-success btn-block">
								<span class="glyphicon glyphicon-off"></span> Login
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
						<p>
							회원이 아니세요? <a data-toggle="modal" data-target="#formModal">회원가입</a>
						</p>
						<p>
							비번이 기억이 안나세요? <a data-toggle="modal" data-target="#findModal">비번 찾기</a>
						</p>
					</div>
				</div>

			</div>
		</div>
		<!-- find Modal -->
		
		
		<div class="modal fade" id="findModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-search"></span> 비밀번호 찾기
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" action="email.do" method="post" name="checkmail">
							<div class="form-group">
								<label for="useremail"><span
									class="glyphicon glyphicon-user"></span> email</label> <input
									type="text" class="form-control" name="to" id="useremail"
									placeholder="Enter email">
							</div>
						
							<div class="button" >
								<button type="button" id="checkEmail" class="btn btn-success btn-default "> 보내기</button>
								
							</div>
							<div id="checkEmaildiv">
							
							</div>
						<p>Email- 주소로 임시 비밀번호가 발송됩니다.</p>
						<p>로그인후 비번을 바꿔주세요</p>
							
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
				</div>

			</div>
			
			
		</div>
			
	
		</div>
		<!-- Login Modal -->
		<div class="modal fade" id="loginfail" role="dialog">
			<div class="modal-dialog">
			
				<!-- 로그인실패 -->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-search"></span> 로그인실패
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<h3>
							<c:out value="${error }" />
						</h3><h4> 다시 확인해주세요</h4>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
						<p>
							회원이 아니세요? <a data-toggle="modal" data-target="#formModal">회원가입</a>
						</p>
						<p>
							비번이 기억이 안나세요? <a data-toggle="modal" data-target="#findModal">비번 찾기</a>
						</p>
					</div>

				</div>
			</div>
		</div>
		<!-- msg Modal -->
		<div class="modal fade" id="msgModal" role="dialog">
			<div class="modal-dialog">
			
				<!-- 로그인실패 -->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-search"></span> INFO
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<h3>
							${msg }
						</h3>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- form Modal -->
		<div class="modal fade" id="formModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-pencil"></span> 회원가입
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" method="post" action="addmember.do" id="joinform">
							<div class="form-group">
								<label for="username"><span
									class="glyphicon glyphicon-user"></span> 회원이름</label>
									<input type="text" class="form-control" name="name" id="username"
										placeholder="이름이나 닉네임" maxlength="30">
							</div>
							<div class="form-group">
								<label for="user"><span
									class="glyphicon glyphicon-envelope"></span> 이메일</label>
									<input type="text" class="form-control" name="email" id="email"
										placeholder="이메일" maxlength="100">
							</div>
							<div class="form-group">
								<label for="password1"><span class="glyphicon glyphicon-eye-open"></span> 비밀번호</label> 
								<input type="password" class="form-control" id="password1" name="password" placeholder="비밀번호는 문자, 숫자, 특수문자의 조합으로 입력해주세요. (6~16자리)">
							</div>
							<div class="form-group">
								<label for="password2"><span class="glyphicon glyphicon-eye-close"></span> 비밀번호 확인</label> 
								<input type="password" class="form-control" id="password2"  placeholder="Enter password">
							</div>
							<div class="form-group">
								<label for="birth"><span class="glyphicon glyphicon-gift"></span> 생년월일</label> 
								<input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일 yymmdd 6자리">
							</div>
							<div class="radio">
								<label><input type="radio" name="gender" value="m" checked="checked">남자</label>
								<label><input type="radio" name="gender" value="f" >여자</label>
							</div>
							
							<button type="button" class="btn btn-success btn-block joinBtn">
								<span class="glyphicon glyphicon-new-window">
							</span> 회원가입
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
						
					</div>
				</div>

			</div>
		</div>
		
		<script type="text/javascript">
			$(function() {
				$("input[name=email]").on("blur", function() {
					var $email = $(this);
					$.ajax({
			    		url : "checkEmail.do",
			    		type : "post",
			    		data : {email:$email.val()},
			    		dataType : "text",
			    		success : function (result) {
			    			
			    			if(result == "true") {
			    				alert("존재하는 이메일 입니다.");
			    				$email.val("");
			    				$email.focus();
			    				return false;
			    			}
			    		}
			    	});
				});
				
				// 유효성 검사
				$(".joinBtn").on("click", function() {
					$frm = $("#joinform");
					$name = $("input[name=name]");
					$email = $("input[name=email]");
					$password1 = $("input[id=password1]");
					$password2 = $("input[id=password2]");
					$birth = $("input[name=birth]");
					
					if ($name.val() == '') {
						$name.focus();
						alert('이름을 입력해 주세요.');
						return false;
					}
					if ($email.val() == '') {
						$email.focus();
						alert('이메일을 입력해 주세요.');
						return false;
					}
					if ($password1.val() == '') {
						$password1.focus();
						alert('비밀번호를 입력해 주세요.');
						return false;
					}
					if ($birth.val() == '') {
						$birth.focus();
						alert('생년월일을 입력해 주세요.');
						return false;
					}
					
					// email patt
					var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
					if(!regExp.test($email.val())) {
						$email.focus();
						alert('이메일이 잘 못 입력되었습니다.');
						return false;
					}
					
					if($password1.val() != $password2.val()) {
						$password1.focus();
						alert('비밀번호가 일치하지 않습니다.');
						return false;
					}
					
					regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
					if(!regExp.test($password1.val())) {
						$password1.val("");
						$password1.focus();
						alert('비밀번호는 문자, 숫자, 특수문자의 조합으로 입력해주세요. (6자리 이상 16자리 이하)');
						return false;
					}
					
					regExp = /^(\d{2})[0|1](\d)[0|1|2|3](\d)$/;
					if(!regExp.test($birth.val())) {
						$birth.focus();
						alert('생년월일(6자리)을 정확히 입력해 주세요.');
						return false;
					}
					
					$frm.submit();
				});
			});
		</script>
		
</div>

	
	