import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  //untuk constructor
  Detail({this.list, this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
                    onPressed: () {
                      //untuk delete
                    },
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
