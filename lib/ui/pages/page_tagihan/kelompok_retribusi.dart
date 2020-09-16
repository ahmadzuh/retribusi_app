import 'package:flutter/material.dart';

import '../../../bloc/view_model/area_tagih_model.dart';
import '../../../bloc/view_model/kelompok_retribusi_model.dart';

class KelompokRetribusi extends StatefulWidget {
  final Datum datum;
  KelompokRetribusi({this.datum, AreaTagih areaTagih});

  @override
  _KelompokRetribusiState createState() => _KelompokRetribusiState();
}

class _KelompokRetribusiState extends State<KelompokRetribusi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text('Data tidak ada'),
        ),
      ),
    );
  }
}
