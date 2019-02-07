<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>OpenLayers: Spherical Mercator</title>
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
    <h1 id="title">OpenLayers 2 Spherical Mercator <a href="/WEB-INF/openLayers/sample/sample.html">Example</a></h1>
    <div id="map" class="smallmap"></div>
    <!-- <script type="text/javascript">
	
    // map ì¤ì > ê·¸ ë¤ì addLayer 
    var map = new OpenLayers.Map({
        div: "map",
        projection: "EPSG:900913", 
        displayProjection: "EPSG:4326",
        numZoomLevels: 10,
        // approximately match Google's zoom animation
        zoomDuration: 10
    });

    // open street map ìì±
    var mapnik = new OpenLayers.Layer.OSM();

    // create a vector layer for drawing
    var vector = new OpenLayers.Layer.Vector("Editable Vectors");
    
    // í´ë¦¬ê³¤ ê·¸ë¦¬ê¸° ìí í¬ë§· ì¤ì 
    var format = new OpenLayers.Format.WKT();
    
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
                123.662109, 34.628906, 130.75928, 38.77295       // ëíë¯¼êµ­ ë²ì ì¤ì 
            ).transform(map.displayProjection, map.projection)
        );
    var encoded = 'MULTIPOLYGON((13696686.97097 4637161.50812, 14509976.95181 4765575.71562, 14273939.40850 3988975.50835))';
    vector.addFeatures(format.read(encoded));
    </script> -->
  </body>
</html>



