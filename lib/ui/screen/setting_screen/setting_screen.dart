import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';

import '../../../bloc/providers/user_provider.dart';
import '../../common/const/color.dart';
import '../../common/const/font.dart';
import '../../widget/custom_appbar.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar.defaultAppBar(title: 'Akun'),
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 98,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 30.0,
                            child: Text(
                              model.email,
                              style: TextStyle(
                                      color: ColorBase.veryDarkGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FontsFamily.latoLight) ??
                                  'Tidak ada data',
                            ),
                          ),
                          Container(
                            height: 30.0,
                            child: Text(model.name,
                                    style: TextStyle(
                                        color: ColorBase.veryDarkGrey,
                                        fontSize: 20,
                                        fontFamily: FontsFamily.latoLight)) ??
                                'Tidak ada data',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
                child: Container(
                  color: ColorBase.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text('Akun',
                    style: TextStyle(
                        color: ColorBase.darkGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: FontsFamily.latoLight)),
              ),
              Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Column(children: <Widget>[
                      ListTile(
                        leading: Icon(EvaIcons.person),
                        title: Text('Edit Akun'),
                        trailing: Icon(EvaIcons.arrowIosForwardOutline),
                      ),
                      ListTile(
                        leading: Icon(EvaIcons.smartphoneOutline),
                        title: Text('Versi Aplikasi'),
                        trailing:
                            Text('1.0.0', style: TextStyle(fontSize: 16.0)),
                      ),
                    ]),
                  )),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: OutlinedButton(
                  onPressed: () async {
                    model.signOut();
                    Navigator.of(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainApp()),
                    );
                    print("Signed out.");
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                          'KELUAR',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontsFamily.latoLight),
                        ))),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
