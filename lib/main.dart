import 'package:apitest/apitest.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Newapp());
}

class Newapp extends StatefulWidget {
  const Newapp({Key? key}) : super(key: key);

  @override
  State<Newapp> createState() => _NewappState();
}

class _NewappState extends State<Newapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataFromApi(),
    );
  }
}
