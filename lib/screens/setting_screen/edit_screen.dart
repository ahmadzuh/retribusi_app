import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Akun'),
      ),
      body: Center(
          child: Container(
        child: Text('Edit Screen'),
      )),
    );
  }
}
