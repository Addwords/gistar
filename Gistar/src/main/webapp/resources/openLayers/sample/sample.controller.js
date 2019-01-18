/**
 * 테스트 중
 */
  angular.module('ol').controller('olController', function($scope, olService){
	  //계속적으로 event가 발생하거나 변형되는 변수들 전역으로 분리
	  var vm = this; //controller객체(자신)
	  var vector = new OpenLayers.Layer.Vector("Editable Vectors"); //경계영역 초기화를 위해 전역선언
	  var mapnik = new OpenLayers.Layer.OSM(); //지도관련lib? ollehmap으로 대체할것임
  	  var format = new OpenLayers.Format.WKT(); //지도관련lib? ollehmap으로 대체할것임
  	  var map = new OpenLayers.Map({ //초기 지도설정
        div: "map", //적용할 div id
        projection: "EPSG:900913",  //??? 
        displayProjection: "EPSG:4326", //???
        numZoomLevels: 7, // 초기 지도 확대 정도인데 아랫부분에 bound함수때매 덮어써짐
        // approximately match Google's zoom animation
        zoomDuration: 10,
        eventListeners : {
        	featureclick : function(e){
        		
        		alert("click"+e.title);
        	}
        }
  	  });
  	  
	  $scope.init = function(){ // 최초실행
		  
		  $scope.createMap();
		  vm.gge();
	  }
	 
	  
	  vm.gge = function(){ //드롭박스에 구정보 불러옴
		  olService.seoulist().success(function(data) {
			  console.log('list컨트롤러까지 왔음'+data.result.resultlist[0]);
			  var sstr = '<option>::서울시</option>';
			  for(i in data.result.resultlist){
				  var d = data.result.resultlist[i];				  
					sstr += '<option value="'+d.sggCd+'">'+d.sggNm+'</option>';
			  }
			  $('#selectgu').html(sstr);
		  });
		  
	  }
	  
	  
	  vm.gcon = function(data){ //구코드 보내기용(value값은 name)
		  var param = JSON.stringify({sigCd:data.name});
		  console.log(param);
		  olService.seoulgeom(param).success(function(data) {
			  console.log('geom컨트롤러까지 왔음'+data.result.resultlist);
				  var d = data.result.resultlist;
				  //console.log(d.geom);
				  $scope.createPolygon(d);
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
		    //map.zoomToMaxExtent();
		    map.zoomToExtent(
		            new OpenLayers.Bounds(
		                126.67168, 37.35204, 127.35146, 37.71306       // ëíë¯¼êµ­ ë²ì ì¤ì 
		            ).transform(map.displayProjection, map.projection)
		        );
		    
/*		    	var encoded = 'MULTIPOLYGON((13696686.97097 4637161.50812, 14509976.95181 4765575.71562, 14273939.40850 3988975.50835))';
		    	//var encoded = s.result.geom; //쿼리결과(geom)
		    	vector.addFeatures(format.read(encoded));*/
		  
	 }
	  
	  $scope.createPolygon = function(param){
		  var temp = [];
		  var polyfeatrue = [];
		  var color = ['red','orange','yellow','lightgreen','green'];
		   for(i in param){
			   var d = param[i];
			   polyfeatrue.push(format.read(d.geom));
			   console.log(d.rand);
			   polyfeatrue[i].style = {
		    			 fillColor : color[i]
			   			,fillOpacity : 0.9
			   			,Title : d.emdKorNm
			   			,label : d.emdKorNm
			   			,strokeDashstyle: 'longdash'
		    	}
		  }
		  //console.log(pa+"sdf");
		 // var polyfeatrue = format.read(temp);
		  //map.zoomToExtent(geom);
	    	var polygan = [];
	    	console.log(param);
	    	
	    	vector.removeAllFeatures(); //다른 시군구를 선택했을때 전에 그려진 시군구 초기화
	    	/* var opt = [];
	    	for(i=0;i<param.length;i++){
	    		 opt.push(format.read(param[i].geom).style = {
		    		fillColor : 'red'
		    	})
		    	
	    		polygan.push(format.read(param[i].geom));
	    	
		    	
	    	}*/
//	    	vector.addFeatures(polygan, {fillColor: 'red'});
	    	/*polyfeatrue.style = {
	    			fillColor : 'red'
	    	}*/
	    	vector.addFeatures(polyfeatrue);
	    	//OpenLayers.Events.featureclick(alert('asdf'));
	    }
	  $scope.init();
});
