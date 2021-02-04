import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Dadu'),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //deklarasikan variabel
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  //membuat fungsi untuk merubah angka dadu secara random
  void rubahDice(){
    setState(() {
      leftDiceNumber = Random().nextInt(6)+1;
      rightDiceNumber = Random().nextInt(6) +1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                rubahDice();
              },
              child: Image.asset(
                //untuk menampilkan data gambar sesuai dengan deklarasi variabel
                'images/dice$leftDiceNumber.png',
              ),
            ),
          ),
          Expanded(child: FlatButton(
            onPressed: (){
              rubahDice();
            },
            child: Image.asset('images/dice$rightDiceNumber.png'),
          )),
          
        ],
      ),
    );
  }
}
