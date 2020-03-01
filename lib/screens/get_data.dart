import 'dart:async';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Future<Position> fetchCurrentLoc() async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return position;
}

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

Future<List<Placemark>> fetchPlacemark(double lat, double long) async {
  List<Placemark> placemark =
      await Geolocator().placemarkFromCoordinates(lat, long);
  return placemark;
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
  final geocode = await http.get('https://maps.googleapis.com/maps/api/geocode/json?latlng=${busLoc.lat},${busLoc.long}&key=AIzaSyCqPxIandJcCL4SqyRh8Q0Cm5nK7RZnVF4');
  final address = json.decode(geocode.body)['results'][0]['address_components'];
  final address_show = address[0]['long_name'].toString() + ', ' +  address[1]['long_name'].toString();
  busLoc.address = address_show;
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
  String address;

  BusLoc({this.lat, this.long, this.address});

  factory BusLoc.fromJSON(Map<String, dynamic> json) {
    return BusLoc(lat: json['lat'], long: json['long']);
  }
}
