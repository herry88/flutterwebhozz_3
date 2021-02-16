import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'halamanutama.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  //untuk constructor
  Detail({this.list, this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  //function delete data
  void deleteData() {
    var url = "http://192.168.42.115/flutterbackend/delete.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        'Apakah Anda yakin untuk hapus ${widget.list[widget.index]['item_name']}',
      ),
      // content: Text("Apakah Anda yakin untuk hapus ${widget}"),
      actions: [
        RaisedButton(
          child: Text(
            'Ok Delete',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () {
            deleteData();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DashBoard(),
              ),
            );
          },
        ),
        RaisedButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['item_name']}"),
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                ),
              ),
              Text(
                widget.list[widget.index]['item_name'],
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Code : ${widget.list[widget.index]['item_code']}",
              ),
              Text(
                "Price : ${widget.list[widget.index]['price']}",
              ),
              Text(
                "Stock : ${widget.list[widget.index]['stock']}",
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RaisedButton(
                    child: Text('Edit'),
                    onPressed: () {
                      //untuk edit
                    },
                    color: Colors.green,
                  ),
                  RaisedButton(
                    child: Text('Delete'),
                    onPressed: () => confirm(),
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
