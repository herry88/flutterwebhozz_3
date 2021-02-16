import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'add.dart';
import 'detail.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.42.115/flutterbackend/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySTORE'),
      ),
      
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        onPressed: (){
          //kosongin dulu
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> AddData(),

          ),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          child: GestureDetector(
            onTap: () {
              //mengarahkan ke detail
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Detail(list:list, index: i),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(list[i]['item_name']),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png',
                  ),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                subtitle: Text("Stock : ${list[i]['stock']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
