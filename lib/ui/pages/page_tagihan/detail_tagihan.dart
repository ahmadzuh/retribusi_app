import 'package:flutter/material.dart';
import 'package:retribusi_app/bloc/view_model/area_tagih_model.dart';
import 'package:retribusi_app/bloc/view_model/kelompok_retribusi_model.dart';
import 'package:retribusi_app/ui/common/environment/environment.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/kelompok_retribusi.dart';

class TagihanDetail extends StatefulWidget {
  final AreaTagih areaTagih;
  final Datum datum;
  TagihanDetail({this.areaTagih, this.datum});

  @override
  _TagihanDetailState createState() => _TagihanDetailState();
}

class _TagihanDetailState extends State<TagihanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
        widget.areaTagih == null ? 'Form Detail' : widget.areaTagih.nmPasar,
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: ListTile(
                leading: Image.asset('${Environment.iconAssets}toko.png'),
                title: Text(widget.areaTagih.nmPasar) ?? null,
                subtitle: Text(widget.areaTagih.nmPasar.toString()),
                isThreeLine: true,
                onTap: () async {
                  var result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return KelompokRetribusi();
                  }));
                  if (result != null) {
                    setState(() {});
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
