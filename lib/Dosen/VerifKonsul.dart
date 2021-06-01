import 'package:flutter/material.dart';

class VerifKonsul extends StatefulWidget {
  VerifKonsul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VerifKonsulState createState() => _VerifKonsulState();
}

class _VerifKonsulState extends State<VerifKonsul> {
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