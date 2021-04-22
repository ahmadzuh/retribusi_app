import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/model/area_model/area_tagih_model.dart';
import '../kelompok_retribusi/kelompok_retribusi_screen.dart';
import '../../../../bloc/providers/user_provider.dart';
import '../../../../network/services/api_services.dart';
import '../../../common/const/color.dart';
import '../../../common/const/dictionary.dart';
import '../../../common/const/font.dart';
import '../../../common/environment/environment.dart';
import '../../../common/util/clock_time.dart';

class TagihanScreen extends StatefulWidget {
  @override
  _TagihanScreenState createState() => _TagihanScreenState();
}

class _TagihanScreenState extends State<TagihanScreen> {
  Webservice webservice;

  //area tagih
  AreaTagih areaTagih;
  List<AreaTagih> areaTagihList;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    webservice = Webservice();
    areaTagih = AreaTagih();
    isLoading = true;
    webservice.areaTagih().then((value) {
      setState(() {
        isLoading = false;
        areaTagihList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              brightness: Brightness.light,
              elevation: 0.0,
              backgroundColor: ColorBase.bluebase,
              title: Row(
                children: <Widget>[
                  Image.asset('${Environment.iconAssets}logo.png',
                      width: 40.0, height: 40.0),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Dictionary.appName,
                            style: TextStyle(
                                fontFamily: FontsFamily.productSans,
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                            maxLines: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Text(
                              Dictionary.appSubtitle,
                              style: TextStyle(
                                  fontFamily: FontsFamily.productSans,
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            body: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                color: ColorBase.bluebase,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(greeting(),
                                        style: GoogleFonts.lato(
                                            fontSize: 29.0,
                                            color: ColorBase.white)),
                                    SizedBox(height: 1.0),
                                    Text(model.name ?? 'Data tidak ada',
                                        style: GoogleFonts.inter(
                                            fontSize: 22.0,
                                            color: ColorBase.white)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.0),
                                      child: Text(dateString,
                                          style: GoogleFonts.lato(
                                              fontSize: 18.0,
                                              color: ColorBase.white)),
                                    ),
                                  ]),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Column(
                      children: [
                        Text('Daftar Tagihan',
                            style: GoogleFonts.openSans(fontSize: 18.0)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 2.0,
                          decoration: BoxDecoration(color: ColorBase.bluebase),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Expanded(
                        child: Container(
                      child: (isLoading)
                          ? Center(
                              child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator.adaptive()
                                ],
                              ),
                            ))
                          : _buildListView(),
                    )),
                  ),
                ],
              ),
            ])));
  }

  Widget _buildListView() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
          AreaTagih areaTagih = areaTagihList[index];
          return Padding(
            padding: EdgeInsets.all(14),
            child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KelompokRetribusiScreen(
                              areaTagih: areaTagih,
                            ))),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                title: Text(areaTagih.nmPasar),
                subtitle: Text(areaTagih.kecamatan.nmKecamatan),
                trailing: Icon(EvaIcons.arrowCircleRightOutline)),
          );
        },
        itemCount: areaTagihList.length,
      ),
    ));
  }
}
