import 'package:flutter/material.dart';
import 'package:uas_flutter/main.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({required this.index, required this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = Uri.parse("http://192.168.1.14/my_store/deleteData.php");
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Anda yakin ingin menghapus'),
        // content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              deleteData();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const MyApp(),
              ));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['item_name']}"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Text(
                  widget.list[widget.index]['item_name'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Code : ${widget.list[widget.index]['item_code']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Price : ${widget.list[widget.index]['price']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Stock : ${widget.list[widget.index]['stock']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text("EDIT"),
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => EditData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                      child: const Text("DELETE"),
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
