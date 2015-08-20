<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="resources/js/jquery/jquery.form.js" type="text/javascript"></script>
<script src="resources/js/mustache/mustache.js" type="text/javascript"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="resources/js/mypage/mypage.js"></script>
<script type="text/javascript">
function savetempphoto() {
	$("#savetempphoto").click();
}

function getTemPhoto() {
	var url="resources/images/temphoto/ZZZZZ"
	var str = '<div class="imageList posRelative lineOrange" data-idx="904479"  style="width: 53px; height: 53px; margin: 0 4px; float:left;  background-size: contain; background-repeat:no-repeat; background-image: url('+url+')"></div>'
	
	var content="";
	$.ajax({
		url:"getTemPhoto.do",
		type:"post",
		dataType:"json",
		success: function(result) {
			
			var photos=result.photos;
			
			for(var i=0;i<photos.length;i++){
				
				content +=str.replace("ZZZZZ", photos[i]);
				if(i==7){
					$("#selectPhotologImage").hide();
				}	
				
			}
			
			$("#tempphotoList").html(content);
			
			$(".imageList").click(function() {
				var holder = document.getElementById('photologImageArea');
				var imgurl=$(this).css("background-image");
				
				//imgurl = imgurl.replace("url(","url(").replace(")",")");
				 holder.style.backgroundImage =imgurl;
			})
		}
	});
}

function saveajax() {
	var form = $("#photoUpForm")[0];
	var formData = new FormData(form);
	$.ajax({
		url:"savetempphoto.do",			
		processData : false,
		contentType : false,
		data : formData,
		dataType:"text",
		type : 'POST',
		success:function(result){
			getTemPhoto();
		}
	})
};

function photoupload() {
	$("#photoupload").click();
};
function myauto() {
	$("#autosubmit").click();
}
function chooseFile() {
      $("#fileInput").click();
}

function validationCheck() {
	var newPwd = $("#newpassword1");
	var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
	if(!regExp.test(newPwd.val())) {
		newPwd.val("");
		// newPwd.focus();
		alert('비밀번호는 문자, 숫자, 특수문자의 조합으로 입력해주세요. (6자리 이상 16자리 이하)');
		return false;
	}
}

function samepwd() {
	var pwd1=$("#newpassword1").val();
	var pwd2=$("#newpassword2").val();

	var content="";
	
	if(pwd1===pwd2){
		content +="<span style='color: green'>비번이 일치합니다.</span>";
	}else{
		content +="<span style='color: red'>비번이 일치하지 않습니다.</span>";
	}
	$("#newpassword .form-group:last p").html(content);
}

function pwdCheck() {
	var pwd=$("#oldpassword").val();
   	var content="";
	$.ajax({
		url	:"checkpwd.do",
		type:"post",
		data:{pwd:pwd},
		dataType:"text",
		success: function(result) {
			if(result == "true") {
   				content +="<span style='color: green'>비번이 일치합니다.</span>";
   			}else{
   				content +="<span style='color: red'>틀린비번입니다.</span>";
   			}
			$("#newpassword .form-group:first p").html(content);
		}
	})
};
	
function delTemPhoto() {
	console.log('삭제')
	$.ajax({
		url:"delTemPhoto.do",
		type:"post",
		dataType:"json",
		success: function(result) {
			$("#selectPhotologImage").show();
			$("#tempphotoList").html("");
			var holder = document.getElementById('photologImageArea');
			holder.style.background ='#f6f8fa';
		}
	})
}


$(function() {
	var upload = $("#photoupload")[0];
	var holder = document.getElementById('photologImageArea');

	upload.onchange = function(e) {
		e.preventDefault();
		savetempphoto();
		var file = upload.files[0], reader = new FileReader();
		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;
			// note: no onload required since we've got the dataurl...I think! :)
			if (img.width > 300) { // holder width
				img.width = 300;
			}
			//holder.innerHTML = '';
			holder.style.backgroundImage = "url('" + event.target.result + "')";
			//holder.appendChild(img);
		};
		reader.readAsDataURL(file);
		return false;
	}

	function checkvalue() {
		var upload = $("#photoupload")[0];
		var imgex = [ 'bmp', 'jpg', 'gif', 'png', 'jpeg', 'BMP', 'JPG',
				'GIF', 'PNG', 'JPEG' ];

		if (!upload.value) {
			alert("이미지 파일을 업로드 해야합니다.")
			return false;
		}

		var v = upload.value.split('\\');
		var filename = v[v.length - 1];

		v = filename.split('.');
		var extension = v[v.length - 1];

		var isImg = imgex.indexOf(extension);
		if (isImg === -1) {
			alert("이미지 파일만 업로드할 수 있습니다. ");
			return false;
		}

		return true;
	}
	

	// $("#modify").hide();
	$(".tabs li a").click(function(event) {
		event.preventDefault();
		$(this).addClass("current").parent().siblings().each(function(){
			$(this).find("a").removeClass("current");
		});
		var clickedId = "#" + $(this).attr("id").replace("-tab","");
		$(".profile .tab").hide();
		$(clickedId).show();
	});
	$("#newpassword").hide();
	$("#changepassword").click(function(event) {
		event.preventDefault();
		$("#newpassword").toggle(500);
	});

	$("#profiletabs .tabs a:first").click();

	//메뉴
	$(".tab-section").hide();
	$("#category .tabs a").click(function(event) {
		event.preventDefault();
		$(".tab-section").hide();
		$("#category .tabs a.current").removeClass("current");
		$(this).addClass("current");
		var tabId = $(this).attr("href");
		$(tabId).show();

	});

	$("#category .tabs a:first").click();

	$("#imagetrevel").hide().slideDown("slow");

	$("#headimgclose").click(function(e) {
		$("#imagetrevel").slideUp("slow");

	});

});
</script>
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
		<span> 좋아요 {{like}}</span>
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
	                    loading = false;
	                });
	            }
    		}
        }
    });
});
</script>