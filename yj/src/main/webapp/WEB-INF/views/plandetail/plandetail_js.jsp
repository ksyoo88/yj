<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=64e5f8f5bfe12ab4deeb7911216e3f57"></script>
<script type="text/javascript">

$(function() {
	

	var container = document.getElementById('map-box'),
		options = {
			center : new daum.maps.LatLng(37.567357, 126.994657),
			level : 3
		};
	
	var map = new daum.maps.Map(container, options);
	
	var linePoint = new Array();
	 
	polyline = new daum.maps.Polyline({
		map : map,
		strokeWeight :2,
		strokeColor : '#CC0000',
		strokeOpacity: 1,
	    strokeStyle: 'solid',
	    endArrow : true 
	});
	
	$(".mapX").each(function(index,item){
		
// 		console.log( "mapX : ", $(".mapX").eq(index).text() );
// 		console.log( "mapY : ", $(".mapY").eq(index).text() );
// 		console.log( "cate : ", $(".cate").eq(index).text() );
		
		var mapX = $(".mapX").eq(index).text(); 
		var mapY = $(".mapY").eq(index).text(); 
		var cate = $(".cate").eq(index).text();
		var image = $(".image").eq(index).text();
		var title = $(".pTitle").eq(index).text();
		var tel = $(".tel").eq(index).text();
		var overview = $(".overview").eq(index).text();
		var contentid = $(".contentid").eq(index).text();
		var addr = $(".addr").eq(index).text();
		
		var circle = new daum.maps.Circle({
		    map: map,
		    center : new daum.maps.LatLng( mapY, mapX ),
		    radius: 5,
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
		       
		    
		
		var imageSrc = 'resources/images/icon_'+cate+'.png', // 마커이미지의 주소입니다    
			imageSize = new daum.maps.Size(24, 24), // 마커이미지의 크기입니다
			imageOption = {	offset : new daum.maps.Point(10, 35) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		// DB에서 가져와 막 찍으면된다.
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
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
		
		daum.maps.event.addListener(marker, 'click', function() {
			
			
			
		  	console.log("title",title);
		  	console.log("overview",overview);
		  	console.log("image",image);
		  	console.log("addr",addr);
		  	console.log("tel",tel);
		  	console.log("cate",cate);
		  	$("#place-tab-image img").attr("src",image);		  			  	
			$("#place-tab-title").text(title);
			$("#place-tab-title").append(" <img src='resources/images/icon_"+cate+".png' />" );
			
			var subStrOverView = overview.substring(0,300);
			
			if( overview.length > 300 ){
			  	$("#place-tab-overview").text(subStrOverView + "...");				
				$("#place-tab-overview").append("<a href='#'>더보기</a>");
			} else {
			  	$("#place-tab-overview").text(overview);				
			}
			
			$("#place-tab-overview a").click(function(){
				$("#place-tab-overview").text(overview).hide().slideDown(500);
			});
			
		  	$("#place-tab-addr strong").text(addr);
		  	$("#place-tab-tel strong").text(tel);
		  	
		  	$("#place-tab").show(500);
		  	$("#contents-tab").attr("class","col-md-6").show(500);
		  	
		  	
		});
		
		linePoint.push( new daum.maps.LatLng( mapY, mapX ) );
		console.log( title );
		var distance = polyline.getLength(); 
		polyline.setPath(linePoint);
		
		distance = polyline.getLength() - distance;
		distance = distance/1000;
		
		if(distance != 0){
			$(".distance small").eq(index-1).html("<span class='label label-danger'>"+distance.toFixed(2)+"km</span>");
		}
		
		console.log( polyline.getLength() - distance );
		var totalDistance = polyline.getLength()/1000;
		$(".distance:last").html( "<span class='label label-success'>총거리 " +totalDistance.toFixed(2)+"km </span>" );
		
	});
	

	
	
	
});

</script>