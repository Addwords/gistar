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

	<!-- <script type="text/javascript" src="//api.ollehmap.com:10083/v3/olleh/mapAPI.js?key=T2xsZWhNYXBJTjAwNTM6bXUyMjY3MUhrMA=="></script> -->
	<script src="http://www.withapi.com/MapAPI/serviceJSP/Auth.jsp?key=samplekey&module=Map,Geocoder"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			 center: new olleh.maps.Coord(953755.70, 1949715.52)
			,zoom: 3
			,mapTypeId: olleh.maps.MapTypeId.BASEMAP
		};

		var map = new olleh.maps.Map(container, options);
		
		function backup(){
			history.go(-1);
		}
		
	</script>
</body>
</html>
