import 'package:flutter/material.dart';
import 'package:retribusi_app/constants/base_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/app_theme.dart';
import '../../components/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ThemeData
  ThemeData themeData;
  String name;

  @override
  void initState() {
    super.initState();
    ProfilePreference();
  }

  // ignore: non_constant_identifier_names
  ProfilePreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = (preferences.getString('name') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: Spacing.only(left: 20, top: 20, right: 20),
        child: ListView(children: [
          _useProfile(),
          SizedBox(height: 10.0),
          _listTagihan(),
          SizedBox(height: 10.0),
          
        ]),
      ),
    );
  }

  _useProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang',
              style: AppTheme.getTextStyle(
                themeData.textTheme.headline6,
              ),
            ),
            Text(name ?? '...',
                style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                    color: BaseColor.limeGreen, fontWeight: 700)),
          ],
        )
      ],
    );
  }

  _listTagihan() {
    return Container(
      padding: Spacing.only(top: 20, bottom: 20),
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('List Tagihan',
                  style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                      fontWeight: 700, color: Colors.black)),
            ],
          )
        ],
      ),
    );
  }
}
