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
	height: 910px;
}
.aside {width5:00px;position:absolute;top:0px;right:0px;height:100%;border-left:1px solid #dcdcdc;background-color:#fff}

#tooltip_contentDiv {
	background-color: balck;
}

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 100%;
}
#selectgu{
position:absolute;
top: 10px;
left: 10px;
z-index: 1001;
}
.modes{
position:absolute;
top: 40px;
left: 10px;
z-index: 1001;
}
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

.closeView {position:absolute;top:0;right:0;}
.closeBt {float:right;padding:4px 10px 0 0;}
img{vertical-align:top}  

/* 맵 위에 그리드 올리기 */
.layer-info-wrap {position:absolute;left: 1px;top:67.9%;margin-top:-90px;min-height:202px;z-index:1001;}  
.layer-info-wrap .layer-info-box {width:1800px;height:380px;border:1px solid #c1c1c1;background:#f5f5f5;     opacity: 0.9;}
.layer-info-wrap .layer-info-btn {position:absolute;float:left;top:45%;margin-top:-66px;z-index:-1}
.layer-info-wrap .layer-info-btn .btn-layer.on{margin-left:1800px;display:inline-block;background:url('https://bigsight.kt.com/bdip/assets/img/tra/common/btn_quick_info.png') left top no-repeat;text-indent:-9999px;width:28px;height:132px;}
.layer-info-wrap .layer-info-btn .btn-layer{display:none;margin-left:0;display:inline-block;background: url('https://bigsight.kt.com/bdip/assets/img/tra/common/btn_quick_info.png') -30px top no-repeat;text-indent:-9999px;width: 59px;height: 127px;}
</style>
</head>
<body>
<div ng-app="ol" ng-controller="olController as vm">
		
    <!-- <input type="button" id="lmit10" value="{{name}}" readonly="readonly" ng-click="vm.gge()"> -->
    <!-- <input type="text" value="{{name}}" > -->
	<!-- <div id="map" style="width:1400px; height:600px;"></div> -->
	<div id="objec"></div>
	<div class="map_wrap">
		<div id="map" class="smallmap">
		<select ng-model="name" id="selectgu" style="height:30px; display: block;" name="sggnm" ng-change="vm.gcon(this)">
						<option>::서울시</option> 
				    </select> 
		<div class="modes">
                      <span ng-click="vm.sang('Q12')">Cafe</span>
                      <span ng-click="vm.clust('D03')">편의점</span>
                   </div>
                   
			<div class="layer-info-wrap">
				<div class="layer-info-box" ng-show="vm.showLayerBar==true">
					<div class="fr_search" >
						<h4 >전국 편의점 찾기</h4>
						<hr> 
						<table id="list"></table>
					</div>
				</div>
				<div class="layer-info-btn">
					<a href="javascript:;" class="btn-layer on" ng-show="vm.showLayerBar==true" title="닫기" ng-click="toggleLayerBar()" style="">닫기</a>	
					<a href="javascript:;" class="btn-layer ng-hide" ng-show="vm.showLayerBar==false" title="열기" ng-click="toggleLayerBar()" style="">열기</a>					
				</div>
			</div>
		</div>
	</div>
		
	<!-- 	팝업		 -->
	<div  id="popup" style="display:none;width: 1070px; left: 424px; position: absolute; top: 100px; z-index: 10002; opacity: 1; border: 1px solid" layer-report-popup>
		<h1  style="margin-top: 0px;margin-bottom: 0px; background: black 15px 50% no-repeat; padding-left: 37px; height: 29px; font-size: 15px; color: #ffffff; font-weight: 700; text-align: left; padding-top: 5px;">
			막대기
		</h1>
		<div style="padding: 15px 15px 15px 15px; background: #ffffff; overflow-x: hidden; overflow-y: auto; width: 1040px; height: 599px;">
			<h2 id="ptitle">지역별 상권현황</h2>
			<div id="wrapChart" style="width: 970px; height: 400px; padding: 10px 15px 15px 15px; margin-bottom:15px; border: #4a4a4a 1px solid">
				<canvas id="myChart" style="width: 970px; height: 400px;"></canvas>
			</div>
<!-- 			<div class=""> -->
<!-- 				<span class=""> -->
<!-- 					<a href="" ng-click="vm.closePopup()"> -->
<!-- 					닫기 -->
<!-- 							<img src="https://bigsight.kt.com/bdip/assets/img/tra/btn/btn_pop_close.gif" title="닫기"> -->
<!-- 					</a> -->
<!-- 				</span> -->
<!-- 			</div> -->
		</div>
	</div>

</div>
</body>
</html>