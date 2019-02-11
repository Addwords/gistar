<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/resources/js/img/favicon.ico">
<style type="text/css">
.olControlAttribution {
	bottom: 0px;
	left: 2px;
	right: inherit;
	width: 400px;
}
/* conditionally position control differently for Google Maps */
.olForeignContainer div.olControlMousePosition {
	bottom: 28px;
}

#map {
	width: 100%;
	height: 800px;
}

#tooltip_contentDiv {
	background-color: balck;
}

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 100%;
}
.modes {position: absolute;top: 10px;left: 10px;z-index: 1;}
.modes span{
width: 60px;
height: 60px;
border: solid 1px;
cursor: pointer;
background-color: white;
}
.smallmap {
	width: 100%;
	height: 100%;
	position: relative;
	overflow: hidden;
}
.olButton{
display: none;
}
</style>
</head>
<body>
<div ng-app="ol" ng-controller="olController as vm">
		
	<select ng-model="name" id="selectgu" style="height:30px;" name="sggnm" ng-change="vm.gcon(this)">
		<option>::서울시</option> 
    </select>
    <!-- <input type="button" id="lmit10" value="{{name}}" readonly="readonly" ng-click="vm.gge()"> -->
    <!-- <input type="text" value="{{name}}" > -->
	<!-- <div id="map" style="width:1400px; height:600px;"></div> -->
	<div id="objec"></div>
		<div class="map_wrap">
		<div id="map" class="smallmap"></div>
		<div class="modes">
		    <span ng-click="vm.sang('Q12')">Cafe</span>
		    <span ng-click="vm.sang('D03')">편의점</span>
		</div>
	</div>
</div>
	
	<!-- 	팝업		 -->
	<div  id="popup" style="display:none;width: 1070px; left: 424px; position: absolute; top: 100px; z-index: 10002; opacity: 1; border: 1px solid">
		<h1  style="background: black 15px 50% no-repeat; padding-left: 37px; height: 29px; font-size: 15px; color: #ffffff; font-weight: 700; text-align: left; padding-top: 5px;">
			막대기
		</h1>
		<div style="padding: 15px 15px 15px 15px; background: #ffffff; overflow-x: hidden; overflow-y: auto; width: 1040px; height: 599px;">
			<h2 id="ptitle">지역별 상권현황</h2>
			<div style="width: 970px; height: 400px; padding: 10px 15px 15px 15px; margin-bottom:15px; border: #4a4a4a 1px solid">
				<canvas id="myChart" style="width: 970px; height: 400px;"></canvas>
			</div>
		</div>
	</div>
</body>
</html>