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
	Hello kakao! <a href="/sample.gistar">이동</a> 
</h1>
	<button onclick="backup();" hidden="">Home</button>
	

    <select ng-model="name" id="selectgu" style="height:30px;" onchange="main.sang(this)" name="sggnm">
        <!-- <option>강남구</option> -->
    </select>

    <input type="button" id="lmit10" value="{{name}}" readonly="readonly">
    <!-- <input type="text" value="{{name}}" > -->
	<div id="map" style="width:1400px; height:600px;"></div>
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
		    //$scope.name = $('#selectgu').val();      //"강남구"; //초기값
		});
		
		//초기화
		$(function(){
			main.init();
		});
		
		var main = (function(){
			//var polygonPath = [];
			return{
				init : function(){
					var htmstr = '';
					console.log("init");
					ajax.post('/di/getSeoulList.gistar', {}, main.slist);
				}//init 끝
				,slist : function(data){
					if(data.result && data.result != ''){
						$('#lmit10').val(data.result.resultlist[0].sggNm); //초기값 설정
						list.selbox(data.result.resultlist, $('#selectgu')); //드롭박스 데이터 채움
					}else{
						console.log('error');
					}
				}//slist 끝
				
				//상권정보 불러오기
				,sang : function(data){
					//마커를 초기화 하기위해 Map을 초기화
					$('#map').html('');
					 mapOption = { 
					        center: new daum.maps.LatLng(37.48203050457052, 127.00310356652813),
					        level: 7 // 지도의 확대 레벨
					    };
					map = new daum.maps.Map(mapContainer, mapOption); 
					console.log(data.value);
					//AJAX로 JSON형태를 보낼때 컨트롤러는 json를 string으로 인식하지 못하기 때문에 JSON.stringify()해주어야 함.
					var param = JSON.stringify({sggCd:data.value}); //마커표시를 위해 시군구코드 json으로 담기 --통합예정
					var lparam = JSON.stringify({sigCd:data.value});//경계영역표시를 위해 시군구코드 json으로 담기 --통합예정
					positions = []; //상권정보의 위치와 상호명을 담을 배열 초기화 --선택한 구만 나와야 하기때문
					ajax.post('/di/getSangList.gistar', param, main.tet);
					main.gugeom(lparam);
				}

				//불러온 상권정보 마커표시
				,tet : function(data){
					
					//map = new daum.maps.Map(mapContainer);
					list.selbox2(data.result.resultlist, $('#objec')); 
					
					var bounds = new daum.maps.LatLngBounds(); 
					for (var i = 0; i < positions.length; i ++) {
						
					    // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new daum.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					    
					    // 마커를 생성합니다
					    var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage, // 마커 이미지 
					        
					    });
						// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
					    bounds.extend(positions[i].latlng)
					}
				    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
				    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
					map.setBounds(bounds);
					
				}//tet끝
				
				//선택한 구 영역정보 표시하기
				,gugeom : function(param){
					console.log(param);
					ajax.post('/di/getSeoulGeom.gistar', param, function(data){
						
						if(data.result && data.result != ''){
							main.poly(data.result.resultlist);
						}
						//console.log("다찍음")
					});
					
					
				}
				//
				,poly : function(data){
					if(data && data.length > 0){
						polygonPath = [];
						//데이터양만큼 
						for(i in data){
							var d = data[i];
							//console.log(d.xCrd);
							polygonPath.push(new daum.maps.LatLng(d.xCrd, d.yCrd));
						}
						
					}else{
						sstr = "코드가 없습니다."
					}
					//console.log(data.result.resultlist[0].xCrd); //초기값 설정
					//console.log(polygonPath); //초기값 설정
					// 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다
					 /* var polygonPath = [
					    new daum.maps.LatLng(33.45133510810506, 126.57159381623066),
					    new daum.maps.LatLng(33.44955812811862, 126.5713551811832),
					    new daum.maps.LatLng(33.449986291544086, 126.57263296172184),
					    new daum.maps.LatLng(33.450682513554554, 126.57321034054742),
					    new daum.maps.LatLng(33.451346760004206, 126.57235740081413) 
					];  */

					// 지도에 표시할 다각형을 생성합니다
					var polygon = [];
					polygon.push(new daum.maps.Polygon({
					    path: polygonPath, // 그려질 다각형의 좌표 배열입니다
					    strokeWeight: 3, // 선의 두께입니다
					    strokeColor: '#FF0000', // 선의 색깔입니다
					    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'longdash', // 선의 스타일입니다
					    fillColor: '#FFFFFF', // 채우기 색깔입니다
					    fillOpacity: 0.4 // 채우기 불투명도 입니다
					})
					);

					// 지도에 다각형을 표시합니다
					console.log("완료");
					polygon[0].setMap(map);
				}
				
				

			}//main 끝
		})();
	</script>
</body>
</html>



