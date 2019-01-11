<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<html>
<head>
	<title>GISTAR</title>
</head>
<body>
<div ng-app="myApp" ng-controller="myCtrl">
<h1>
	Hello kakao!  
</h1>
	<button onclick="backup();">Home</button>
	
	<form id="sangsend" name="sangsend" method="post">
    <select ng-model="name" id="selectgu" style="height:30px;" onchange="main.sang(this)" name="sggnm">
        <!-- <option>강남구</option> -->
    </select>
    </form>
    <!-- <input type="button" id="lmit10" onclick="main.sang(this)" value="{{name}}"> -->
	<div id="map" style="width:1400px; height:500px;"></div>
	<div id="objec"></div>
	<!-- <script type="text/javascript" src="//api.ollehmap.com:10083/v3/olleh/mapAPI.js?key=T2xsZWhNYXBJTjAwNTM6bXUyMjY3MUhrMA=="></script> -->
	<!-- <script src="http://www.withapi.com/MapAPI/serviceJSP/Auth.jsp?key=samplekey&module=Map,Geocoder"></script> -->
</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddaeded8e5133d083b78618ed700a827&libraries=LIBRARY"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.5028500605707, 126.882759872564), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

		function backup(){
			history.go(-1);
		}
		//앵귤러 적용 선언부
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($scope) {
		    //$scope.name = "강남구"; //초기값
		});
		
		//초기화
		$(function(){
			main.init();
		});
		
		var main = (function(){
			
			return{
				init : function(){
					var htmstr = '';
					console.log("init실행완료");
					//console.log(positions2.length);
					ajax.post('/di/getSeoulList.gistar', {}, main.slist);
				}//init 끝
				//openlay.map(val : {})
				,slist : function(data){
					if(data.result && data.result != ''){
						$('#lmit10').val(data.result.resultlist[0].sggNm); //초기값 설정
						list.selbox(data.result.resultlist, $('#selectgu')); //드롭박스 데이터 채움
					}else{
						console.log('error');
					}
				}//slist 끝
				
				,sang : function(data){
					//AJAX로 JSON형태를 보낼때 컨트롤러는 json를 string으로 인식하지 못하기 때문에 JSON.stringify()해주어야 함.
					var param = JSON.stringify({sggNm:data.value});
					console.log('실행');
					ajax.post('/di/getSangList.gistar', param, main.tet);
					//document.sangsend.action = '/di/getSangList.gistar';
					//sangsend.submit();
					
				}//sang 끝
				,tet : function(data){
					//console.log("여기"+data.result.resultlist[0].xcrd);
					var marker = '';
					list.selbox2(data.result.resultlist, $('#objec')); //드롭박스 데이터 채움
					//console.log(positions2);
					
					for (var i = 0; i < positions.length; i ++) {
						//console.log('3');
					    // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new daum.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					    
					    // 마커를 생성합니다
					    marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					    
					}
				}
				
			}//main 끝
		})();
	</script>
</body>
</html>



