import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  const EditData({Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;

  void editData() {
    var url = Uri.parse("http://192.168.1.14/my_store/editdata.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  void initState() {
    controllerCode =
        TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName =
        TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice =
        TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock =
        TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT DATA"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerCode,
                  decoration: const InputDecoration(
                      hintText: "Item Code", labelText: "Item Code"),
                ),
                TextField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                      hintText: "Item Name", labelText: "Item Name"),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration: const InputDecoration(
                      hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: controllerStock,
                  decoration: const InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                  child: const Text("EDIT DATA"),
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyApp()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
