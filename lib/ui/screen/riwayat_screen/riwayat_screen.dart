import 'package:flutter/material.dart';
import '../../widget/custom_appbar.dart';

class RiwayatScreen extends StatefulWidget {
  @override
  _RiwayatScreenState createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(title: 'Riwayat'),
      body: Container(
        child: Center(
          child: Text('Riwayat'),
        ),
      ),
    );
  }
}
