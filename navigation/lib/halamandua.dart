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
              color: Colors.green,
              onPressed: () {
                //ketika text masih kosong
                if (_eTitle.text.isEmpty) {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            'Judul Harus Diisi',
                          ),
                        );
                      });
                } else if (_eDeskripsi.text.isEmpty) {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            'Deskripsi Harus Diisi',
                          ),
                        );
                      });
                } else {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            'Judulnya adalah ' +
                                _eTitle.text +
                                'Deskripsi' +
                                _eDeskripsi.text,
                          ),
                        );
                      });
                }
              },
              child: Text('Submit'),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
