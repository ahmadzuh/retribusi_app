import 'package:flutter/material.dart';
import 'package:retribusi_app/ui/widget/custom_appbar.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(title: 'History'),
    );
  }
}
