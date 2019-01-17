/**
 * 테스트 중
 */
  angular.module('ol').controller('olController', function($scope, olService){
	  var vm = this;
	  var vector = new OpenLayers.Layer.Vector("Editable Vectors");
	  var mapnik = new OpenLayers.Layer.OSM();
  	  var format = new OpenLayers.Format.WKT();
	  $scope.init = function(){
		  
		  $scope.createMap();
		  vm.gge();
	  }
	  //테스트용 --> 드롭박스에 구정보 불러올예정
	  vm.gge = function(){
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
	  //구코드 보내기용(value값은 name)
	  vm.gcon = function(data){
		  var param = JSON.stringify({sigCd:data.name});
		  console.log(param);
		  olService.seoulgeom(param).success(function(data) {
			  console.log('geom컨트롤러까지 왔음'+data.result.resultlist[0]);
				  var d = data.result.resultlist[0];
				  //console.log(d.geom);
				  $scope.createPolygon(d.geom);
		  });
	  }
	  
	  $scope.createMap = function(){
		// map ì¤ì > ê·¸ ë¤ì addLayer 
		    var map = new OpenLayers.Map({
		        div: "map",
		        projection: "EPSG:900913", 
		        displayProjection: "EPSG:4326",
		        numZoomLevels: 7,
		        // approximately match Google's zoom animation
		        zoomDuration: 10
		    });

		    // open street map ìì±

		    // create a vector layer for drawing
		    
		    // í´ë¦¬ê³¤ ê·¸ë¦¬ê¸° ìí í¬ë§· ì¤ì 
		    
		    // mapì OSMê³¼ vector ë ì´ì´ ì¶ê°
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
	  $scope.createPolygon = function(geom){
	    	
	    	var encoded = geom;
	    	console.log('efe');
	    	//var encoded = s.result.geom; //쿼리결과(geom)
	    	vector.removeFeatures();
	    	vector.addFeatures(format.read(encoded));
	    }
	  $scope.init();
});
