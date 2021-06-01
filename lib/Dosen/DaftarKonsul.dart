import 'package:flutter/material.dart';

class DaftarKonsul extends StatefulWidget {
  DaftarKonsul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DaftarKonsulState createState() => _DaftarKonsulState();
}

class _DaftarKonsulState extends State<DaftarKonsul> {
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