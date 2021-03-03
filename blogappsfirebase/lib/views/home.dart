import 'dart:ui';

import 'package:blogappsfirebase/views/createblog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Flutter',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            Text(
              'Blog',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22.0,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateBlog(),
            ),
          );
        },
      ),
    );
  }
}
