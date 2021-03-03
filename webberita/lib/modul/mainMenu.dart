import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webberita/home/home.dart';
import 'package:webberita/modul/mod_categori/categori.dart';
import 'package:webberita/profile.dart';

import 'mod_berita /news.dart';

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;
  MainMenu(this.signOut);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String username = "", email = "";
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      email = preferences.getString("email");
    });
  }

  //eksekusi getpref
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('data'),
          actions: [
            IconButton(
              onPressed: () {
                signOut();
              },
              icon: Icon(
                Icons.lock_open,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [
            Home(),
            News(),
            Category(),
            Profile(),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(
                Icons.new_releases,
              ),
              text: "News",
            ),
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: "Category",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "Profile",
            )
          ],
        ),
      ),
    );
  }
}
