import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  void addData() {
    var url = Uri.parse("http://192.168.1.14/my_store/adddata.php");

    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD DATA"),
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
                  child: const Text("ADD DATA"),
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
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
