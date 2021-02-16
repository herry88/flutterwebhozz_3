import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loginapps/halamanutama.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController code = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();

  //function add
  void addData() {
    var url = "http://192.168.42.115/flutterbackend/addData.php";
    http.post(url, body: {
      "item_code": code.text,
      "item_name": name.text,
      "price": price.text,
      "stock": stock.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddData'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: code,
              decoration: InputDecoration(
                hintText: 'Item Code',
                labelText: 'ItemCode',
              ),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'Item Name',
                labelText: 'ItemName',
              ),
            ),
            TextField(
              controller: price,
              decoration: InputDecoration(
                hintText: 'Price',
                labelText: 'Price',
              ),
            ),
            TextField(
              controller: stock,
              decoration: InputDecoration(
                hintText: 'Stock',
                labelText: 'Stock',
              ),
            ),
            RaisedButton(
              child: Text('Simpan Data'),
              color: Colors.blueAccent,
              onPressed: () {
                //function add
                if (code.text.isEmpty) {
                  return Fluttertoast.showToast(msg: 'Code Harus Diisi');
                } else if (name.text.isEmpty) {
                  return Fluttertoast.showToast(msg: 'Name Harus Diisi');
                } else if (price.text.isEmpty) {
                  return Fluttertoast.showToast(msg: 'Price Harus diisi');
                } else if (stock.text.isEmpty) {
                  return Fluttertoast.showToast(msg: 'Stock Harus Diisi');
                } else {
                  return Fluttertoast.showToast(
                    msg: 'Berhasil Disimpan',
                    textColor: Colors.amber,
                  );
                  addData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashBoard(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
