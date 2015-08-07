<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js/mscroll/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap-slider.min.js"></script>

  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
  <script>

  function photoupload(dd) {
  		
  	$("#photoupload"+dd).click();
  };
  
  function savetempphoto(dd) {
		$("#savetempphoto"+dd).click();
	}
	
  function saveajax(dd) {
	  
  	var form = $("#photoUpForm"+dd)[0];
  	var formData = new FormData(form);
  	$.ajax({
  		url:"savetempphoto.do",			
  		processData : false,
  		contentType : false,
  		data : formData,
  		dataType:"text",
  		type : 'POST',
  		success:function(result){
  			
  			getTemPhoto(dd);
  			}
  	})
  };
  
  //사진 뿌려주기
  function getTemPhoto(dd) {

		//var url="resources/images/temphoto/ZZZZZ"
	//	var str = '<div class="imageList posRelative lineOrange" data-idx="904479"  style="width: 53px; height: 53px; margin: 0 4px; float:left;  background-size: contain; background-repeat:no-repeat; background-image: url('+url+')"></div>'
		
		var str='<div class="photo" data-idx="904456" data-imagename="AAAAA" style="background-size: contain; background-repeat:no-repeat; background-image:url(resources/images/temphoto/ZZZZZ)"><div class="delete hand" data-idx="904456" data-uploaded="true"><span class="glyphicon glyphicon-remove"></span></div></div>	'
		var content="";
		$.ajax({
			url:"getTemPhotoByday.do",
			data:{day:dd},
			type:"post",
			dataType:"json",
			success: function(result) {
				
				var photos=result.photos;
				
				for(var i=0;i<photos.length;i++){
					
					var cc=str.replace("AAAAA", photos[i]);
					cc=cc.replace("ZZZZZ", photos[i]);
					content +=cc;
					
				}
				
				$("#newtemp"+dd+" #photoView").html(content);
				
				/* $(".imageList").click(function() {
					var holder = document.getElementById('photologImageArea');
					var imgurl=$(this).css("background-image");
					
					//imgurl = imgurl.replace("url(","url(").replace(")",")");
					 holder.style.backgroundImage =imgurl;
				}) */
			
				$("#photoView .delete").click(function() {
					var $this =$(this).parent()
					var name=$(this).parent().attr("data-imagename");
					
					$.ajax({
						url:"delTemPhotoByname.do",
						data:{name:name},
						type:"post",
						dataType:"json",
						success: function(result) {
							$this.remove();
						}
						
					})
				})
			}
		});
	}
  
	
  function delTemPhoto() {
  	
  		console.log('삭제')
  		$.ajax({
  			url:"delTemPhoto.do",
  			type:"post",
  			dataType:"json",
  			success: function(result) {
  				$("#photoView").empty();
  			}
  		})
  	
  }


	 function datepick() {
		
		 $("#hiddenCalander").show('slow');
		
	   $( "#datepicker" ).datepicker();
	   
	   
	}
		function parseDate(s) {
			var b = s.split(/\D/);
			var newDate = new Date();
			
			newDate.setFullYear(b[2],--b[0],b[1]);
			
			var year = newDate.getFullYear();
			var month = newDate.getMonth()+1;
			var date = newDate.getDate();
		    //return year+"년 "+month+"월 "+date+"일 " + days[tempDate.getDay()] ;
		    return newDate ;
		}

		function parseAddDate(s) {
			var b = s.split(/\D/);
			var tempDate = new Date(b[0], --b[1], b[2]);
			tempDate.setDate(tempDate.getDate()+1 );
			var year = tempDate.getFullYear();
			var month = tempDate.getMonth()+1;
			var date = tempDate.getDate();
		    return tempDate ;
		}
		
		//데이 전체 삭제
		function delTemPhotoByday(temday) {
			     
			$.ajax({
				url:"delTemPhotoByday.do",
				data:{day:temday},
				type:"post",
				dataType:"json",
				success: function(result) {
					$("#newtemp"+tempday+" #photoView").empty();
					
					
				}
			})
			
		}
		
		//메모 삭제
		function clearmemo(num) {
			$("#Memo"+num+" .no-line-input").val("");
		}
		
	
