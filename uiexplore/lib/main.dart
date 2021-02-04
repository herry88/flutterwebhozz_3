import 'package:flutter/material.dart';
import 'package:uiexplore/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bekasi',
      theme: ThemeData.dark(),
      home: DetailUi(),
      debugShowCheckedModeBanner: false,
    );
  }
}