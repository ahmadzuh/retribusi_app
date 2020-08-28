import 'package:flutter/material.dart';
import 'package:retribusi_app/network/services/services.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    Webservice().areaTagih().then((value) => print("value: $value"));
    return Scaffold(
      body: Container(),
    );
  }
}
