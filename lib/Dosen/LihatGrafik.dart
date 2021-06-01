import 'package:flutter/material.dart';

class LihatGrafik extends StatefulWidget {
  LihatGrafik({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LihatGrafikState createState() => _LihatGrafikState();
}

class _LihatGrafikState extends State<LihatGrafik> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(widget.title),
        ),
        body: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          ),
        )
    );
  }
}