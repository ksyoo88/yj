<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="resources/js/mscroll/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/bootstrap-slider.min.js"></script>
<script type="text/javascript" src="resources/js/mustache/mustache.min.js"></script>
<script type="text/javascript" src="resources/js/handlebars-v3.0.3.js"></script>

  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
  <script>
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
		    console.log(1, newDate);
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
		
	
$(function() {

	var d = new Date();
	var month = d.getMonth() + 1;
	var year = d.getFullYear();
	var day = d.getDate();
	var daycnt=1;
	console.log(daycnt);

		
	//일정 추가
	$(".btn-addphoto").click(function() {

		daycnt=daycnt+1;
		console.log(daycnt);
		
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
				
		daycnt=1;
		
	

	})
	
	$("#daydeletebutton").click(function() {
		$('#mCSB_95 > :last').remove();
		$(".date-day > :last").remove();
		daycnt=1;
		d.setDate(d.getDate(d) - 1);
		
	})
	
	

});
		</script>