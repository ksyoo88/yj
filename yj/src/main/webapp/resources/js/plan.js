/**
 *  	plan 일정 만들기 JavaScript
 */


$(function() {
	//$("#map-box")[0];
	var container = document.getElementById('map-box');
	var options = {
		center : new daum.maps.LatLng(37.567357, 126.994657),
		level : 3
	};

	var map = new daum.maps.Map(container, options);
	
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
		data:{minX:minX,maxX:maxX,minY:minY,maxY:maxY},
		dataType:"json",
		success : function(result) {
			
			console.log(result.areaPlaces);
			var places = result.areaPlaces;
			
			for(var i=0; i<places.length; i++){
				
				//console.log(places[i]);
				
				
				var imageSrc = 'resources/images/icon_hotel.png', // 마커이미지의 주소입니다    
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
					clickable : true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
				});
				
				markers.push(marker);
			
				//console.log(markers);
				setMarkers(map);	
				
				// 이해가 되지 않는다. 어렵다.
				$.each(markers, function() {
					daum.maps.event.addListener(this, 'click', function() {
						$("#contents-tab").attr("class","col-md-5");
						$("#place-tab").show(1000,function() {
							map.relayout();
						});
						
						$("#dateSelect").html("");
						for(var i=0; i<planArray.length; i++){
							$("#dateSelect").append("<option>"+planArray[i]+"</option>");
						}
					})
				});				
			}
			
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
			data:{minX:minX,maxX:maxX,minY:minY,maxY:maxY},
			dataType:"json",
			success : function(result) {
				
				console.log(result.areaPlaces);
				var places = result.areaPlaces;
				
				for(var i=0; i<places.length; i++){
					
					//console.log(places[i]);
					
					
					var imageSrc = 'resources/images/icon_hotel.png', // 마커이미지의 주소입니다    
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
						clickable : true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
					});
					
					markers.push(marker);
				
					//console.log(markers);
					setMarkers(map);	
					
					// 이해가 되지 않는다. 어렵다.
					$.each(markers, function() {
						daum.maps.event.addListener(this, 'click', function() {
							$("#contents-tab").attr("class","col-md-5");
							$("#place-tab").show(1000,function() {
								map.relayout();
							});
							
							$("#dateSelect").html("");
							for(var i=0; i<planArray.length; i++){
								$("#dateSelect").append("<option>"+planArray[i]+"</option>");
							}
						})
					});				
				}
				
			}
		});
		
	});
	
	
	
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다.
	var markers = new Array();	
	
	// 왼쪽탭에 일정 날짜들을 담습니다.
	var planArray = new Array(); 
	
	var days = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];
	
	var day = 1; 
	
	$("#placeToPlanAddBtn").click(function(){
		
		var index = document.getElementById("dateSelect").selectedIndex;
		console.log(index);
		var options = document.getElementById("dateSelect").options;
		console.log(options);
		index = index+1;
		
		console.log(index);
		$("#"+index+"dateStr").parent().append(
				"<div class='media'>"+
					"<div class='media-left'>"+
						"<a href='#'><img class='media-object img-rounded'src='resources/images/cat.jpg' alt='cat' width='50' height='50'></a>"+
					"</div>"+
					"<div class='media-body'>"+
						"<h5 class='media-heading'>신라호텔</h5>"+
						"<div class='btn-group btn-group-justified' role='group'>"+
							"<a href='#' class='btn btn-default btn-sm'>위치</a>"+
				 			"<a href='#' class='btn btn-danger btn-sm'>제거</a>"+
						"</div>"+
					"</div>"+
				"</div>"					
				);
		
	});
	
	$("#addplan").click(function() {
		if( $("#startDate").val() != "" ) {
			
			day++;				
			var startDate = $("#startDate").val();
			var nextDayDateFormat = parseAddDate(startDate,day);
			planArray.push(nextDayDateFormat);
			console.log(planArray);
			$("#left-tab-plan-contents").append(
				"<div class='col-md-12'><p><strong id='"+day+"dateStr'>"+ nextDayDateFormat +" DAY "+ day+"</strong></p></div>");	
			
		}else {
			alert("출발일을 설정해 주세요 ");
		}				
	});
	
	$("#retryplan").click(function() {
		$("#left-tab-plan-contents")
		.html("<div class='col-md-12'><p><strong id='1dateStr'>출발일을 입력해주세요</strong></p></div>")
		 $("#startDate").val("");
		day = 1;			
		planArray.length = 0;
	});
	
	// 캘린더 변경시 날짜 설정 
	$("#startDate").change(function() {
		
		var startDate = $("#startDate").val();				
		if( day > 1 ) {
			$("#left-tab-plan-contents").html("");
			$("#left-tab-plan-contents").append("<div class='col-md-12'><p><strong id='1dateStr'>"+ parseDate(startDate)+" DAY 1</strong></p></div>");
			planArray.length = 0;
			planArray.push(parseDate(startDate))
			for(var i=2; i<=day; i++) {
				$("#left-tab-plan-contents").append("<div class='col-md-12'><p><strong id='+i+dateStr'>"+ parseAddDate(startDate,i)+" DAY "+ i+"</strong></p></div>");
				planArray.push(parseAddDate(startDate,i));
			}
			console.log(planArray);
		}else {
			
			planArray.push(parseDate(startDate));
			console.log(planArray);
			$("#1dateStr").html( parseDate(startDate) +" DAY 1 ");	
			
		}
		
	});
	
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
		$("#place-tab").hide(2000);
		$("#contents-tab").attr("class","col-md-8");
		$("#contents-tab").hide();
		$("#contents-tab").show(2000,function() {
			map.relayout();
		});
		//map = null;
		//map = new daum.maps.Map(container, options);
		//setMarkers(map);
	});
	

	// 왼쪽 아이콘 눌렀을때 지도에 표시된다.
	$("#mapcategory li").click( function() {

			cleanMarker();
		
			var $cat = $(this).data("cat");
			console.log($cat, " : 눌렸습니다. ");
			
			// 캘린더 아이콘 
			if( $cat == "icon_calender"){
				console.log("calender");
				$("#left-tab-right").toggle(1000);
				//$("#left-tab-right").css("position","absolute","width","0px");
				//$("#left-tab").toggle(1000);
				//$("#left-tab-right").attr("class","col-md-2");				
				
			}
			else {
				
				for( var i=0; i<10; i++) {
					var imageSrc = 'resources/images/' + $cat + '.png', // 마커이미지의 주소입니다    
						imageSize = new daum.maps.Size(24, 24), // 마커이미지의 크기입니다
						imageOption = {
						offset : new daum.maps.Point(10, 35)
					}; 
					// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					// DB에서 가져와 막 찍으면된다.
					var markerImage = new daum.maps.MarkerImage(
							imageSrc, imageSize, imageOption), markerPosition = new daum.maps.LatLng(
							33.450701+i, 126.570667+i); // 마커가 표시될 위치입니다		
		
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						position : markerPosition,
						image : markerImage,
						clickable : true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
					});
					
					markers.push(marker);
				}
				console.log(markers);
				setMarkers(map);
				
				// 이해가 되지 않는다. 어렵다.
				$.each(markers, function() {
					daum.maps.event.addListener(this, 'click', function() {
						$("#contents-tab").attr("class","col-md-5");
						$("#place-tab").show(1000,function() {
							map.relayout();
						});
						
						$("#dateSelect").html("");
						for(var i=0; i<planArray.length; i++){
							$("#dateSelect").append("<option>"+planArray[i]+"</option>");
						}
					})
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
		console.log("showMarker()");
		setMarkers(map)
	}

	// 마커 지우기
	function cleanMarker() {
		console.log("cleanMarker()");
		if ( markers.length != 0 ){
			setMarkers(null);
			markers.length = 0;
		}
	}

});