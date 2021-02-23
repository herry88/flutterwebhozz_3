import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List bytes = Uint8List(0);
  TextEditingController text_1 = TextEditingController();
  TextEditingController text_2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.text_1 = TextEditingController();
    this.text_2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate Barcode',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Please Input Your Code',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Ouput Your Code',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            this._button(),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    //widget terpisah
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 120.0,
            child: InkWell(
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'images/generate_qrcode.png',
                      ),
                    ),
                    Divider(
                      height: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Generate',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
