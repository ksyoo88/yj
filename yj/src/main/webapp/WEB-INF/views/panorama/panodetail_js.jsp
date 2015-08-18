<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js/mscroll/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap-slider.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=64e5f8f5bfe12ab4deeb7911216e3f57"></script>
<script type="text/javascript" src="resources/js/lightbox.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
//리플 엔터
function replywrite() {
	$("#replywrite").click();
}
//리플삭제
function deletereply(replyno) {
	$.ajax({
		url:"deletereply.do",
		data:{replyno:replyno},
		type:"post",
		dataType:"json",
		success: function(result) {
			$("#replyNO"+replyno).remove();
			}
	})
}


$(function (){
	

	var container = document.getElementById('map-box'),
		options = {
			center : new daum.maps.LatLng(37.567357, 126.994657),
			level : 7
		};
	
	var map = new daum.maps.Map(container, options);
	
	var linePoint = new Array();
	 
	polyline = new daum.maps.Polyline({
		map : map,
		strokeWeight :4,
		strokeColor : '#CC0000',
		strokeOpacity: 1,
	    strokeStyle: 'solid',
	    endArrow : true 
	});
	
	var totalX = 0;
	var totalY = 0;
	var markerCount = 0;
	var totalDistance = 0;
	
	$(".mapX").each(function(index,item){
		
		if($(".mapX").eq(index).text()===""){
 		console.log( index+" 없음" );
			
			
		}else{
 		console.log( index+" 있음" );
			
		
// 		console.log( "mapX : ", $(".mapX").eq(index).text() );
// 		console.log( "mapY : ", $(".mapY").eq(index).text() );
// 		console.log( "cate : ", $(".cate").eq(index).text() );
		var photo=$(".photo-cont a").eq(index).attr("data-photo");
		
		console.log( $(".cate").eq(index).text() );
		
		var mapX = $(".mapX").eq(index).text(); 
		var mapY = $(".mapY").eq(index).text(); 
		var cate = $(".cate").eq(index).text();
		var image = $(".image").eq(index).text();
		var title = $(".pTitle").eq(index).text();
		var contentid = $(".contentid").eq(index).text();
		
		
		totalX = totalX + parseFloat(mapX);
		totalY = totalY + parseFloat(mapY);
		markerCount  += 1;
		console.log("totalX : ", totalX,"totalY : ", totalY, "markerCount : ", markerCount );

		

		
		var circle = new daum.maps.Circle({
		    map: map,
		    center : new daum.maps.LatLng( mapY, mapX ),
		    radius: 10,
		    strokeWeight: 2,
		    strokeColor: '#CC0000',
		    strokeOpacity: 1,
		    strokeStyle: 'solid',
		    fillColor: '#FFFFFF',
		    fillOpacity: 1
		});
		    var content = '<div hidden class="media" id="'+contentid+'" style="background-color:white;">' +
		    '                  <div class="media-left media-middle"> ' +
		    '                      <a href="#">' +
		    '                      <img class="media-object" src="'+image+'" alt="..." width=64 height=64 >' +
		    '                      </a>' +
		    '                  </div>' +
		    '                  <div class="media-body">' + 
		    '                      <br/><h4 class="media-heading">'+ title + '</h4>' +
		    '                  </div>' +
		    '              </div>' ;
		  

		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new daum.maps.LatLng(mapY, mapX);  

		// 커스텀 오버레이를 생성합니다
		var customOverlay = new daum.maps.CustomOverlay({
		    position: position,
		    content: content,
		    zIndex: 2,
		    yAnchor: 2
		});

		// 커스텀 오버레이를 지도에 표시합니다
		customOverlay.setMap(map);

		linePoint.push( new daum.maps.LatLng( mapY, mapX ) );
		
		}
		
	
		var photoSrc ='resources/images/temphoto/'+photo    // 마커이미지의 주소입니다    
		var imageSrc = 'resources/images/icon_'+cate+'.png', // 마커이미지의 주소입니다    
			imageSize = new daum.maps.Size(38, 38), // 마커이미지의 크기입니다
			imageOption = {	offset : new daum.maps.Point(10, 35) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		// DB에서 가져와 막 찍으면된다.
		var markerImage = new daum.maps.MarkerImage(photoSrc, imageSize, imageOption),
		    markerPosition = new daum.maps.LatLng(mapY, mapX); // 마커가 표시될 위치입니다		
		
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition,
			image : markerImage,		
			zIndex: 1,
			clickable : true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
		});
		    
		marker.setMap(map); 
		daum.maps.event.addListener(marker, 'mouseover', function() {
			
		     $("#"+contentid).show();
		});
		
		daum.maps.event.addListener(marker, 'mouseout', function() {
			 $("#"+contentid).hide();
		});
		polyline.setPath(linePoint);
		totalDistance = polyline.getLength()/1000;
	})
	
		console.log("중심좌표 : ",totalY/markerCount,", ",totalX/markerCount)
		map.setCenter(new daum.maps.LatLng( totalY/markerCount, totalX/markerCount) );
		
		if(totalDistance > 2.5 && totalDistance < 4.99){
			map.setLevel(5);
		}else if( totalDistance > 5 && totalDistance < 9.99) {
			map.setLevel(6);	
		}else if( totalDistance > 10 &&  totalDistance < 19.99) {
			map.setLevel(7);
		} else if (totalDistance > 20 && totalDistance < 39.99) {
			map.setLevel(8);
		} else if (totalDistance > 40 && totalDistance < 79.99) {
			map.setLevel(9);
		} else if (totalDistance > 80 && totalDistance < 159.99) {
			map.setLevel(10);
		} else if (totalDistance > 160 && totalDistance < 319.99) {
			map.setLevel(11);
		} else if (totalDistance > 320 && totalDistance < 639.99) {
			map.setLevel(12);
		} else if (totalDistance > 640) {
			map.setLevel(13);
		} else {
			map.setLevel(4);
		}
			

	
	//라이트박스 실행
	lightbox.init();
	//좋아요
	$("#LikeBtn").click(function() {
		var likecheck=$("#photologLikeButton").attr("likecheck");
		var likeCheck;
		if(likecheck=='likebefore'){
			$("#photologLikeButton").attr("src","resources/images/panorama/likeafter.png");
			$("#photologLikeButton").attr("likecheck","likeafter");
			likeCheck=true;
		}else{
			$("#photologLikeButton").attr("src","resources/images/panorama/likebefore.png");
			$("#photologLikeButton").attr("likecheck","likebefore");
			likeCheck=false;
		}
		var panono=$(".title").data("panoNo");
		$.ajax({
			url:"panolike.do",
			data:{likecheck:likeCheck,panono:panono},
			type:"post",
			dataType:"json",
			success: function(result) {
				var panolikecnt=result.panolikecnt;
				
				$(".btn-act .count").html(panolikecnt);
			}
		})
	})
	
	//리플쓰기
	$("#replywrite").click(function() {
		var reply =$("#replyinput").val();
		var panono=$(".title").data("panoNo");
		var replyadd='';
		$.ajax({
			url:"panoreply.do",
			data:{reply:reply,panono:panono},
			type:"post",
			dataType:"json",
			success: function(result) {
				var replys=result.replys;
				
				
				for(var i=0;i<replys.length;i++){
					var d = new Date(replys[i].date);
					
					var month = d.getMonth() + 1;
					var year = d.getFullYear();
					var day = d.getDate();
					replyadd+='<tr id="replyNO'+replys[i].panoReplyNo+'"><td>	<div class="user"><div class="profile user-photo"><div class="memberProfileImage profileImageMedium" style="position: relative; "><img src="resources/images/profilephoto/'+replys[i].member.photo+'" class="img-circle" width="45px" height="45px"style="margin-top: 3px;"></div></div></div></td>'
					replyadd+='<td><div class="userName t-name" >'+replys[i].member.name+'</div></td>';
					replyadd+='<td>	<div><c:out value="'+replys[i].reply+'"></c:out></div></td>';
					replyadd+='<td><div>'+year+'/'+month+'/'+day+'</div></td>';
					if(replys[i].member.no=='${member.no}'){
					replyadd+='<td><c:if test="${replys.member.no == member.no }"><button type="button" onclick="deletereply('+replys[i].panoReplyNo+')" data-reply-no="'+replys[i].panoReplyNo+'" class="btn btn-danger">삭제</button>  </c:if></td></tr>';
					}
			
				}
				$("#replyinput").val("");
			$("#panoReplyShow tbody").html(replyadd);
			
			}
		})
	})	
	
 
	
	//삭제 버튼
	$(".btn-delete").click(function() {
		 $( "#dialog" ).dialog( "open" );
	})
		 $( "#dialog" ).dialog({
			 autoOpen: false,
		      resizable: false,
		      height:200,
		      modal: true,
		      buttons: {
		        "삭제": function() {
		        var panono=$(".title").data("panoNo");
		         	$.ajax({
		         		url:"deletePanorama.do",
		         		data:{panoNo:panono},
		    			type:"post",
		    			dataType:"json",
		    			success: function(result) {
		    				
		    				location.href='/mypage.do';
		    			}
		         	})
		        	
		        },
		        "취소": function() {
		          $( this ).dialog( "close" );
		        }
		      }
		    }); 
		 
	//수정 버튼
	$(".btn-modify").click(function() {
		 $( "#dialogmodify" ).dialog( "open" );
	})
		 $( "#dialogmodify" ).dialog({
			 autoOpen: false,
		      resizable: false,
		      height:200,
		      modal: true,
		      buttons: {
		        "수정": function() {
		        var panono=$(".title").data("panoNo");
		    	location.href='/modifyPano.do?panoNo='+panono;
		    	
		        },
		        "취소": function() {
		          $( this ).dialog( "close" );
		        }
		      }
		    }); 
	
	
});
</script>
