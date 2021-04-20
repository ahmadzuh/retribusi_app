import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
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

  bool isLoading = false;

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
          Container(
            padding: EdgeInsets.only(left: 24.0),
            child: Column(
              children: [
                Text('Detail Tagihan',
                    style: GoogleFonts.openSans(fontSize: 18.0)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 2.0,
                  decoration: BoxDecoration(color: ColorBase.bluebase),
                ),
              ],
            ),
          ),
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
                      child: ListTileShimmer(
                        isDisabledAvatar: true,
                        isDisabledButton: true,
                      ),
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
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrasiTempatScreen(
                                retkel: retkel,
                              ))),
                  title: Text(retkel.nmKelompok),
                  subtitle: Text(retkel.jenisBangunan),
                  trailing: Icon(EvaIcons.arrowCircleRightOutline),
                )),
          );
        },
        itemCount: retkell.length,
      ),
    ));
  }
}
