<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>GISTAR</title>
</head>
<body>
<h1>
	Hello Google!
	<a href="/oltest.gistar">Test</a>  
</h1>
내이름은 <p id='nam'></p>
나이는 <p id='ag'></p>

<div id="clickLatlng"></div>

<input type="button" id="lmit10" onclick="">

<script type="text/javascript">
$(function(){
	main.init();
	
});
var main = (function(){
	
	return{
		init : function(){
			var htmstr = '';
			console.log("init실행.");
			ajax.post('/di/selectList.gistar', {}, main.postcnt);
		}
		,postcnt : function(data){
			if(data.result && data.result != ''){
				//var pcnt = validVal(data.result.listcnt) ? data.result.listcnt : 0;
				//var pcnt = data.result.listcnt ? data.result.listcnt : 0;
				
				//$('.postcnt b').text(pcnt.toLocaleString());
				
				list.set(data.result.resultlist, $('#nam'));
			}
		}
	}
})();

</script>
	<div id="map" style="width:100%;height:800px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddaeded8e5133d083b78618ed700a827&libraries=LIBRARY"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddaeded8e5133d083b78618ed700a827&libraries=LIBRARY"></script> -->
	<script>
		var container = document.getElementById('map');
		var options = {
			//center: new daum.maps.LatLng(33.450701, 126.570667) //kakao
			center: new daum.maps.LatLng(37.482559, 127.002119)
			,level: 2
		};

		var map = new daum.maps.Map(container, options);
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new daum.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		});
	</script>
</body>
</html>