$(function() {
	
	//취소버튼 누를시 임시 저장소 삭제하고 member.do로 이동
	$(".btn-cancel").click(function() {
		delTemPhoto();
		location.href='/yj/member.do';
	})
	
	//파노 제목 지우기
	$(".header-edit .glyphicon").click(function() {
		
		$(".header-edit .no-line-input").val("");
	})
	
	//사진 하나 지우기
	$("#photoView .delete").click(function() {
		var $this =$(this).parent()
		
		var name=$(this).parent().attr("data-imagename");
		
		$.ajax({
			url:"delTemPhotoByname.do",
			data:{name:name},
			type:"post",
			dataType:"json",
			success: function(result) {
				$this.remove();
				
				
			}
			
		})
	})
	


	

	var d = new Date();
	var month = d.getMonth() + 1;
	var year = d.getFullYear();
	var day = d.getDate();
	var daycnt=1;

		
	//일정 추가
	$(".btn-addphoto").click(function() {

		daycnt=daycnt+1;
		
		d.setDate(d.getDate(d) + 1);
		d = new Date(d);
		
		var newyear = d.getFullYear();
		var newmonth = d.getMonth()+1;
		var newday = d.getDate();

		

		var dateday = "<p><a class='moveScroll' href='#photo-"+newyear+"-"+newmonth+"-"+newday+"'>"
				+ newday + "</a></p>"
		$(".date-day").append(dateday);
				
		var formTemplate=$("#form-template").html();
		formTemplate=formTemplate.replace("ddddaaaayyyy","DAY "+daycnt);
		formTemplate=formTemplate.replace("newtemp","newtemp"+daycnt);
		formTemplate=formTemplate.replace('id="day"','id="day'+daycnt+'"');
		formTemplate=formTemplate.replace('id="day-box"','id="day-box'+daycnt+'"');
		formTemplate=formTemplate.replace('value="1"','value="'+daycnt+'"');
		formTemplate=formTemplate.replace('onclick="saveajax(1)"','onclick="saveajax('+daycnt+')"');
		formTemplate=formTemplate.replace('onclick="photoupload(1)"','onclick="photoupload('+daycnt+')"');
		formTemplate=formTemplate.replace('onchange="savetempphoto(1)"','onchange="savetempphoto('+daycnt+')"');
		formTemplate=formTemplate.replace('onclick="delTemPhotoByday(1)"','onclick="delTemPhotoByday('+daycnt+')"');
		formTemplate=formTemplate.replace('onclick="clearmemo(1)"','onclick="clearmemo('+daycnt+')"');
		
		formTemplate=formTemplate.replace('id="photoUpForm1"','id="photoUpForm'+daycnt+'"');
		formTemplate=formTemplate.replace('id="photoupload1"','id="photoupload'+daycnt+'"');
		formTemplate=formTemplate.replace('id="savetempphoto1"','id="savetempphoto'+daycnt+'"');
		formTemplate=formTemplate.replace('id="clearMemo1"','id="clearMemo'+daycnt+'"');
		formTemplate=formTemplate.replace('id="Memo1"','id="Memo'+daycnt+'"');
		
		
		$('#mCSB_95:first').append(formTemplate);
		
		$("#day-box"+daycnt+" .title-box").attr(
				"id","photo-" + newyear + "-" + newmonth + "-"+ newday);
		
		$("#day"+daycnt+" span").html(
				newday + "/" + newmonth + "/" + newyear);
	

	})
	
	

	//날짜 변경- datepicker
	$("#datepicker").change(function() {


		$("#hiddenCalander").hide('slow');

		var date = $("#datepicker").val();

		var tempdate = parseDate(date);

		d = tempdate;
		year = tempdate.getFullYear();
		month = tempdate.getMonth() + 1;
		day = tempdate.getDate();

		$(".date-month").html(month);
		$(".date-year").html(year);

		$(".date-day a").attr(
				"href",
				"#photo-" + year + "-" + month
						+ "-" + day);
		$("#day-box .title-box").attr(
				"id",
				"photo-" + year + "-" + month + "-"
						+ day);
		$(".title-box #day1 span").html(
				day + "/" + month + "/" + year);
		var dateday = "<p><a class='moveScroll' href='#photo-"+year+"-"+month+"-"+day+"'>"
				+ day + "</a></p>"
		$(".date-day").html(dateday);
		
				
		for(var i=daycnt;i>1;i--){
			$("#newtemp"+i).remove();
			delTemPhotoByday(i);
		}		
				
				
		daycnt=1;
		
	

	})
	
	//저장
	$(".btn-save").click(function() {
		
		var title=$(".title .no-line-input").val()
		$.ajax({
				url:"savePanoTitle.do",
				data:{title:title},
				type:"post",
				dataType:"json",
				success: function(result) {
					cosole.log("제목저장-");
				}
				
			})
		
		
		for(var i=1;i<daycnt;i++){
		var memo=$("#newtemp"+i+" .no-line-input").val()
			$.ajax({
				url:"delTemPhotoByname.do",
				data:{memo:memo},
				type:"post",
				dataType:"json",
				success: function(result) {
					cosole.log("제목저장-");
				}
				
			})
		}
		
	})
	
	
	//데이 삭제
	$("#daydeletebutton").click(function() {
		if(daycnt>1){
			
		$('#mCSB_95 > :last').remove();
		$(".date-day > :last").remove();
		daycnt=1;
		d.setDate(d.getDate(d) - 1);
		}
		
	})
	
	
	
	 var upload = $("#photoupload")[0];
	   var holder = document.getElementById('photologImageArea');
	


	   upload.onchange = function(e) {
	      e.preventDefault();
	      savetempphoto(dd);
	      /* var file = upload.files[0], reader = new FileReader();
	      reader.onload = function(event) {
	         var img = new Image();
	         img.src = event.target.result;
	         // note: no onload required since we've got the dataurl...I think! :)
	         if (img.width > 300) { // holder width
	            img.width = 300;
	         }
	         //holder.innerHTML = '';
	         
	         holder.style.backgroundImage ="url('"+event.target.result+"')";
	         
	         //holder.appendChild(img);
	      };
	      reader.readAsDataURL(file);

	      return false; */
	   }
	      
	   function checkvalue() {
	      var upload = $("#photoupload")[0];
	      var imgex = ['bmp', 'jpg', 'gif', 'png', 'jpeg', 'BMP', 'JPG', 'GIF', 'PNG', 'JPEG'];

	      if(!upload.value) {
	         alert("이미지 파일을 업로드 해야합니다.")
	         return false;
	      }
	      
	      
	      var v = upload.value.split('\\');
	      var filename = v[v.length-1];
	      
	      v = filename.split('.');
	      var extension = v[v.length-1];
	      
	      var isImg = imgex.indexOf(extension);
	      if(isImg === -1) {
	         alert("이미지 파일만 업로드할 수 있습니다. ");
	         return false;
	      }
	      
	      return true;
	   }
	 
	
	

});
		</script>