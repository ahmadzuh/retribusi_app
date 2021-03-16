import 'package:flutter/material.dart';
import '../../../../bloc/view_model/area_model/area_tagih_model.dart';
import '../../../../bloc/view_model/kelompok_model/kelompok_retribusi_model.dart';
import '../../../../network/services/api_services.dart';
import '../registrasi_tempat/registrasi_tempat_screen.dart';
import '../../../widget/custom_appbar.dart';

class KelompokRetribusiScreen extends StatefulWidget {
  final AreaTagih areaTagih;
  final Retkel retkel;
  KelompokRetribusiScreen({this.areaTagih, this.retkel});

  @override
  _KelompokRetribusiState createState() => _KelompokRetribusiState();
}

class _KelompokRetribusiState extends State<KelompokRetribusiScreen> {
  Webservice webservice;
  Retkel retkel;
  AreaTagih areaTagih;

  @override
  void initState() {
    super.initState();
    webservice = Webservice();
    retkel = Retkel();
    areaTagih = widget.areaTagih;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
          title: widget.areaTagih == null
              ? 'Detail Tagihan'
              : widget.areaTagih.nmPasar),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Detail Tagihan',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: webservice.kelompokRetribusi(areaTagih.id),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Retkel>> snapshot) {
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
        ],
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
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(),
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
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrasiTempatScreen(
                                            retkel: retkel,
                                          )));
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
            ),
          );
        },
        itemCount: retkell.length,
      ),
    ));
  }
}
