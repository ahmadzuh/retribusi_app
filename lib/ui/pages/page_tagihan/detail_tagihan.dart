import 'package:flutter/material.dart';
import 'package:retribusi_app/bloc/viewModel/area_tagih_model.dart';

class TagihanDetail extends StatefulWidget {
  AreaTagih areaTagih;

  TagihanDetail({this.areaTagih});

  @override
  _TagihanDetailState createState() => _TagihanDetailState();
}

class _TagihanDetailState extends State<TagihanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.areaTagih == null ? 'Form Detail' : widget.areaTagih.nmPasar,
      )),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(widget.areaTagih.nmPasar)],
          ),
        ),
      ),
    );
  }
}
