import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  List list; 
  int index;
  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController code = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();

  void editData(){
    var url = "http://192.168.42.115/flutterbackend/editData.php";
    http.post(url, body: {
      "id":widget.list[widget.index]['id'],
      "item_code": code.text,
      "item_name": name.text,
      "price": price.text,
      "stock": stock.text,
    });
  }

  void initState(){
    code = TextEditingController(text: widget.list[widget.index]['item_code']);
    name = TextEditingController(text: widget.list[widget.index]['item_name']);
    price = TextEditingController(text: widget.list[widget.index]['price']);
    stock = TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
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
                //function edit
                editData();
               
              },
            ),
          ],
        ),
      ),
    );
  }

}