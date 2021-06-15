import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../constants/base_color.dart';
import '../../helpers/profile_preferences.dart';
import '../../components/app_theme.dart';
import '../../components/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  //ThemeData
  ThemeData themeData;
  String name;

  _getProfile() async {
    String nm = await ProfilePreference.getProfile();
    setState(() {
      name = nm;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    return Scaffold(
      key: _key,
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
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      fontWeight: 600, color: Colors.black)),
            ],
          ),
          ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Pasar'),
            subtitle:
                Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(EvaIcons.activity),
            isThreeLine: true,
          )
        ],
      ),
    );
  }
}
