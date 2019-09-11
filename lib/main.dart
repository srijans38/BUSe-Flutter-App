import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';

    List<String> _routes = [
      'Airport to Durg',
      'Durg to Airport',
      'Airport to Railway Station',
      'Railway Station to Airport'
    ];

    String _route = _routes[0];

    List<String> _bpoints = [
      'Tatibandh',
      'D.D.U. Nagar',
      'Bhilai Power House',
      'BIT Durg',
    ];

    String _bpoint = _bpoints[0];

    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: PreferredSize(
          preferredSize: Size(null,100),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Colors.orange,
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BUSe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Icon(Icons.menu, size: 40, color: Colors.white,)
                ],
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.orange,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 70),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Route',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Theme(
                data: ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                  canvasColor: Colors.blueGrey,
                  textSelectionColor: Colors.white,
                ),
                child: FormField(
                  builder: (FormFieldState<String> state){
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Select a route',
                        prefixIcon: Icon(Icons.timeline, color: Colors.white,),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)
                        ),
                      ),
                      child: DropdownButton(
                          value: _route,
                          isDense: true,

                          items: _routes.map((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                  width: MediaQuery.of(context).size.width - 128,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  )
                              ),
                            );
                          }).toList(),
                        onChanged: (String newValue){
                          setState(() {
                            _route = newValue;
                            state.didChange(newValue);
                          });
                        },
                        ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Boarding Point',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Theme(
                data: ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.black,
                  canvasColor: Colors.blueGrey,
                  textSelectionColor: Colors.white,
                ),
                child: FormField(
                  builder: (FormFieldState<String> state){
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Select a boarding point',
                        prefixIcon: Icon(Icons.person_pin_circle, color: Colors.white,),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)
                        ),
                      ),
                      child: DropdownButton(
                        value: _bpoint,
                        isDense: true,

                        items: _bpoints.map((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 128,
                              child: Text(value, style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                          );
                        }).toList(),
                        onChanged: (String newValue){
                          setState(() {
                            _bpoint = newValue;
                            state.didChange(newValue);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              OutlineButton(
                splashColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Find Your Bus',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: (){},
              ),
            ],
          ),
        ),
      );
  }
}

