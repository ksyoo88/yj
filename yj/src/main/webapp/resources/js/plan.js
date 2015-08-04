/**
 *  	plan 일정 만들기 JavaScript
 */
function drag(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
	console.log(ev.target.id);
}

function allowDrop(ev) {
    ev.preventDefault();
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    console.log(ev.target.id);
    $("#"+ev.target.id).append(document.getElementById(data));
    //ev.target.appendChild( document.getElementById(data) );
}
	

$(function() {
	
	$("#place-tab").hide();
	var container = document.getElementById('map-box');
	var options = {
		center : new daum.maps.LatLng(37.567357, 126.994657),
		level : 3
	};

	var map = new daum.maps.Map(container, options);
	
	// category
	var $cat;	
	
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다.
	var markers = new Array();	
	
	// customOverlay Arrays
	var customArrays = new Array();
	
	// 왼쪽탭에 일정 날짜들을 담습니다.
	var planArray = new Array(); 
		
	//var placeArray = new Array();
	var placeIdNum = 0;
	
	var days = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];
	
	var day = 1; 
	
	
	// 현재 지도 영역을 얻어옵니다.
	var bounds = map.getBounds();
	var southWestLatLng = bounds.getSouthWest();
	var northEastLatLng = bounds.getNorthEast();
	
	var minY = southWestLatLng.getLat();
	var maxY = northEastLatLng.getLat();	
	var minX = southWestLatLng.getLng();
	var maxX = northEastLatLng.getLng();
	console.log("min X : " + minX + " max X : " + maxX );
	console.log("min Y : " + minY + " max Y : " + maxY );
	
	$.ajax({
		url:"mapSetting.do",
		type:"post",
		data:{minX:minX,maxX:maxX,minY:minY,maxY:maxY,cate:$cat},
		dataType:"json",
		success : function(result) {

			createMarker(result);
			
		}
	});
	
	daum.maps.event.addListener(map, 'dragend', function() {
		
		cleanMarker();
		
		// 현재 지도 영역을 얻어옵니다.
		var bounds = map.getBounds();
		var southWestLatLng = bounds.getSouthWest();
		var northEastLatLng = bounds.getNorthEast();
		
		var minY = southWestLatLng.getLat();
		var maxY = northEastLatLng.getLat();	
		var minX = southWestLatLng.getLng();
		var maxX = northEastLatLng.getLng();
		console.log("min X : " + minX + " max X : " + maxX );
		console.log("min Y : " + minY + " max Y : " + maxY );
		
		$.ajax({
			url:"mapSetting.do",
			type:"post",
			data:{minX:minX,maxX:maxX,minY:minY,maxY:maxY,cate:$cat},
			dataType:"json",
			success : function(result) {
	
				cleanOverlayCustom();
				createMarker(result);
				
			}
		});
		
	});
	

	function createMarker(result) {
	
		//console.log(result.areaPlaces);
		var places = result.areaPlaces;
		
		for(var i=0; i<places.length; i++){
			
			//console.log(places[i].title);
			
			var imageName;
			
			if(places[i].cat1 == "A01") { 
				// 자연
				imageName = "icon_nature"; 
			} else if (places[i].cat1 == "A02") {
				// 인문 문화 예술 역사
				imageName = "icon_culture";
			} else if (places[i].cat1 == "A03") {
				// 레포츠
				imageName = "icon_leports";
			} else if (places[i].cat1 == "A04") {
				// 쇼핑
				imageName = "icon_shopping";
			} else if (places[i].cat1 == "A05") {
				// 음식
				imageName = "icon_food";
			} else if (places[i].cat1 == "B02") {
				// 숙박
				imageName = "icon_hotel";
			} else {
				imageName = "icon_mapAll";
			}
			
			
			var imageSrc = 'resources/images/'+imageName+'.png', // 마커이미지의 주소입니다    
							imageSize = new daum.maps.Size(24, 24), // 마커이미지의 크기입니다
							imageOption = {	offset : new daum.maps.Point(10, 35) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			// DB에서 가져와 막 찍으면된다.
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
							  markerPosition = new daum.maps.LatLng(places[i].mapy, places[i].mapx); // 마커가 표시될 위치입니다		

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position : markerPosition,
				image : markerImage,		
				zIndex: 1,
				clickable : true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
				//place : places[i]
			});
			
			markers.push(marker);
		
			//console.log(markers);
			setMarkers(map);
			
			// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var content = '<div class="customoverlay">' +
						  '  <div class="panel panel-info">' +
						  '    <a class="btn btn-default btn-xs" href="#" role="button">'+places[i].title+'</a>' +
						  '    <p hidden id="place-addr">'+places[i].addr1+'</p>' +
						  '    <p hidden id="place-image">'+places[i].firstimage+'</p>' +
						  '    <p hidden id="place-overview">'+places[i].overview+'</p>' +
						  '    <p hidden id="place-tel">'+places[i].tel+'</p>' +
						  '    <p hidden id="place-mapx">'+places[i].mapx+'</p>' +
						  '    <p hidden id="place-mapy">'+places[i].mapy+'</p>' +
						  '  </div>' +
						  '</div>';
			
			var position = new daum.maps.LatLng(places[i].mapy, places[i].mapx);
			
			var customOverlay = new daum.maps.CustomOverlay({
				map : map,
				position : position,
				content : content,
				yAnchor : 1				
			});
			customArrays.push(customOverlay);
//			console.log(" custom Overlay Arrays : " + customArrays);
			
			
			
		}
		
		$(".customoverlay .panel").click(function() {
			
			var title = $(this).find(".btn").text();
			var addr = $(this).find("#place-addr").text();
			var image = $(this).find("#place-image").text();
			var overview = $(this).find("#place-overview").text();
			var tel = $(this).find("#place-tel").text();
			var mapx = $(this).find("#place-mapx").text();
			var mapy = $(this).find("#place-mapy").text();
			
			$("#contents-tab").attr("class","col-md-5");
			$("#place-tab").show(500,function() {
				map.relayout();
				$("#place-tab strong").html( title );
				$("#place-tab img").attr("src",image);
				$("#place-tab #overview").html( overview);
				$("#place-tab #addr").html( addr );
				$("#place-tab small").html( " Tel ( " + tel + " ) ");
				$("#place-tab #mapx").html(mapx);
				$("#place-tab #mapy").html(mapy);
				
			});
			
			dateInit();
			
		});	
	}
	
	// 여기아니면
	$("#placeToPlanAddBtn").click(function(){
		
		var currentTitle = $("#place-tab strong").text();
		var currentImage = $("#place-tab img").attr("src");
		var mapx = $("#place-tab #mapx").text();
		var mapy = $("#place-tab #mapy").text();
		
		
		console.log("Selected Place mapX : " + mapx + " mapY : " + mapy);
		console.log("title : " + currentTitle + " , image : " + currentImage );
		
		var index = document.getElementById("dateSelect").selectedIndex;
		console.log("index : " + index);
		var options = document.getElementById("dateSelect").options;
		console.log("options : " + options);
		index = index+1;
		
		//placeArray.push(currentTitle);
		placeIdNum++;
		
		//console.log(placeArray);
		
		console.log("index + 1 : " + index);
		$("#"+index+"dateStr").append(
				"<div class='media' draggable='true' ondragstart='drag(event)' id='placeId"+placeIdNum+"' >"+
					"<div class='media-left'>"+
						"<a href='#'><img class='media-object img-rounded'src='"+currentImage+"' alt='사진이 없어여~' width='50' height='50'></a>"+
					"</div>"+
					"<div class='media-body'>"+
						"<h5 class='media-heading'>"+currentTitle+"</h5>"+
						"<div class='btn-group btn-group-justified' role='group'>"+
							"<a href='#' class='btn btn-default btn-sm'>위치</a>"+
				 			"<a href='#' class='btn btn-danger btn-sm'>제거</a>" +
				 			"<p hidden class='position'>"+ mapx +"</p>"+
				 			"<p hidden class='position'>"+ mapy +"</p>"+
						"</div>"+
					"</div>"+
				"</div>"					
		);
		
		$("#left-tab-plan-contents .btn-default").click(function() {
			console.log("setCenter");
			var positionX = $(this).parent().find("p:hidden").eq(0).text();
			var positionY = $(this).parent().find("p:hidden").eq(1).text();
			
			console.log(positionX + ",  "+ positionY);
			map.setCenter(new daum.maps.LatLng(positionY, positionX));		
		});
		
		for ( var i=1; i<=planArray.length; i++){
			if( !$("#"+i+"dateStr .media").next().html() ){
				//console($(this).find("p:hidden").eq(0).text());
				//console( $("#"+i+"dateStr .media .media-heading").text() );
				console.log( $("#"+i+"dateStr .media").next().html() );
			}
		}
		
	});
	
	

	
	
	$("#addplan").click(function() {
		if( $("#startDate").val() != "" ) {
			
			day++;				
			var startDate = $("#startDate").val();
			var nextDayDateFormat = parseAddDate(startDate,day);
			planArray.push(nextDayDateFormat);
			dateInit();
			console.log(planArray);
			$("#left-tab-plan-contents").append(
				"<div class='col-md-12'>" +
				"<p><strong id='"+day+"dateStr' ondrop='drop(event)' ondragover='allowDrop(event)'>"+ nextDayDateFormat +" DAY "+ day+"</strong></p></div>");	
			
		}else {
			alert("출발일을 설정해 주세요 ");
		}				
	});
	
	
	$("#retryplan").click(function() {
		$("#left-tab-plan-contents")
		.html("<div class='col-md-12'><p><strong id='1dateStr' ondrop='drop(event)' ondragover='allowDrop(event)'>출발일을 입력해주세요</strong></p></div>")
		 $("#startDate").val("");
		day = 1;			
		planArray.length = 0;
		dateInit();
	});
	
	
	// 캘린더 변경시 날짜 설정 
	$("#startDate").change(function() {
		
		var startDate = $("#startDate").val();				
		if( day > 1 ) {
			$("#left-tab-plan-contents").html("");
			$("#left-tab-plan-contents").append("<div class='col-md-12'><p><strong id='1dateStr' ondrop='drop(event)' ondragover='allowDrop(event)>'" +
												 parseDate(startDate)+" DAY 1</strong></p></div>");
			planArray.length = 0;
			planArray.push(parseDate(startDate))
			for(var i=2; i<=day; i++) {
				$("#left-tab-plan-contents").append("<div class='col-md-12'><p><strong id='"+i+"dateStr' ondrop='drop(event)' ondragover='allowDrop(event)>'" +
													 parseAddDate(startDate,i)+" DAY "+ i+"</strong></p></div>");
				planArray.push(parseAddDate(startDate,i));
			}
			console.log(planArray);
		}else {
			
			planArray.push(parseDate(startDate));
			console.log(planArray);
			$("#1dateStr").html( parseDate(startDate) +" DAY 1 ");	
						
		}
		dateInit();
		
	});
	
	
	function dateInit() {
		$("#dateSelect").html("");
		for(var i=0; i<planArray.length; i++){
			$("#dateSelect").append("<option>"+planArray[i]+"</option>");
		}		
	}
	
	
	function parseDate(s) {
		var b = s.split(/\D/);
		var tempDate = new Date(b[0], --b[1], b[2]);
		var year = tempDate.getFullYear();
		var month = tempDate.getMonth()+1;
		var date = tempDate.getDate();
	    return year+"년 "+month+"월 "+date+"일 " + days[tempDate.getDay()] ;
	}
	
	function parseAddDate(s,day) {
		var b = s.split(/\D/);
		var tempDate = new Date(b[0], --b[1], b[2]);
		tempDate.setDate(tempDate.getDate()+(day-1) );
		var year = tempDate.getFullYear();
		var month = tempDate.getMonth()+1;
		var date = tempDate.getDate();
	    return year+"년 "+month+"월 "+date+"일 " + days[tempDate.getDay()] ;
	}
	
	$("#closePlaceBtn").click(function(){
		$("#place-tab").hide(500);
		$("#contents-tab").attr("class","col-md-8");
		$("#contents-tab").hide();
		$("#contents-tab").show(500,function() {
			map.relayout();
		});
		//map = null;
		//map = new daum.maps.Map(container, options);
		//setMarkers(map);
	});
	

	// 왼쪽 아이콘 눌렀을때 지도에 표시된다.
	$("#mapcategory li").click( function() {
			
		cleanOverlayCustom();
		cleanMarker();
	
		$cat = $(this).data("cat");
		//console.log($cat, " : 눌렸습니다. ");
		
		// 캘린더 아이콘 
		if( $cat == "icon_calender"){
			console.log("calender");
			$("#left-tab-right").toggle(1000);
		
		}
		else {
			
			// 현재 지도 영역을 얻어옵니다.
			var bounds = map.getBounds();
			var southWestLatLng = bounds.getSouthWest();
			var northEastLatLng = bounds.getNorthEast();
			
			var minY = southWestLatLng.getLat();
			var maxY = northEastLatLng.getLat();	
			var minX = southWestLatLng.getLng();
			var maxX = northEastLatLng.getLng();
			console.log("min X : " + minX + " max X : " + maxX );
			console.log("min Y : " + minY + " max Y : " + maxY );
			
			$.ajax({
				url:"mapSetting.do",
				type:"post",
				data:{minX:minX,maxX:maxX,minY:minY,maxY:maxY,cate:$cat},
				dataType:"json",
				success : function(result) {
					
					createMarker(result);					
				}
			});
							
		}			
	});
	
	
	//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다.
	function setMarkers(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
			//console.log(map);
		}
	}
	// 마커를 보여줍니다.
	function showMarkers() {
		//console.log("showMarker()");
		setMarkers(map)
	}

	// 마커 지우기
	function cleanMarker() {
		console.log("-------------cleanMarker()-------------");
		if ( markers.length != 0 ){
			setMarkers(null);
			markers.length = 0;
		}
	}
	
	// 오버레이 커스텀 지우기.
	function cleanOverlayCustom() {
		console.log("-------------cleanOverlayCustom()-------------");
		for(var i=0; i<customArrays.length; i++){
			//console.log("setMap null : " + i)
			customArrays[i].setMap(null);
		}
	}
	
	
	

});