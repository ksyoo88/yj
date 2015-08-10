<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=64e5f8f5bfe12ab4deeb7911216e3f57"></script>
<script type="text/javascript">

$(function() {
	var container = document.getElementById('map-box'),
		options = {
			center : new daum.maps.LatLng(37.567357, 126.994657),
			level : 3
		};
	
	var map = new daum.maps.Map(container, options);
});

</script>