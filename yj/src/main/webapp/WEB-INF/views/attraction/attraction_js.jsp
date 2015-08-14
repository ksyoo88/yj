<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp" %>

<script type="text/javascript" src="resources/js/mscroll/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap-slider.min.js"></script>
<script type="text/javascript">
// 사진 클릭되었는지 확인하는 변수 선언
var isClicked = false;
// areacode 지역코드
var areacode = undefined;

$(function() {
	
	jqScrollbar($(".step0 .theme-city-list"));
	
	$(".favorbar input").slider({
		reversed : true,
		formatter: function(value) {
			var result = "";
			if(value == 1) {
				result = "하";
			} else if(value == 2) {
				result = "중";
			} else if(value == 3) {
				result = "상";
			}
			return result;
		}
	});
	
	// 화면 열릴 때 step0 만 보여주기
	$(".step_area .step").hide().filter(":first").show();
	
	$(".city-box.hand").on("click", function() {
		var $selectedPlace = $(".city-img.on");
		
		// 같은 사진 선택되었는지 확인 후 on 제거
		if($selectedPlace.length) {
			var $selectedImg = $(this).find(".city-img.on");
			$selectedPlace.removeClass("on");
			if($selectedImg.length) {
				isClicked = false;
			} else {
				$(this).find(".city-img").addClass("on");
				isClicked = true;
			}
		} else {
			$(this).find(".city-img").addClass("on");
			isClicked = true;
		}
		if(isClicked) {
			$(".step_area .step0 .btn-next").removeClass("off").text("다음 >");
		} else {
			$(".step_area .step0 .btn-next").addClass("off").text("건너뛰기 >");
		}
	});
	
	// 다음, 이전 버튼 클릭 이벤트
	$(".btn-area .btn-prev").on("click", function() {
		var $step = $(this).parents(".step").prev();
		$step.show(1000).siblings().hide();
		
		// 상단 텍스트 css 반영
		stepChange($step);
		
	});
	$(".btn-area .btn-next").on("click", function() {
		var $step = $(this).parents(".step").next();
		$step.show(1000).siblings().hide();
		
		// 상단 텍스트 css 반영
		stepChange($step);
		
		// areacode 값 가져오기
		
		areacode = $(".city-img.on").parent().data("areacode");
		
		if(this.id == "getfavorplace") {
			getFavorPlace(areacode);
		}
	});
	
});

function stepChange($step) {
	var hasClass = $step.attr("class");
	hasClass = hasClass.replace("step ", ".");
	var $li = $(".tab_step " + hasClass);
	$li.addClass("on").siblings().removeClass("on");
	$li.find("span").addClass("select");
	$li.siblings().find("span").removeClass("select");
}

function jqScrollbar(src) {
	var amount=Math.max.apply(Math,src.find(":first-child").map(function(){return $(this).outerWidth(true);}).get());
	$(src).mCustomScrollbar({
		axis:"x",
		theme:"inset",
		advanced:{
			autoExpandHorizontalScroll:true
		},
		scrollButtons:{
			enable:true,
			scrollType:"stepped"
		},
		keyboard:{scrollType:"stepped"},
		snapAmount:amount,
		mouseWheel:{scrollAmount:amount}
	});
}

function getFavorPlace(areacode) {
	var paramdata = {areacode: areacode};
		paramdata.list = new Array();
	$(".favorbar input").each(function(index, element) {
		var favor = {};
		favor.name = element.name;
		favor.value = element.value;
		paramdata.list.push(favor);
	});
	$.ajax({
		type:"POST",
		url:"/favorplace.do",
		dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		data:JSON.stringify(paramdata),
		//data:{favor:JSON.stringify(paramdata)},
		contentType: 'application/json',
		mimeType: 'application/json',
		success : function(data) {
           	var html = "";
			$(data).each(function() {
				var imagePath = this.firstimage == null ? 'resources/images/common/noimage.gif' : this.firstimage;
				html += '<a href="plan.do?contentid='+this.contentid+'"><div class="city-box hand">';
				html += 	'<div class="city-img">';
				html += 		'<img title="'+this.title+'" alt="'+this.title+'" src="'+imagePath+'" style="width: 140px; height: 130px;">';
				html += 	'</div>';
				html += 	'<div class="city-name">';
				html += 		''+this.areaname+' '+this.sigunguname+' <br> <span title="'+this.title+'">'+this.title.trunc(10,false)+'</span>';
				html += 	'</div>';
				html += 	'<div class="category-name">';
				html += 		''+this.cat1name+'';
				html += 	'</div>';
				html += '</div></a>';
			});
			$(".step2 .theme-city-list").mCustomScrollbar("destroy");
			$(".step2 .theme-city-list").html(html);
			jqScrollbar($(".step2 .theme-city-list"));
         }
   });
}

String.prototype.trunc =
	function(n,useWordBoundary){
    	var toLong = this.length>n,
     		s_ = toLong ? this.substr(0,n-1) : this;
       		s_ = useWordBoundary && toLong ? s_.substr(0,s_.lastIndexOf(' ')) : s_;
       	return  toLong ? s_ + '&hellip;' : s_;
	};
</script>