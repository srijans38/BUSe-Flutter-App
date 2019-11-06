import 'package:buse_test/screens/get_data.dart';
import 'package:buse_test/utils/bus_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusList extends StatefulWidget {
  final int route;
  final int bpoint;

  BusList({this.route, this.bpoint});

  @override
  _BusListState createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  Future<List> buses;
  List busList = List();

  List filterBuses(int route, List busList) {
    List temp = List();
    for (var bus in busList) {
      if (widget.route == bus.route) {
        temp.add(bus);
      }
    }
    return temp;
  }

//  Widget buildListView(List busList) {
//    var temp = ListView(
//      children: busList.map((bus) {
//        Text('test');
//      }).toList(),
//    );
//    setState(() {});
//    return temp;
//  }

  @override
  void initState() {
    super.initState();
    fetchBuses().then((result) {
      for (var bus in result) {
        busList.add(Bus.fromJSON(bus));
      }
      setState(() {
        busList = filterBuses(widget.route, busList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.orangeAccent,
        child: FutureBuilder(
          future: fetchBuses(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: busList.map((var bus) {
                  return BusCard(
                    bno: bus.bno,
                    bId: bus.id,
                  );
                }).toList(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
