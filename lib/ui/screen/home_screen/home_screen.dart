import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../setoran_screen/setoran_screen.dart';
import '../tagihan_screen/tagihan_retribusi/tagihan_screen.dart';
import '../riwayat_screen/riwayat_screen.dart';
import '../setting_screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    TagihanScreen(),
    SetoranScreen(),
    RiwayatScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.archiveOutline),
            label: 'Setoran',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.bookOpenOutline),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.person),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
