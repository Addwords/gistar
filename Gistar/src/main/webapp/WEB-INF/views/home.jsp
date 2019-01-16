<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>OpenLayers: Spherical Mercator</title>
    <link rel="stylesheet" href="../theme/default/style.css" type="text/css">
    <!--[if lte IE 6]>
        <link rel="stylesheet" href="../theme/default/ie6-style.css" type="text/css" />
    <![endif]-->
    <link rel="stylesheet" href="style.css" type="text/css">
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
    <script src="../OpenLayers.js"></script>
  </head>
  <body>
    <h1 id="title">OpenLayers 2 Spherical Mercator Example</h1>
    <div id="map" class="smallmap"></div>
    <script type="text/javascript">
	
    // map 설정> 그 다음 addLayer 
    var map = new OpenLayers.Map({
        div: "map",
        projection: "EPSG:900913", 
        displayProjection: "EPSG:4326",
        numZoomLevels: 18,
        // approximately match Google's zoom animation
        zoomDuration: 10
    });

    // open street map 생성
    var mapnik = new OpenLayers.Layer.OSM();

    // create a vector layer for drawing
    var vector = new OpenLayers.Layer.Vector("Editable Vectors");
    
    // 폴리곤 그리기 위한 포맷 설정
    var format = new OpenLayers.Format.WKT();
    
    // map에 OSM과 vector 레이어 추가
    map.addLayers([
    	mapnik, vector
    ]);
    
    // map 컨트롤 추가 
    //map.addControl(new OpenLayers.Control.LayerSwitcher());     // 우측 지도변경    주석처리
    map.addControl(new OpenLayers.Control.EditingToolbar(vector));  // 우측 상단 4개 컨트롤 toolbar
    //map.addControl(new OpenLayers.Control.Permalink());        // 맵 다시 생성   주석처리 
    map.addControl(new OpenLayers.Control.MousePosition());       
    //map.zoomToMaxExtent();
    map.zoomToExtent(
            new OpenLayers.Bounds(
                123.662109, 34.628906, 130.75928, 38.77295       // 대한민국 범위 설정
            ).transform(map.displayProjection, map.projection)
        );
    var encoded = 'MULTIPOLYGON((13696686.97097 4637161.50812, 14509976.95181 4765575.71562, 14273939.40850 3988975.50835))';
    vector.addFeatures(format.read(encoded));
    </script>
  </body>
</html>



