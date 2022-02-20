// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()), // use MaterialApp
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late double firstInput;
  late double secondInput;
  double result = 0;

  void calculate(String button) {
    setState(() {
      firstInput = double.parse(inputAngkaSatuController.text);
      secondInput = double.parse(inputAngkaDuaController.text);

      if (button.contains("*")) {
        result = firstInput * secondInput;
      } else if (button.contains("/")) {
        result = firstInput / secondInput;
      } else if (button.contains("+")) {
        result = firstInput + secondInput;
      } else if (button.contains("-")) {
        result = firstInput - secondInput;
      }
    });
  }

  TextEditingController inputAngkaSatuController = TextEditingController();
  TextEditingController inputAngkaDuaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HasilHitung(result: result),
            InputAngka(
                inputAngkaSatuController: inputAngkaSatuController,
                inputAngkaDuaController: inputAngkaDuaController),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                        width: 180.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.blue.shade200, Colors.blue]),
                              borderRadius: BorderRadius.circular(12)),
                          child: ElevatedButton(
                            onPressed: () {
                              calculate("*");
                            },
                            child: const Text(
                              "X",
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 20.0),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(12.0))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                        width: 180.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.blue.shade200, Colors.blue]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              calculate("/");
                            },
                            child: const Text(
                              "/",
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 20.0),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(12.0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                          width: 180.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade200,
                                  Colors.blue
                                ]),
                                borderRadius: BorderRadius.circular(12)),
                            child: ElevatedButton(
                              onPressed: () {
                                calculate("+");
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 20.0),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(12.0))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 180.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade200,
                                  Colors.blue
                                ]),
                                borderRadius: BorderRadius.circular(12)),
                            child: ElevatedButton(
                              onPressed: () {
                                calculate("-");
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 20.0),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(12.0))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputAngka extends StatelessWidget {
  const InputAngka({
    Key? key,
    required this.inputAngkaSatuController,
    required this.inputAngkaDuaController,
  }) : super(key: key);

  final TextEditingController inputAngkaSatuController;
  final TextEditingController inputAngkaDuaController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          child: TextField(
            controller: inputAngkaSatuController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(242, 242, 242, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Input Pertama"),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: TextField(
            controller: inputAngkaDuaController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(242, 242, 242, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Input Kedua"),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class HasilHitung extends StatelessWidget {
  const HasilHitung({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hasil Perhitungan : $result",
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}
