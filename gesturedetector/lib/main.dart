import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Gesture Detector',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _title;

  void initState() {
    super.initState();
    _title = "GestureDetector";
  }

  void _changeTitle(String title) {
    setState(() {
      _title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          GestureDetector(
            //untuk onTap
            onTap: () {
              //function
              _changeTitle('on tap  di klik');
            },
            child: _buildItem(
              'Klik Saya',
            ),
          ),
          GestureDetector(
            onDoubleTap:(){
              _changeTitle('OnDoubleTap');
            },
            child: _buildItem('Klik Double Tap'),
          ),
          GestureDetector(
            onLongPress:(){
              _changeTitle('onLongPress Diklik');
            },
            child: _buildItem('klik longPress'),
          ),
          GestureDetector(
            onVerticalDragDown: (dragDetails){
              _changeTitle('VerticalDrag Diklik');
            },
            child: _buildItem('Click Dengan Vertical Drag'),
          ),
          GestureDetector(
            onScaleEnd: (ScaleStartDetails){
              _changeTitle('Scale Diklik');
            },
            child: _buildItem('Klik scale'),

          ),
          
        ],
      ),
    );
  }
}

Widget _buildItem(String title) {
  return Container(
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(8.0),
    color: Colors.blue,
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
