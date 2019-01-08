<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<html>
<head>
	<title>GISTAR</title>
</head>
<body>
<h1>
	Hello Google!  
</h1>
<button onclick="backup();">Home</button>
	<div id="map" style="width:1400px; height:800px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddaeded8e5133d083b78618ed700a827"></script>
	<script>
		var container = $('#map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		function backup(){
			history.go(-1);
		}
		
	</script>
</body>
</html>
