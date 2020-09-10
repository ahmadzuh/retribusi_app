import 'package:flutter/material.dart';
import 'package:retribusi_app/bloc/view_model/area_tagih_model.dart';

class KelompokRetribusi extends StatefulWidget {
  final AreaTagih areaTagih;
  KelompokRetribusi({this.areaTagih});

  @override
  _KelompokRetribusiState createState() => _KelompokRetribusiState();
}

class _KelompokRetribusiState extends State<KelompokRetribusi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('rr'),
        ),
      ),
    );
  }
}
