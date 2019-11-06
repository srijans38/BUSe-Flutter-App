import 'package:flutter/material.dart';

class FloatingBox extends StatelessWidget {
  FloatingBox({this.title, this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
      child: RawMaterialButton(
        onPressed: () {},
        constraints: BoxConstraints(
          minHeight: 100,
          minWidth: 200,
        ),
        elevation: 2.0,
        fillColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          //margin: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
          height: 125.0,
          width: 200.0,
//        decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.circular(20.0),
//        ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  size: 30.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    //color: Colors.black.withAlpha(200),
                    //fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Container(
//margin: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
//height: 50.0,
//width: 200.0,
//decoration: BoxDecoration(
//color: Colors.white,
//borderRadius: BorderRadius.circular(20.0),
//),
//child: Padding(
//padding: const EdgeInsets.symmetric(
//vertical: 25.0,
//horizontal: 20.0,
//),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Icon(
//icon,
//size: 30.0,
//color: Colors.black.withAlpha(200),
//),
//],
//),
//),
//);
