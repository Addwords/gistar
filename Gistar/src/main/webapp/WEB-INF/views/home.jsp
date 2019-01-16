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

    <!-- <script src="http://maps.google.com/maps/api/js?v=3&amp;sensor=false"></script> -->

    <!-- <script src="/resources/js/OpenLayers.js"></script> -->
  </head>
  <body>
    <h1 id="title">OpenLayers 2 Spherical Mercator Example</h1>

    <div id="map" class="smallmap"></div>

    <script type="text/javascript">

    var map = new OpenLayers.Map({
        div: "map",
        projection: "EPSG:900913",
        displayProjection: "EPSG:4326",
        numZoomLevels: 10,
        // approximately match Google's zoom animation
        zoomDuration: 4
    });

    // create Bing layers

    // API key for http://openlayers.org. Please get your own at
    // http://bingmapsportal.com/ and use that instead.
    var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";

    var vehyb = new OpenLayers.Layer.Bing({
        key: apiKey,
        type: "AerialWithLabels",
        wrapDateLine: true
    });

    // create OSM layers
    var mapnik = new OpenLayers.Layer.OSM();

    // create a vector layer for drawing
    var vector = new OpenLayers.Layer.Vector("Editable Vectors");
    var format = new OpenLayers.Format.WKT();
    map.addLayers([
        mapnik, vector
    ]);
    //map.addControl(new OpenLayers.Control.LayerSwitcher());
    map.addControl(new OpenLayers.Control.EditingToolbar(vector));
    map.addControl(new OpenLayers.Control.Permalink());
    map.addControl(new OpenLayers.Control.MousePosition());
    //map.zoomToMaxExtent();
    map.zoomToExtent(
            new OpenLayers.Bounds(
                123.662109, 34.628906, 130.75928, 38.77295
            ).transform(map.displayProjection, map.projection)
        );
    var encoded = 'MULTIPOLYGON((126.795989 37.448523, 126.962042 37.757249, 127.112698 37.160408, 126.795989 37.448523))';
    vector.addFeatures(format.read(encoded));
    </script>
  </body>
</html>


