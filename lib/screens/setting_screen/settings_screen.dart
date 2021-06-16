import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/loading_dialog.dart';
import '../../helpers/profile_preferences.dart';
import '../../bloc/signin_bloc/signin_bloc.dart';
import '../../bloc/signin_bloc/signin_event.dart';
import '../../constants/base_color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();

  String nama, email;

  _getProfile() async {
    String nm = await ProfilePreference.getProfile();
    String em = await ProfilePreference.getEmail();
    setState(() {
      nama = nm;
      email = em;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  //themeData
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 98.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.0,
                          child: Text(
                            nama ?? '...',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 30.0,
                          child: Text(
                            email ?? '...',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
              child: Container(
                color: BaseColor.grey1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text('Akun',
                  style: TextStyle(
                      color: BaseColor.grey1,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/editScreen');
                      },
                      child: ListTile(
                        leading: Icon(EvaIcons.personOutline),
                        title: Text('Edit Akun',
                            style: TextStyle(color: BaseColor.veryDarkGrey)),
                        trailing: Icon(EvaIcons.arrowIosForwardOutline),
                      ),
                    ),
                    ListTile(
                      leading: Icon(EvaIcons.smartphoneOutline),
                      title: Text('Versi Aplikasi',
                          style: TextStyle(color: BaseColor.veryDarkGrey)),
                      trailing:
                          Text('1.0 (Beta)', style: TextStyle(fontSize: 16.0)),
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
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        print('dialog');
                        return AlertDialog(
                          title: Text('Keluar'),
                          content: Text('Apakah anda ingin keluar?'),
                          actions: [
                            FlatButton(
                              child: Text('Ya'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                BlocProvider.of<SignInBloc>(context)
                                    .add(SignOutBtnPressed());
                                loadingDialog(
                                    context: context, msg: 'Keluar..');
                                Future.delayed(Duration(seconds: 2), () {
                                  print('after dialog');

                                  Navigator.pushNamedAndRemoveUntil(context,
                                      '/loginScreen', (route) => false);
                                });
                              },
                            ),
                            FlatButton(
                              child: Text('Tidak'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            'KELUAR',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )),
                          SizedBox(width: 5.0),
                          Icon(EvaIcons.logOutOutline, color: Colors.red)
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
