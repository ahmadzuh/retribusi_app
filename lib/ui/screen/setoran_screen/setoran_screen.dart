import 'package:flutter/material.dart';
import '../../widget/custom_appbar.dart';

class SetoranScreen extends StatefulWidget {
  @override
  _SetoranScreenState createState() => _SetoranScreenState();
}

class _SetoranScreenState extends State<SetoranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(title: 'Setoran'),
      body: Container(
        child: Center(
          child: Container(
            child: Text('Setoran'),
          ),
        ),
      ),
    );
  }
}
