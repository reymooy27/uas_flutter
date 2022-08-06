import 'package:flutter/material.dart';

class Kelompok extends StatelessWidget {
  const Kelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kelompok 1"),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Padding(
              padding: EdgeInsets.all((30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1. Rona A.B.L. Mooy',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '(198111017)',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2. Novrianus Fankari',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '(198111015)',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3. Debriana Beri',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '(198111006)',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
