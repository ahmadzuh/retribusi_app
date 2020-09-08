import 'package:flutter/material.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
import 'package:retribusi_app/ui/pages/page_history/history_page.dart';
import 'package:retribusi_app/ui/pages/page_pengaturan/pengaturan_page.dart';
import 'package:retribusi_app/ui/pages/page_setoran/setoran_page.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/tagihan_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final _widgetOptions = [Tagihan(), Setoran(), History(), Pengaturan()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,

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
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: new Text('Akun')),
            ],
          ),
          body: _widgetOptions.elementAt(currentIndex)),
    );
  }
}
