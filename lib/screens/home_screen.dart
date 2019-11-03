import 'package:buse_test/utils/floating_box.dart';
import 'package:buse_test/utils/select_fab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Container(
        width: MediaQuery.of(context).size.width,
        //height: 300,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        color: Colors.orangeAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.menu,
              size: 35.0,
              color: Colors.transparent,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'BUSe',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Montserrat'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'The best way to find your bus.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FloatingBox(
                    icon: Icons.info_outline,
                    title: 'About BUSe',
                  ),
                  FloatingBox(
                    icon: Icons.map,
                    title: 'Live Map',
                  ),
                  FloatingBox(
                    icon: Icons.people_outline,
                    title: 'Our Team',
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: SelectFAB(),
            ),
          ],
        ),
      ),
    );
  }
}
