import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/bloc/view_model/area_tagih_model.dart';
import 'package:retribusi_app/network/services/api_services.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
import 'package:retribusi_app/ui/common/const/dictionary.dart';
import 'package:retribusi_app/ui/common/const/font.dart';
import 'package:retribusi_app/ui/common/environment/environment.dart';
import 'package:retribusi_app/ui/common/util/clock_time.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/detail_tagihan.dart';

class Tagihan extends StatefulWidget {
  @override
  _TagihanState createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  Webservice webservice;

  @override
  void initState() {
    super.initState();
    webservice = Webservice();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context);
    return Scaffold(
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
        body: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: ColorBase.bluebase,
          ),
          Column(
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
                                        fontSize: 28.0,
                                        color: ColorBase.white)),
                                SizedBox(height: 1.0),
                                Text(userData.name ?? 'Data tidak ada',
                                    style: GoogleFonts.inter(
                                        fontSize: 19.0,
                                        color: ColorBase.white)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(dateString,
                                      style: GoogleFonts.lato(
                                          fontSize: 15.0,
                                          color: ColorBase.white)),
                                ),
                              ]),
                        ),
                      ]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 24, right: 23.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Daftar Tagihan',
                        style: GoogleFonts.openSans(fontSize: 18.0)),
                  ],
                ),
              ),
              Container(
                child: Expanded(
                  child: FutureBuilder(
                    future: webservice.areaTagih(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<AreaTagih>> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error.toString()}"),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        List<AreaTagih> profiles = snapshot.data;
                        return _buildListView(profiles);
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
        ]));
  }

  Widget _buildListView(List<AreaTagih> areatagihs) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            AreaTagih areaTagih = areatagihs[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.14,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          '${Environment.iconAssets}toko.png',
                          scale: 8.0,
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                  areaTagih.nmPasar,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ) ??
                                null,
                            Text(areaTagih.kecamatan.nmKecamatan),
                            SizedBox(height: 20.0),
                          ],
                        ),
                        SizedBox(width: 2.0),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: FlatButton(
                            onPressed: () async {
                              var result = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TagihanDetail(areaTagih: areaTagih);
                              }));
                              if (result != null) {
                                setState(() {});
                              }
                            },
                            child: Text(
                              "Selengkapnya",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: areatagihs.length,
        ),
      ),
    );
  }
}
