import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> fetchRoutes() async {
  //List locData = List();
  final response = await http.get('https://buseweb.tech/api/route/');
  var routes = await json.decode(response.body);
  return routes;
}

Future<List> fetchBPoints() async {
  //List locData = List();
  final response = await http.get('https://buseweb.tech/api/bpoint/');
  var bpoints = await json.decode(response.body);
  return bpoints;
}

Future<List> fetchBuses() async {
  //List locData = List();
  final response = await http.get('https://buseweb.tech/api/bus/');
  var buses = await json.decode(response.body);
  return buses;
}

Future<BusLoc> fetchLoc(int busId) async {
  final response = await http.get('https://buseweb.tech/api/loc/$busId/');
  var busLoc = await BusLoc.fromJSON(json.decode(response.body));
  return busLoc;
}

class BusRoute {
  final int id;
  final String source;
  final String destination;
  String name;

  var fullName = {'A': 'Airport', 'D': 'Durg', 'R': 'Raipur Railway Station'};

  BusRoute({this.id, this.source, this.destination}) {
    this.name = fullName[this.source] + ' to ' + fullName[this.destination];
  }

  factory BusRoute.fromJSON(Map<String, dynamic> json) {
    return BusRoute(
      id: json['id'],
      source: json['source'],
      destination: json['destination'],
    );
  }
}

class Bpoints {
  final int id;
  final String name;

  Bpoints({this.id, this.name});

  factory Bpoints.fromJSON(Map<String, dynamic> json) {
    return Bpoints(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Bus {
  final int id;
  final String bno;
  final int route;

  Bus({this.id, this.bno, this.route});

  factory Bus.fromJSON(Map<String, dynamic> json) {
    return Bus(id: json['id'], bno: json['bno'], route: json['route']);
  }
}

class BusLoc {
  final double lat;
  final double long;

  BusLoc({this.lat, this.long});

  factory BusLoc.fromJSON(Map<String, dynamic> json) {
    return BusLoc(lat: json['lat'], long: json['long']);
  }
}
