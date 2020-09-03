import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/bloc/viewModel/area_tagih_model.dart';
import 'package:retribusi_app/network/services/services.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
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
        body: new Stack(children: <Widget>[
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
                                    fontSize: 28.0, color: ColorBase.white)),
                            SizedBox(height: 1.0),
                            Text(userData.name ?? 'Data tidak ada',
                                style: GoogleFonts.inter(
                                    fontSize: 19.0, color: ColorBase.white)),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text(dateString,
                                  style: GoogleFonts.lato(
                                      fontSize: 15.0, color: ColorBase.white)),
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
                      child: Text(
                          "Something wrong with message: ${snapshot.error.toString()}"),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          AreaTagih areaTagih = areatagihs[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.19,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                            areaTagih.nmPasar,
                            style: Theme.of(context).textTheme.subtitle1,
                          ) ??
                          null,
                      Text(areaTagih.id.toString()) ?? null,
                      SizedBox(height: 2.0),
                      Text(areaTagih.kecamatanId.toString()) ?? null,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
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
                          // FlatButton(
                          //   onPressed: () {
                          //     // TODO: do something in here
                          //   },
                          //   child: Text(
                          //     "Edit",
                          //     style: TextStyle(color: Colors.blue),
                          //   ),
                          // ),
                        ],
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
    );
  }
}
