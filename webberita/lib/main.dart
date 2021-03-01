import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.red,
          ),
        ),
      ),
    ),
  );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Form(
        child: Container(
          margin: EdgeInsets.all(32.0),
          padding: EdgeInsets.only(
            top: 32.0,
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          child: Column(
            children: [
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Welcome back\nPlease Login to your Account',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                height: 40.0,
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    //
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
