import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Dropdown',
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Deklarasi Variabel
  String _valGender;
  String _valFriends;
  List _listGender = ["Male", "Female"];
  List _myFriends = [
    "Dono",
    "Kasino",
    "Indro",
    "Bokir",
    "lilik",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Dropdown'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton(
              itemHeight: 9.0,
              hint: Text('Pilih Teman Kamu :'),
              value: _valFriends,
              items: _myFriends.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  //untuk memberitahu _valFriends bahwa isinya akan diubah
                  _valFriends = value;
                });
              },
            ),
            DropdownButton(
              hint: Text('Select Gender :'),
              value: _valGender,
              items: _listGender.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  //untuk memberitahu _valFriends bahwa isinya akan diubah
                  _valGender = value;
                });
              },
            ),
            Text(
              'Teman Saya adalah $_valFriends, yang bergender $_valGender',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
