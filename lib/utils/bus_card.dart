import 'package:buse_test/screens/bus_map.dart';
import 'package:buse_test/screens/get_data.dart';
import 'package:flutter/material.dart';

import '../screens/get_data.dart';

class BusCard extends StatefulWidget {
  final String bno;
  final int bId;

  BusCard({this.bno, this.bId});

  @override
  _BusCardState createState() => _BusCardState();
}

class _BusCardState extends State<BusCard> {
  double lat;
  double long;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.bno,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          FutureBuilder<BusLoc>(
            future: fetchLoc(widget.bId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                lat = snapshot.data.lat;
                long = snapshot.data.long;
                return Center(
                  child: Text(
                    'Near ${snapshot.data.address}',
                  ),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 25.0,
          ),
          OutlineButton(
            child: Text(
              'Show in Map',
              style: TextStyle(
                  //color: Colors.black.withAlpha(200),
                  fontSize: 15.0,
                  fontFamily: 'Montserrat'),
            ),
            splashColor: Colors.deepOrangeAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BusMap(
                    bno: widget.bno,
                    lat: lat,
                    long: long,
                  ),
                ),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            borderSide: BorderSide(color: Theme.of(context).backgroundColor),
          ),
        ],
      ),
    );
  }
}
