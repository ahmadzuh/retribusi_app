import 'package:flutter/material.dart';

import '../../../bloc/view_model/area_tagih_model.dart';
import '../../../bloc/view_model/kelompok_retribusi_model.dart';
import '../../../network/services/api_services.dart';
import '../../common/util/toast_util.dart';
import '../../widget/custom_appbar.dart';

class KelompokRetribusi extends StatefulWidget {
  final AreaTagih areaTagih;
  final Retkel retkel;
  KelompokRetribusi({this.areaTagih, this.retkel});

  @override
  _KelompokRetribusiState createState() => _KelompokRetribusiState();
}

class _KelompokRetribusiState extends State<KelompokRetribusi> {
  Webservice webservice;

  @override
  void initState() {
    super.initState();
    webservice = Webservice();
  }

  @override
  Widget build(BuildContext context) {
    int id;
    String nmKelompok;
    String jenisBangunan;
    Retkel retkel =
        Retkel(id: id, nmKelompok: nmKelompok, jenisBangunan: jenisBangunan);

    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
          title: widget.areaTagih == null
              ? 'Detail Tagihan'
              : widget.areaTagih.kecamatan.nmKecamatan),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: webservice.kelompokRetribusi(retkel),
            builder:
                (BuildContext context, AsyncSnapshot<List<Retkel>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<Retkel> retkel = snapshot.data;
                return _buildListView(retkel);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<Retkel> retkell) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Retkel retkel = retkell[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      retkel.nmKelompok,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            ToastUtils.show(retkel.id.toString());
                          },
                          child: Text(
                            "Lihat",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: retkell.length,
      ),
    ));
  }
}
