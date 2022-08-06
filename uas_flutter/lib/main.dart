import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_flutter/kelompok.dart';
import './detail.dart';
import './adddata.dart';

void main() {
  runApp(const MaterialApp(
    title: "My Store",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> getData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.14/my_store/getdata.php'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY STORE"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const Kelompok(),
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const AddData(),
        )),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data ?? [],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  const ItemList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Detail(
                      list: list,
                      index: i,
                    ))),
            child: Card(
              child: ListTile(
                title: Text(list[i]['item_name']),
                leading: const Icon(Icons.widgets),
                subtitle: Text("Stock : ${list[i]['stock']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
