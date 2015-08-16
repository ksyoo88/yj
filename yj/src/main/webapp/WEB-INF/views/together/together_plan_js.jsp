<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="resources/js/jquery/jquery.form.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function thumbnailHover() {
	$('.thumbnail').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    );
};
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
	 thumbnailHover();
	$("#imagetrevel").hide().slideDown("slow");
	$("#headimgclose").click(function(e) {
		$("#imagetrevel").slideUp("slow");
	})
	
	var upload = $("#photoupload")[0];
	var holder = document.getElementById('photologImageArea');

	upload.onchange = function(e) {
		e.preventDefault();
		checkvalue();
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

});
</script>
    