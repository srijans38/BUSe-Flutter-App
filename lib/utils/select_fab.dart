import 'package:buse_test/screens/bus_list.dart';
import 'package:buse_test/screens/get_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectFAB extends StatefulWidget {
  @override
  _SelectFABState createState() => _SelectFABState();
}

class _SelectFABState extends State<SelectFAB> {
  String _bpoint;
  Future<List> routes;
  Future<List> bpoints;
  List routeFull = List();
  List bpointFull = List();
  List routeList = List();
  List bpointList = List();
  String _route;
  bool bpointsLoaded = false;
  bool routesLoaded = false;
  bool get isLoaded => (bpointsLoaded && routesLoaded);

  int getRouteId(String name) {
    for (var i in routeFull) {
      if (name == i.name) {
        return i.id;
      }
    }
    return 10;
  }

  int getBpointId(String name) {
    for (var i in bpointFull) {
      if (name == i.name) {
        return i.id;
      }
    }
    return 10;
  }

  void initState() {
    super.initState();
    fetchRoutes().then((result) {
      for (var route in result) {
        routeList.add(BusRoute.fromJSON(route).name);
        routeFull.add(BusRoute.fromJSON(route));
      }
      setState(() {
        routesLoaded = true;
        _route = routeList[0];
      });
    });
    fetchBPoints().then((result) {
      for (var bpoint in result) {
        bpointList.add(Bpoints.fromJSON(bpoint).name);
        bpointFull.add(Bpoints.fromJSON(bpoint));
      }
      setState(() {
        bpointsLoaded = true;
        _bpoint = bpointList[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 32.0,
            horizontal: 16.0,
          ),
          margin: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset.fromDirection(20.0, 5.0),
                blurRadius: 1.0,
              ),
            ],
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: isLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Catch Your Bus',
                      style: TextStyle(
                        //color: Colors.black.withAlpha(200),
                        //fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Route',
                          style: TextStyle(
                            //color: Colors.black.withAlpha(200),
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: _route,
                          underline: Container(
                            height: 1.0,
                            color: Theme.of(context).highlightColor,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              _route = newValue;
                            });
                          },
                          items: routeList
                              .map<DropdownMenuItem<String>>((var value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          icon: Icon(Icons.timeline),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Boarding Point',
                          style: TextStyle(
                            //color: Colors.black.withAlpha(200),
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: _bpoint,
                          underline: Container(
                            height: 1.0,
                            color: Theme.of(context).highlightColor,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              _bpoint = newValue;
                            });
                          },
                          items: bpointList
                              .map<DropdownMenuItem<String>>((var value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          icon: Icon(Icons.location_on),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
                    )
                  ],
                ),
        ),
        Opacity(
          opacity: isLoaded ? 1.0 : 0.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: RawMaterialButton(
              elevation: 30.0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BusList(
                              route: getRouteId(_route),
                              bpoint: getBpointId(_bpoint),
                            )));
              },
              constraints: BoxConstraints(
                maxHeight: 60,
                maxWidth: 60,
              ),
              fillColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                height: 60,
                width: 60,
                //color: Colors.black,
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
