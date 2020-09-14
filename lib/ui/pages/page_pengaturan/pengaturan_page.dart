import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
import 'package:retribusi_app/ui/common/const/font.dart';
import 'package:retribusi_app/ui/common/environment/environment.dart';
import 'package:retribusi_app/ui/common/route/router.gr.dart';
import 'package:retribusi_app/ui/widget/custom_appbar.dart';

class Pengaturan extends StatefulWidget {
  @override
  _PengaturanState createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    final userLogOut = Provider.of<UserProvider>(context);
    final userData = Provider.of<UserProvider>(context);
    return Scaffold(
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
                            userData.email,
                            style: TextStyle(
                                    color: ColorBase.veryDarkGrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontsFamily.latoLight) ??
                                'Tidak ada data',
                          ),
                        ),
                        Container(
                          height: 30.0,
                          child: Text(userData.name,
                                  style: TextStyle(
                                      color: ColorBase.veryDarkGrey,
                                      fontSize: 14,
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
                      fontSize: 12,
                      fontFamily: FontsFamily.latoLight)),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  height: 20,
                                  child: Image.asset(
                                      '${Environment.iconAssets}toko.png')),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Edit Akun',
                                style: TextStyle(
                                    color: ColorBase.veryDarkGrey,
                                    fontSize: 12,
                                    fontFamily: FontsFamily.latoLight),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: ColorBase.darkGrey,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorBase.darkGrey,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.apps),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Versi Aplikasi',
                              style: TextStyle(color: ColorBase.darkGrey),
                            ),
                          ],
                        ),
                        Text(
                          '1.0',
                          style: TextStyle(color: ColorBase.darkGrey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.white,
                onPressed: () {
                  userLogOut.signOut();
                  Navigator.pushNamed(context, Routes.loginScreen);
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
        ));
  }
}
