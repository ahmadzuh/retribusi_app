import 'package:flutter/material.dart';

import '../../widget/custom_appbar.dart';

class Setoran extends StatefulWidget {
  @override
  _SetoranState createState() => _SetoranState();
}

class _SetoranState extends State<Setoran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(title: 'Setoran'),
    );
  }
}
