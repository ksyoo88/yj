<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>






<script type="text/javascript">
$(document).ready(function(){
		function   loginfail() {
		$("#loginfail").modal();
			
		}
	
	var login = '${login}';
	
	if(login==='false'){
		loginfail();
	
	}
	
	
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
						<form role="form" action="login.do" method="post">
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span> Username</label> <input
									type="text" class="form-control" name="loginEmail" id="loginEmail"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span> Password</label> <input
									type="text" class="form-control" name="pwd" id="pwd"
									placeholder="Enter password">
							</div>
							<div class="checkbox">
								<label><input type="checkbox" value="" checked>Remember
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
						<h3>아이디나 비번이 아닙니다</h3><h4> 다시 확인해주세요</h4>
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
						<form role="form" method="post" action="addmember.do" >
							<div class="form-group">
								<label for="username"><span
									class="glyphicon glyphicon-user"></span> 회원이름</label> <input
									type="text" class="form-control" name="name" id="username"
									placeholder="이름이나 닉네임">
							</div>
							<div class="form-group">
								<label for="user"><span
									class="glyphicon glyphicon-envelope"></span> 이메일</label> <input
									type="text" class="form-control" name="email" id="email"
									placeholder="이메일">
							</div>
							<div class="form-group">
								<label for="password1"><span class="glyphicon glyphicon-eye-open"></span> 비밀번호</label> 
								<input type="text" class="form-control" id="password1" name="password" placeholder="Enter password">
							</div>
							<div class="form-group">
								<label for="password2"><span class="glyphicon glyphicon-eye-close"></span> 비밀번호 확인</label> 
								<input type="text" class="form-control" id="password2"  placeholder="Enter password">
							</div>
							<div class="form-group">
								<label for="birth"><span class="glyphicon glyphicon-gift"></span> 생년월일</label> 
								<input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일 yymmdd 6자리">
							</div>
							<div class="radio">
								<label><input type="radio" name="gender" value="m" checked="checked">남자</label>
								<label><input type="radio" name="gender" value="f" >여자</label>
							</div>
							
							<button type="submit" class="btn btn-success btn-block">
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
		
</div>

