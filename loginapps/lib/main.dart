import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'halamanutama.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Deklarasikan Variabel
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  //function login
  Future login() async {
    //deklarasikan variabel url api
    var url = "http://192.168.42.115/flutterbackend/login.php";
    var response = await http.post(url, body: {
      //sesuai dengan field di table
      "username": user.text,
      "password": pass.text
    });
    var data = json.decode(response.body);
    //membuat sebuah validasi
    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Login Berhasil",
        fontSize: 16.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Username Dan Password Salah atau tidak aktif",
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login SignUp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: 300.0,
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  controller: user,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  controller: pass,
                ),
              ),
              Row(
                children: [
                  MaterialButton(
                    color: Colors.pink,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //function login
                      login();
                    },
                  ),
                  MaterialButton(
                    color: Colors.pink,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //function Register
                      Navigator.push(context, MaterialPage(builder:(context)=>Register()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
