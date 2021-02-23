import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';


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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
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
  var c = '';
  TextEditingController _inputController = TextEditingController();
  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    // var c = '${barcode.toString()}';
    if(barcode == null){
      print('tidak ada data');
    } else {
      // this.text = text;
    this._inputController.text = barcode;
    }
    setState(() {
       c = '${barcode.toString()}';
    });
  }

  void initState(){
    super.initState();
    _scan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qrcode'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(c),
            SizedBox(
              height: 20.0,
            ),
            // TextField(
            //   controller: this._inputController,
            // ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Press'),
              onPressed: ()  {
                // //ketika di klil muncul kalimat yg di scan
                // await Permission.camera.request();
                // // text = await scanner.scan();
                _scan();
                setState(() {
                  //
                  // this.text = text;
                });
              },
            ),
            // InkWell(
            //   onTap: _scan,
            //   child: Card(
            //     child: Column(
            //       children: [
            //         Text(
            //          'Tekan',
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}