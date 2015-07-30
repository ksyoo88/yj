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
function photoupload() {
	$("#photoupload").click();
}

function myauto() {
      $("#autosubmit").click();
   }
function chooseFile() {
      $("#fileInput").click();
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


$(function() {
	
	 var upload = $("#photoupload")[0];
	   var holder = document.getElementById('photologImageArea');

	   upload.onchange = function(e) {
	      e.preventDefault();

	      var file = upload.files[0], reader = new FileReader();
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

	      return false;
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
    