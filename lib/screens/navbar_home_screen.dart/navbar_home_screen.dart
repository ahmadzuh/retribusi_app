import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:retribusi_app/constants/base_environment.dart';
import 'package:retribusi_app/screens/home_screen/home_screen.dart';
import 'package:retribusi_app/screens/riwayat_screen.dart/riwayat_screen.dart';
import 'package:retribusi_app/screens/setoran_screen/setoran_screen.dart';
import 'package:retribusi_app/screens/setting_screen/settings_screen.dart';

class NavbarHomeScreen extends StatefulWidget {
  const NavbarHomeScreen({Key key}) : super(key: key);

  @override
  _NavbarHomeScreenState createState() => _NavbarHomeScreenState();
}

class _NavbarHomeScreenState extends State<NavbarHomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    RiwayatScreen(),
    SetoranScreen(),
    SettingsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              '${BaseEnvironment.iconAssets}logo.png',
              width: 40.0,
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Retribusi',
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text('Pelayanan Aplikasi Retribusi',
                        style: TextStyle(color: Colors.black, fontSize: 14.0)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.homeOutline), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.clipboardOutline), label: 'Riwayat'),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.downloadOutline), label: 'Setoran'),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.peopleOutline), label: 'Akun')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
