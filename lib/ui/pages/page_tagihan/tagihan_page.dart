import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/network/services/services.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
import 'package:retribusi_app/ui/common/environment/environment.dart';
import 'package:retribusi_app/ui/common/util/clock_time.dart';

class Tagihan extends StatefulWidget {
  @override
  _TagihanState createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  @override
  Widget build(BuildContext context) {
    Areatagih().areaTagih().then((value) => print("value: $value"));
    final userData = Provider.of<UserProvider>(context);
    return Scaffold(
        body: new Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.16,
        color: ColorBase.bluebase,
      ),
      SizedBox(height: 5.0),
      ListView(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.transparent,
            height: 150.0,
            child: Container(
                padding: EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                                image: AssetImage(
                                    '${Environment.iconAssets}logo.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 5.0),
                            Text(greeting(),
                                style: GoogleFonts.openSans(fontSize: 20.0)),
                            SizedBox(height: 1.0),
                            Text(userData.name ?? 'Data tidak ada',
                                style: GoogleFonts.openSans(fontSize: 16.0)),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text(dateString,
                                  style: GoogleFonts.openSans(fontSize: 14.0)),
                            ),
                          ]),
                    ])),
          ),
          Container(
            padding: EdgeInsets.only(left: 22, top: 10.0, right: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Daftar Tagihan', style: GoogleFonts.lato(fontSize: 18.0)),
                Text('Selengkapnya',
                    style:
                        GoogleFonts.lato(fontSize: 12.0, color: Colors.blue)),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      )
    ]));
  }
}
