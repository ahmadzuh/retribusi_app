import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
import 'package:retribusi_app/ui/common/const/dictionary.dart';
import 'package:retribusi_app/ui/common/environment/environment.dart';
import 'package:retribusi_app/ui/pages/page_history/history_page.dart';
import 'package:retribusi_app/ui/pages/page_setoran/setoran_page.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/tagihan_page.dart';
import 'package:retribusi_app/ui/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final _widgetOptions = [
    Tagihan(),
    Setoran(),
    History(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorBase.bluebase,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset('${Environment.iconAssets}logo.png',
                    width: 40.0, height: 40.0),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(Dictionary.appName,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(Dictionary.appSubtitle,
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 8.0,
                                fontWeight: FontWeight.w600,
                              )),
                        )
                      ],
                    )),
              ],
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                ),
                child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          //If you want to show body behind the navbar, it should be true
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorBase.bluebase,
            currentIndex: currentIndex,
            unselectedItemColor: Colors.grey,
            onTap: (val) {
              currentIndex = val;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: new Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.get_app), title: new Text('Setoran')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), title: new Text('History')),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.exit_to_app), title: new Text('Keluar')),
            ],
          ),
          body: _widgetOptions.elementAt(currentIndex)),
    );
  }
}
