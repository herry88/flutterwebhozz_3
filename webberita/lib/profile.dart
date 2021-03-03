import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  

  String username = "", email = "";
  getPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      email = preferences.getString("email");
    });
  }
  //eksekusi getPref
  void initState(){
    super.initState();
    getPref();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 32.0,
                ),
                width: 120.0,
                height: 120.0,
                child: CircleAvatar(
                  radius: 100.0,
                  child: Icon(
                    Icons.person,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 45.0,
                      ),
                      title: Text(
                        "Username : $username",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
