<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=64e5f8f5bfe12ab4deeb7911216e3f57"></script>
<script type="text/javascript" src="resources/js/bsDatePicker/bootstrap-datetimepicker.min.js" ></script>
<script type="text/javascript" src="resources/js/bsDatePicker/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<script type="text/javascript">
	
/**
 *  	plan 일정 만들기 JavaScript
 */

 $(function() {
	
	var height = $(window).height()-84;
	$("#map-box").css("height", height );
	$("#left-tab").css("height",height);
	$("#left-tab-left").css("height",height);
	$("#right-tab").css("height",height);
	$("#place-tab").css("height",height);
	
	$(window).resize(function(){
		
		var height = $(window).height()-84;
		$("#map-box").css("height", height );
		$("#left-tab").css("height",height);
		$("#left-tab-left").css("height",height);
		$("#right-tab").css("height",height);
		$("#place-tab").css("height",height);
		
	});
	
	
	var placeObj = {};
	
	
	$("#right-tab-header .nav-tabs img").click(function(){
		
		var top = $(this).data("top");
		$(this).css("text-shadow","2px 2px black")

		$.ajax({
			url:"rightPlace.do",
			type:"post",
			data:{top:top},
			dataType:"json",
			success : function(result) {

				var place = result.topPlace;
				var tempHtml ="";
				
				for(var i=0; i<place.length; i++){
					console.log("top plAce : ",place[i].title );
					tempHtml += "<button type='button' class='list-group-item' data-mapx='"+place[i].mapx +"' data-mapy='"+place[i].mapy+"' >"+(i+1)+". "+place[i].title+"</button>";
				}
				$("#topPlace").hide().show(500);
				$("#topPlace").html(tempHtml);
				
				$("#topPlace button").click(function(){
					var mapX = $(this).data("mapx");
					var mapY = $(this).data("mapy");
					
					map.panTo(new daum.maps.LatLng(mapY, mapX));
					map.setLevel(3);
					mapSetting();
					
				})
				
			}
		})
	});
	
	
	$("#topPlace button").click(function(){
		var mapX = $(this).data("mapx");
		var mapY = $(this).data("mapy");
		
		map.panTo(new daum.maps.LatLng(mapY, mapX));
		map.setLevel(3);
		mapSetting();
		
	})
	

	
	$("#saveBtn").click(function(){
		
		var startDate = $("#startDate").val();
		
		if ( startDate ) {
			$(this).attr("data-target","#saveModal");
			
			var html="";
			
			$("#insertPlan").html("");
			
			html += '<input hidden type="text" name="trevelCnt" value="'+day+'"/>';

			
			$("#startDay").val(planArray[0]); 
			$("#finishDay").val(planArray[planArray.length-1]); 
			
			$("div#left-tab-plan-contents .panel-group").each(function(index, item){
				
				
				$(item).find(".media").each( function(i,pos) {
				
					var contentid = $(pos).find("span").eq(0).text();
					
					console.log(planArray[index], ", ", contentid);
					
					html += '<input hidden type="text" name="day" value="'+planArray[index]+'"/>';
					html += '<input hidden type="text" name="place" value="'+contentid+'"/>';
					
				});	
			});
			console.log(html);
			$("#insertPlan").append(html);
			
		}			
	});
	
	

	
	$(".form_datetime").datetimepicker({
		format: "yyyy-mm-dd",
		autoclose: true,
		todayBtn: true,
		minView : 'month',
		language : 'ko'
	});
	
	
	$("#place-tab").hide();
	
	
	var container = document.getElementById('map-box');
	var options = {
		center : new daum.maps.LatLng(37.567357, 126.994657),
		level : 3 
	};

	map = new daum.maps.Map(container, options);
	

	
	
	if( '${place}' != "" )  {
		placeObj.title = '${place.title}';
		placeObj.contentid = '${place.contentid}';
		placeObj.mapX = '${place.mapx}';
		placeObj.mapY = '${place.mapy}';
		placeObj.firstimage = '${place.firstimage}';
		placeObj.addr = '${place.addr1}';
		placeObj.tel = '${place.tel}';
		placeObj.overview ='${place.overview}';
		console.log(placeObj.title, ", ",placeObj.mapX, ", ", placeObj.mapY,", "
				   ,placeObj.firstimage, ", ", placeObj.tel,", " , placeObj.overview);
		
		
		$("#contents-tab").attr("class","col-md-6");
		
		$("#place-tab").show(500,function() {
			
			
			map.relayout();
			$("#place-tab strong").html( placeObj.title );
			$("#place-tab img").attr("src", placeObj.firstimage );
			$("#place-tab #overview").html( placeObj.overview );
			$("#place-tab #addr").html( placeObj.addr );
			$("#place-tab small").html( " ( "+placeObj.tel + " ) ");
			$("#place-tab #mapx").html(placeObj.mapX);
			$("#place-tab #mapy").html(placeObj.mapY);
			$("#place-tab #contentid").html(placeObj.contentid);
			
			
		});
		
		map.setCenter(new daum.maps.LatLng(placeObj.mapY,placeObj.mapX));
	}
	
	
	// category
	var $cat;	
	
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다.
	var markers = new Array();	
	
	// customOverlay Arrays
	var customArrays = new Array();
	
	// 왼쪽탭에 일정 날짜들을 담습니다.
	var planArray = new Array(); 
	
	// 선 배열
	var polyline;
	
	// 원 배열
	var circleArray = new Array();
		
	// Day 마커 배열 
	var dayMarkerArray = new Array(); 
	
	//var placeArray = new Array();
	var placeIdNum = 0;
	
	var days = ["(일)","(월)","(화)","(수)","(목)","(금)","(토)"];
	
	var day = 1; 
	
	
	// 현재 지도 영역을 얻어옵니다.
	function mapSetting() {
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
	
				if( map.getLevel() < 6 ){
					createMarker(result);					
				}
				
			}
		});
	}
	
	mapSetting();
	
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
				if( map.getLevel() < 6 ){
					createMarker(result);					
				}
				
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
			} else{
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
						  '    <p hidden id="place-contentid">'+places[i].contentid+'</p>' +
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
			
		}
		
		$(".customoverlay .panel").click(function() {
			
			var title = $(this).find(".btn").text();
			var addr = $(this).find("#place-addr").text();
			var image = $(this).find("#place-image").text();
			var overview = $(this).find("#place-overview").text();
			var tel = $(this).find("#place-tel").text();
			var mapx = $(this).find("#place-mapx").text();
			var mapy = $(this).find("#place-mapy").text();
			var contentid = $(this).find("#place-contentid").text();
			
			var subStrOverView = overview.substring(0,300);
			
			if( overview.length > 300 ){
			  	$("#place-tab #overview").text(subStrOverView + "...");				
				$("#place-tab #overview").append("<a href='#'>더보기</a>");
			} else {
			  	$("#place-tab #overview").text(overview);				
			}
			
			$("#place-tab #overview a").click(function(){
				$("#place-tab #overview").text(overview).hide().slideDown(500);
			});
			
			$("#contents-tab").attr("class","col-md-6");
			$("#place-tab").show(500,function() {
				map.relayout();
				$("#place-tab strong").html( title );
				$("#place-tab img").attr("src",image);
				//$("#place-tab #overview").html( overview);
				$("#place-tab #addr").html( addr );
				$("#place-tab small").html( " ( " + tel + " ) ");
				$("#place-tab #mapx").html(mapx);
				$("#place-tab #mapy").html(mapy);
				$("#place-tab #contentid").html(contentid);
				
			});
			
			dateInit();			
		});	
		
		
		
	}
	
	
	$("#addBookmark").click(function(){
		var contentid = $("#place-tab #contentid").text();
		var memberNo = ${member.no};
		console.log(memberNo,", ",contentid);
		
		$.ajax({
			url:"insertBookmark.do",
			type:"post",
			data:{contentid:contentid },
			dataType:"json",
			success : function(result) {
				
				alert("북마크가 추가되었습니다.");
				// 북마크가 추가되었습니다				
			}
		});
	});
	
	// 여기아니면
	$("#placeToPlanAddBtn").click(function(){
		
		var currentTitle = $("#place-tab strong").text();
		var currentImage = $("#place-tab img").attr("src");
		var mapx = $("#place-tab #mapx").text();
		var mapy = $("#place-tab #mapy").text();
		var contentid = $("#place-tab #contentid").text();
		
		
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
				"<div class='panel-body ui-state-default'>" +
					"<div class='media' id='placeId"+placeIdNum+"' >"+
						"<div class='media-left'>"+
							"<a href='#'><img class='media-object img-rounded'src='"+currentImage+"' alt='no photo' width='50' height='50'></a>"+
						"</div>"+
						"<div class='media-body'>"+
							"<h5 class='media-heading'>"+currentTitle+"</h5>"+
							"<div class='btn-group btn-group-justified' role='group'>"+
								"<a href='#' class='btn btn-default btn-sm'>위치</a>"+
					 			"<a href='#' class='btn btn-danger btn-sm'>제거</a>" +
					 			"<p hidden class='position'>"+ mapx +"</p>"+
					 			"<p hidden class='position'>"+ mapy +"</p>"+
					 			"<span hidden>"+ contentid +"</span>"+
							"</div>"+
						"</div>"+
					"</div>" +					
				"</div>" 					
		);
		
// 		$("#left-tab-plan-contents").sortable({
// 			placeholder : "ui-sortable-placeholder",			
// 			connectWith: ".panel-body"
// 		});
		
		
		$("#left-tab-plan-contents .btn-default").click(function() {
			console.log("setCenter");
			var positionX = $(this).parent().find("p:hidden").eq(0).text();
			var positionY = $(this).parent().find("p:hidden").eq(1).text();
			
			console.log(positionX + ",  "+ positionY);
			map.panTo(new daum.maps.LatLng(positionY, positionX));		
		});
		
		$("#left-tab-plan-contents .btn-danger").click(function() {
			$(this).parent().parent().parent().parent().remove();
			lineDraw();
		});
		
		lineDraw();
		
	});
	
	
	
	function circleDraw(mapY, mapX) {
		
		var circle = new daum.maps.Circle({
		    map: map,
		    center : new daum.maps.LatLng(mapY, mapX),
		    radius: 10,
		    strokeWeight: 2,
		    strokeColor: '#CC0000',
		    strokeOpacity: 1,
		    strokeStyle: 'solid',
		    fillColor: '#FFFFFF',
		    fillOpacity: 1 
		});
		
		circleArray.push(circle);
		
	}
	
	function dayMarkerDraw(mapY, mapX, dayIndex) {
		
		var position = new daum.maps.LatLng(mapY,mapX);
		
		var content = "<div class='dayMarker'><h3>DAY"+ dayIndex +"</h3></div>"; 
		
		var dayMarkerDraw = new daum.maps.CustomOverlay({
			position : position,
			content : content,
			zIndex: 2,
			yAnchor : 1
		});
		
		dayMarkerArray.push(dayMarkerDraw);
		dayMarkerDraw.setMap(map);
	}
	
	function clearDayMarker(){
		for(var i=0; i<dayMarkerArray.length; i++) {
			dayMarkerArray[i].setMap(null);
		}
	}
	

	
	function lineDraw() {
		
		var linePoint = new Array();
 
		clearDayMarker();
		clearCircle();
		clearLine();
		
		polyline = new daum.maps.Polyline({
			map : map,
			strokeWeight :2,
			strokeColor : '#CC0000',
			strokeOpacity: 1,
		    strokeStyle: 'solid'
		});
		
		$("div#left-tab-plan-contents .panel-group").each(function(index, item){
			
			index = index+1
			var dayX = $(item).find("p.position").eq(0).text();
			var dayY = $(item).find("p.position").eq(1).text();
			console.log("DAY : ",index , " Day X : ", dayX , " Day Y : ", dayY);
			dayMarkerDraw(dayY, dayX, index);
			
			$(item).find(".media").each( function(i,pos) {
				console.log ("위도 : ", $(pos).find("p.position").eq(0).text() , " 경도 : ", $(pos).find("p.position").eq(1).text() );  
				
				var positionX = $(pos).find("p.position").eq(0).text();
				var positionY = $(pos).find("p.position").eq(1).text();
				
				linePoint.push( new daum.maps.LatLng( positionY, positionX ) );
				circleDraw(positionY, positionX);
				console.log(i + " 배열 넣어라. ")
				
			});		
		});
		
		console.log("---line Draw---");
		polyline.setPath(linePoint);
		
	}
	
	function clearLine() {
		if (polyline) {
			polyline.setMap(null);    
			polyline = null;        
	    }
	}
	
	function clearCircle() {
		for(var i=0; i<circleArray.length; i++) {
			circleArray[i].setMap(null);
		}
	}
	
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
				"<div class='panel-group ui-state-default' id='"+day+"dateStr'><div class='panel-heading'><strong>"+ nextDayDateFormat +" DAY "+ day+"</strong></div></div></div>");	
			
		}else {
			alert("출발일을 설정해 주세요 ");
		}				
	});
	
	
	$("#retryplan").click(function() {
		$("#left-tab-plan-contents")
		.html("<div class='col-md-12'><div class='panel-group ui-state-default' id='1dateStr''><div class='panel-heading'><strong>출발일을 입력해주세요</strong></div></div></div>")
		 $("#startDate").val("");
		clearCircle();
		clearLine();
		clearDayMarker();
		day = 1;			
		planArray.length = 0;
		dateInit();
		$("#saveBtn").attr("data-target","");
	});
	
	
	
	// 캘린더 변경시 날짜 설정 
	$("#startDate").change(function() {
		
		var startDate = $("#startDate").val();				
		if( day > 1 ) {
			$("#left-tab-plan-contents").html("");
			$("#left-tab-plan-contents").append("<div class='col-md-12'><div class='panel-group ui-state-default' id='1dateStr'><div class='panel-heading'><strong>" +
												 parseDate(startDate)+" DAY 1</strong></div></div></div>");
			planArray.length = 0;
			planArray.push(parseDate(startDate))
			for(var i=2; i<=day; i++) {
				$("#left-tab-plan-contents").append("<div class='col-md-12'><div class='panel-group ui-state-default' id='"+i+"dateStr'><div class='panel-heading'><strong>" +
													 parseAddDate(startDate,i)+" DAY "+ i+"</strong></div></div></div>");
				planArray.push(parseAddDate(startDate,i));
			}
			console.log(planArray);
		}else {
			planArray.length = 0;
			planArray.push(parseDate(startDate));
			console.log(planArray);
			$("#1dateStr .panel-heading strong").html( parseDate(startDate) +" DAY 1 ");	
						
		}
		
		clearDayMarker();
		clearCircle();
		clearLine();
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
	
	if($cat =='bookmark'){
		daum.maps.event.addListener(map, 'dragend', function() { 
			$.ajax({
				url:"bookmarkSelect.do",
				type:"post",
				dataType:"json",
				success : function(result) {
					
					var bookmarks = result.bookmarks;
					
					for(var i=0; i<bookmarks.length; i++){		
						
						var imageSrc = 'resources/images/icon_bookmark.png', // 마커이미지의 주소입니다    
										imageSize = new daum.maps.Size(24, 24), // 마커이미지의 크기입니다
										imageOption = {	offset : new daum.maps.Point(10, 35) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						// DB에서 가져와 막 찍으면된다.
						var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
										  markerPosition = new daum.maps.LatLng(bookmarks[i].place.mapy, bookmarks[i].place.mapx); // 마커가 표시될 위치입니다		
	
						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
							position : markerPosition,
							image : markerImage,		
							zIndex: 1,
							clickable : true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
						});
						
						markers.push(marker);
					
						//console.log(markers);
						setMarkers(map);
						
						// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						var content = '<div class="customoverlay">' +
									  '  <div class="panel panel-info">' +
									  '    <a class="btn btn-default btn-xs" href="#" role="button">'+bookmarks[i].place.title+'</a>' +
									  '    <p hidden id="place-addr">'+bookmarks[i].place.addr1+'</p>' +
									  '    <p hidden id="place-image">'+bookmarks[i].place.firstimage+'</p>' +
									  '    <p hidden id="place-overview">'+bookmarks[i].place.overview+'</p>' +
									  '    <p hidden id="place-tel">'+bookmarks[i].place.tel+'</p>' +
									  '    <p hidden id="place-mapx">'+bookmarks[i].place.mapx+'</p>' +
									  '    <p hidden id="place-mapy">'+bookmarks[i].place.mapy+'</p>' +
									  '    <p hidden id="place-contentid">'+bookmarks[i].place.contentid+'</p>' +
									  '  </div>' +
									  '</div>';
						
						var position = new daum.maps.LatLng(bookmarks[i].place.mapy, bookmarks[i].place.mapx);
						
						var customOverlay = new daum.maps.CustomOverlay({
							map : map,
							position : position,
							content : content,
							yAnchor : 1				
						});
						customArrays.push(customOverlay);
						
						$(".customoverlay .panel").click(function() {
							
							var title = $(this).find(".btn").text();
							var addr = $(this).find("#place-addr").text();
							var image = $(this).find("#place-image").text();
							var overview = $(this).find("#place-overview").text();
							var tel = $(this).find("#place-tel").text();
							var mapx = $(this).find("#place-mapx").text();
							var mapy = $(this).find("#place-mapy").text();
							var contentid = $(this).find("#place-contentid").text();
							
							var subStrOverView = overview.substring(0,300);
							
							if( overview.length > 300 ){
							  	$("#place-tab #overview").text(subStrOverView + "...");				
								$("#place-tab #overview").append("<a href='#'>더보기</a>");								
							} else {
							  	$("#place-tab #overview").text(overview);				
							}			
							
						
							
							$("#contents-tab").attr("class","col-md-6");
							$("#place-tab").show(500,function() {
								map.relayout();
								$("#place-tab strong").html( title );
								$("#place-tab img").attr("src",image);
								//$("#place-tab #overview").html( overview);
								$("#place-tab #addr").html( addr );
								$("#place-tab small").html( " ( " + tel + " ) ");
								$("#place-tab #mapx").html(mapx);
								$("#place-tab #mapy").html(mapy);
								$("#place-tab #contentid").html(contentid);
								
							});
							
///////////////////////////////////////////////////////////////////////////////////////////////
							
							$("#overview a").click(function(){
								alert("aa");
								$("#place-tab #overview").text(overview).hide().slideDown(500);
							});
							
///////////////////////////////////////////////////////////////////////////////////////////////	
							
							dateInit();			
						});	
						
					}
				}
			});
		});
	}
	
	$("#bookmark-tab").click(function(){
		
		$.ajax({
			url :"bookmarkSelect.do",
			type : "post",
			dataType:"json",
			success : function (result){
				var bookmarks = result.bookmarks;
				
				var tempHtml ="";
				
				for(var i=0; i<bookmarks.length; i++){
					console.log("top plAce : ",bookmarks[i].place.title );
					if(bookmarks[i].place.title.length > 10){
						var subTitle =  bookmarks[i].place.title.substring(0,9) + "...";
						tempHtml +="<div class='panel-body ui-state-default'>" +
										"<div class='media'>"+
										"<div class='media-left'>"+
										"<a href='#'><img class='media-object img-rounded'src='"+bookmarks[i].place.firstimage+"' alt='no photo' width='50' height='50'></a>"+
									"</div>"+
									"<div class='media-body'>"+
										"<h5 class='media-heading'>"+subTitle+"</h5>"+
										"<div class='btn-group btn-group-justified' role='group'>"+
											"<a href='#' data-mapx='"+bookmarks[i].place.mapx +"' data-mapy='"+bookmarks[i].place.mapy+"' class='btn btn-default btn-sm'>위치</a>"+
								 			"<a href='#' data-bookmarkid='"+bookmarks[i].no+"' class='btn btn-danger btn-sm'>제거</a>" +
										"</div>"+
									"</div>"+
								"</div></div>";
					}else {
						tempHtml += "<div class='panel-body ui-state-default'>" +
										"<div class='media'>"+
											"<div class='media-left'>"+
											"<a href='#'><img class='media-object img-rounded'src='"+bookmarks[i].place.firstimage+"' alt='no photo' width='50' height='50'></a>"+
										"</div>"+
										"<div class='media-body'>"+
											"<h5 class='media-heading'>"+bookmarks[i].place.title+"</h5>"+
											"<div class='btn-group btn-group-justified' role='group'>"+
												"<a href='#' data-mapx='"+bookmarks[i].place.mapx +"' data-mapy='"+bookmarks[i].place.mapy+"' class='btn btn-default btn-sm'>위치</a>"+
									 			"<a href='#' data-bookmarkid='"+bookmarks[i].no+"' class='btn btn-danger btn-sm'>제거</a>" +
											"</div>"+
										"</div>"+
									"</div></div>";
												
					}
				}
				$("#topPlace").html("");
				$("#topPlace").append(tempHtml);
				
				$("#topPlace .media-body .btn-default").click(function(){
					var mapX = $(this).data("mapx");
					var mapY = $(this).data("mapy");
					
					map.panTo(new daum.maps.LatLng(mapY, mapX));
					map.setLevel(2);
					mapSetting();
					
				});
				
				$("#topPlace .media-body .btn-danger").click(function(){
					
					var bookmarkid = $(this).data("bookmarkid");
					$(this).parent().parent().parent().parent().remove();
					
					$.ajax({
						url : "deleteBookmark.do",
						type:"post",
						data:{"bookmarkid":bookmarkid},
						dataType:"json",
						success : function(result) {
							
						}
					});
					
				});
				
			}
		})
		
	});
	
	$("#bookmark").click(function(){
		
		$.ajax({
			url:"bookmarkSelect.do",
			type:"post",
			dataType:"json",
			success : function(result) {
				
				var bookmarks = result.bookmarks;
				
				for(var i=0; i<bookmarks.length; i++){		
					
					var imageSrc = 'resources/images/icon_bookmark.png', // 마커이미지의 주소입니다    
									imageSize = new daum.maps.Size(24, 24), // 마커이미지의 크기입니다
									imageOption = {	offset : new daum.maps.Point(10, 35) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					// DB에서 가져와 막 찍으면된다.
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
									  markerPosition = new daum.maps.LatLng(bookmarks[i].place.mapy, bookmarks[i].place.mapx); // 마커가 표시될 위치입니다		

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						position : markerPosition,
						image : markerImage,		
						zIndex: 1,
						clickable : true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
					});
					
					markers.push(marker);
				
					//console.log(markers);
					setMarkers(map);
					
					// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					var content = '<div class="customoverlay">' +
								  '  <div class="panel panel-info">' +
								  '    <a class="btn btn-default btn-xs" href="#" role="button">'+bookmarks[i].place.title+'</a>' +
								  '    <p hidden id="place-addr">'+bookmarks[i].place.addr1+'</p>' +
								  '    <p hidden id="place-image">'+bookmarks[i].place.firstimage+'</p>' +
								  '    <p hidden id="place-overview">'+bookmarks[i].place.overview+'</p>' +
								  '    <p hidden id="place-tel">'+bookmarks[i].place.tel+'</p>' +
								  '    <p hidden id="place-mapx">'+bookmarks[i].place.mapx+'</p>' +
								  '    <p hidden id="place-mapy">'+bookmarks[i].place.mapy+'</p>' +
								  '    <p hidden id="place-contentid">'+bookmarks[i].place.contentid+'</p>' +
								  '  </div>' +
								  '</div>';
					
					var position = new daum.maps.LatLng(bookmarks[i].place.mapy, bookmarks[i].place.mapx);
					
					var customOverlay = new daum.maps.CustomOverlay({
						map : map,
						position : position,
						content : content,
						yAnchor : 1				
					});
					customArrays.push(customOverlay);
					
					$(".customoverlay .panel").click(function() {
						
						var title = $(this).find(".btn").text();
						var addr = $(this).find("#place-addr").text();
						var image = $(this).find("#place-image").text();
						var overview = $(this).find("#place-overview").text();
						var tel = $(this).find("#place-tel").text();
						var mapx = $(this).find("#place-mapx").text();
						var mapy = $(this).find("#place-mapy").text();
						var contentid = $(this).find("#place-contentid").text();
						
						var subStrOverView = overview.substring(0,300);
						
						if( overview.length > 300 ){
						  	$("#place-tab #overview").text(subStrOverView + "...");				
							$("#place-tab #overview").append("<a href='#'>더보기</a>");
						} else {
						  	$("#place-tab #overview").text(overview);				
						}
						
						$("#place-tab #overview a").click(function(){
							$("#place-tab-overview").text(overview).hide().slideDown(500);
						});
						
						$("#contents-tab").attr("class","col-md-6");
						$("#place-tab").show(500,function() {
							map.relayout();
							$("#place-tab strong").html( title );
							$("#place-tab img").attr("src",image);
							//$("#place-tab #overview").html( overview);
							$("#place-tab #addr").html( addr );
							$("#place-tab small").html( " ( " + tel + " ) ");
							$("#place-tab #mapx").html(mapx);
							$("#place-tab #mapy").html(mapy);
							$("#place-tab #contentid").html(contentid);
							
						});
						
						dateInit();			
					});	
					
				}
			}
		});
		
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
			//$("#left-tab-right").toggle(1000);
		
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
					
					if( map.getLevel() < 6 ){
						createMarker(result);					
					}					
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
	
</script>