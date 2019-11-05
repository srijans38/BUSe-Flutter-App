import 'package:buse_test/screens/get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class BusMap extends StatefulWidget {
  final String bno;
  final double lat;
  final double long;

  BusMap({this.bno, this.lat, this.long});

  @override
  _BusMapState createState() => _BusMapState();
}

class _BusMapState extends State<BusMap> {
  LatLng currLoc;

  @override
  void initState() {
    super.initState();
    var currLocFuture = fetchCurrentLoc();
    currLocFuture.then((result) {
      currLoc = LatLng(result.latitude, result.longitude);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Stack(
          children: <Widget>[
            FlutterMap(
                options: MapOptions(
                  center: LatLng(widget.lat, widget.long),
                  zoom: 15,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}",
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1Ijoic3JpamFuczM4IiwiYSI6ImNqemN3cHRodzAyb2ozZG94YXZwN3VkMWYifQ.pszoH4JN8jktAkXtDl40wQ',
                      'id': 'mapbox.dark',
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(widget.lat, widget.long),
                        builder: (context) => Icon(
                          Icons.directions_bus,
                          color: Colors.orange,
                          size: 40.0,
                        ),
                      ),
                      currLoc != null
                          ? Marker(
                              width: 20.0,
                              height: 20.0,
                              point: currLoc,
                              builder: (context) => Container(
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(
                                      side: BorderSide(
                                    color: Colors.white,
                                  )),
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          : Marker(),
                    ],
                  ),
                ]),
            Positioned(
              top: 40.0,
              left: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 120.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Text(
                        widget.bno,
                        style: TextStyle(
                          color: Colors.black.withAlpha(200),
                          fontSize: 25.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
