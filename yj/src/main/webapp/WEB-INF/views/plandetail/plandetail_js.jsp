<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=64e5f8f5bfe12ab4deeb7911216e3f57"></script>
<script type="text/javascript">

$(function() {
	

	var container = document.getElementById('map-box'),
		options = {
			center : new daum.maps.LatLng(37.567357, 126.994657),
			level : 3
		};
	
	var map = new daum.maps.Map(container, options);
	
	console.log( "${plan.title}" );
	
	var linePoint = new Array();
	 
	polyline = new daum.maps.Polyline({
		map : map,
		strokeWeight :2,
		strokeColor : '#CC0000',
		strokeOpacity: 1,
	    strokeStyle: 'solid'
	});
	
	$(".mapX").each(function(index,item){
		
		console.log( "mapX : ", $(".mapX").eq(index).text() );
		console.log( "mapY : ", $(".mapY").eq(index).text() );
		console.log( "cate : ", $(".cate").eq(index).text() );
		
		var mapX = $(".mapX").eq(index).text(); 
		var mapY = $(".mapY").eq(index).text(); 
		var cate = $(".cate").eq(index).text()
		
		var circle = new daum.maps.Circle({
		    map: map,
		    center : new daum.maps.LatLng( mapY, mapX ),
		    radius: 3,
		    strokeWeight: 2,
		    strokeColor: '#CC0000',
		    strokeOpacity: 1,
		    strokeStyle: 'solid',
		    fillColor: '#CC0000',
		    fillOpacity: 1 
		});
		
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
		
		
		linePoint.push( new daum.maps.LatLng( mapY, mapX ) );
		
		
		
	});
	
	polyline.setPath(linePoint);
	
	
	
	
	
});

function circleDraw(mapY, mapX) {
	
	
	
}

</script>