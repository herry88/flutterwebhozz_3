import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController _eTitle = TextEditingController();
  TextEditingController _eDeskripsi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Dua'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.message,
                  ),
                  hintText: 'Input Judul'),
              controller: _eTitle,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.message,
                ),
                hintText: 'Input Deskrpsi',
              ),
              controller: _eDeskripsi,
            ),
            SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
