<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        	width: 1300px;
            height: 800px;
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
		
</div>
<div id="map" class="smallmap"></div>
</body>
</html>