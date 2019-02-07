  angular.module('ol').controller('olController', function($scope, olService){
	  //계속적으로 event가 발생하거나 변형되는 변수들 전역으로 분리
	  var vm = this; //controller객체(자신)
	  var vector = new OpenLayers.Layer.Vector("Editable Vectors"); //경계영역 초기화를 위해 전역선언
	  var mapnik = new OpenLayers.Layer.OSM(); //지도관련lib? ollehmap으로 대체할것임
  	  var format = new OpenLayers.Format.WKT(); //지도관련lib? ollehmap으로 대체할것임
  	  var screenxy = { lon:0, lat:0 };
  	  var colorSet = ["#D70000","#FF0000","#FF6600","#FFAA00","#FEE800","#C8E70E","#8ECB12","#5BCC09","#0CC408","#00B406","#0BC2C4","#0FA4D5","#1E85DC","#2F5AE7"];
  	  vm.emdKorNm = [];
  	  vm.traCnt = [];
  	  
  	  var map = new OpenLayers.Map({ //초기 지도설정
        div: "map", //적용할 div id
        projection: "EPSG:900913",  //투영좌표계??
        displayProjection: "EPSG:4326", //표시할 투영 좌표계??
        numZoomLevels: 7, // 초기 지도 확대 정도인데 아랫부분에 bound함수때매 덮어써짐
        // approximately match Google's zoom animation
        zoomDuration: 10,
        eventListeners : {
        	//마우스의 현재위치값 반환
        	mousemove : function(e){
        		screenxy = this.events.getMousePosition(e);
        	}
        	//영역을 클릭했을때
        	,featureclick : function(e){
        		//console.log(e.feature.style.label);
//        		alert("click"+e.feature.style.label);
        		$("#popup").bPopup({
    				follow: [true, true],
    				position: ['auto', 30],
    				modalClose: true
        		});  
        	}
  	  		//영역에 마우스를 올렸을때
  	  		,featureover : function(evt){
  	  		var feature = evt.feature.style;
  	  		//console.log(evt.feature.geometry.getBounds());
  	  		//map.zoomToExtent(evt.feature.geometry.getBounds());//구 센터값 가져올예정
            var popup = new OpenLayers.Popup("tooltip",
            	evt.feature.geometry.getBounds().getCenterLonLat(), //정보를 표시할 위치 {lon:x, lat:y}
            	//현재 마우스포인터값 가져와야댐
            	null, //size
                "<div style='font-size:.8em;'>"+feature.label+"</div>",//팝업창에 보여줄 내용(HTML)
                null,
                true
            );
            feature.popup = popup;
            map.addPopup(popup);
  	  		}
  	  		//영역에서 마우스가 벗어낫을때 초기화
            ,featureout : function(evt){
                var feature = evt.feature.style;
                map.removePopup(feature.popup);
                feature.popup.destroy();
                feature.popup = null;
            }
        }//end eventListener
  	  
  	  });
  	  
  	 
	  $scope.init = function(){ // 최초실행
		  
		  $scope.createMap();
		  vm.gge();
	  }
	 
	  
	  vm.gge = function(){ //드롭박스에 구정보 불러옴
		  olService.seoulist().success(function(data) {
			  //console.log('list컨트롤러까지 왔음'+data.result.resultlist[0]);
			  var sstr = '<option>::서울특별시::</option>';
			  for(i in data.result.resultlist){
				  var d = data.result.resultlist[i];
					sstr += '<option value="'+d.sggCd+'">'+d.sggNm+'</option>';
			  }
			  $('#selectgu').html(sstr);
		  });
		  
	  }
	  
	  
	  vm.gcon = function(data){ //시군구코드 보내기용(value값은 name)
		  var param = JSON.stringify({sigCd:data.name}); //ajax통신시 json형식을 String으로 cast해서 보내야함
		  console.log(param);
		  
		  olService.seoulgeom(param).success(function(data) {
			  //console.log('geom컨트롤러까지 왔음'+data.result.resultlist);
				  var d = data.result.resultlist;
				  vm.dongData = d[0].traCnt;
				  //console.log(d.geom);
				  $scope.createPolygon(d);
				  
				  for(var i = 0; i < d.length; i++){
					  vm.emdKorNm.push(d[i].emdKorNm);
					  vm.traCnt.push(d[i].traCnt);
				  }
		  });
		  
		  var ctx = document.getElementById("myChart").getContext('2d');
		  var myChart = new Chart(ctx, {
			  type: 'bar',
			  data: {
				  labels: vm.emdKorNm,
				  datasets: [{
					  label: 'Series',
					  data: vm.traCnt,
					  backgroundColor: colorSet
				  }]
			  }
		  });
	  }
	  
	  $scope.event = function(){ //테스트 중
		  
	  }
	  
	  $scope.createMap = function(){ //맵 최초생성
		    map.addLayers([
		    	mapnik, vector
		    ]);
		    
		    // map ì»¨í¸ë¡¤ ì¶ê° 
		    //map.addControl(new OpenLayers.Control.LayerSwitcher());     // ì°ì¸¡ ì§ëë³ê²½    ì£¼ìì²ë¦¬
		    map.addControl(new OpenLayers.Control.EditingToolbar(vector));  // ì°ì¸¡ ìë¨ 4ê° ì»¨í¸ë¡¤ toolbar
		    //map.addControl(new OpenLayers.Control.Permalink());        // ë§µ ë¤ì ìì±   ì£¼ìì²ë¦¬ 
		    map.addControl(new OpenLayers.Control.MousePosition());       
		    //map.zoomToMaxExtent();맵 이동
		    //초기에 서울시로 범위셋팅
		    map.zoomToExtent(
		            new OpenLayers.Bounds(
		                126.67168, 37.35204, 127.35146, 37.71306       // ëíë¯¼êµ­ ë²ì ì¤ì 
		            ).transform(map.displayProjection, map.projection)
		        );
		      //hover 컨트롤러 추가
		      var selector = new OpenLayers.Control.SelectFeature(vector,{
		          hover:true,
		          autoActivate:true
		      }); 
		      map.addControl(selector);
	 }
	  
	  //동별 색칠하기 --5분위로 나눔(법정동 과 행정동 둘중하나로 통일해야됨)
	  $scope.createPolygon = function(param){
		  var polyfeatrue = [];
		  var color = ['red','orange','yellow','lightgreen','green']; //5분위에 해당하는 색정보(order by 상권수 desc)
		  var gugeo = format.read(param[0].guGeom);//선택한 시군구의 geometry값 셋팅
		  vector.addFeatures(gugeo); //선택한 시군구의 bounds값을 가져오기 위해 feature생성, 동정보와 겹치기 때문에 remove전에 선언
		  map.zoomToExtent(gugeo.geometry.getBounds()); //선택한 시군구의 bounds값으로 화면이동
		  
		  for(i in param){
			   var d = param[i];
			   polyfeatrue.push(format.read(d.emdGeom));
			   polyfeatrue[i].style = {
		    			 fillColor : color[d.rank-1] //color[d.rank] --분위는 1부터 시작이므로 -1 해주어야 함
			   			,fillOpacity : 0.7 //투명도
			   			,fontSize: 12 //글자크기
			   			,Title : d.emdKorNm //제목
			   			,label : d.emdKorNm+'('+d.traCnt+')' //지도에표시할정보
			   			,strokeColor: 'white' //선색
			   			,strokeDashstyle: 'longdash' //선모양
		    	}
		  }
	    	vector.removeAllFeatures(); //다른 시군구를 선택했을때 전에 그려진 시군구 초기화
	    	vector.addFeatures(polyfeatrue); //동정보 그리기
	    }
	  $scope.init();
});
