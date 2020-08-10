import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int currentIndex = 0;

  final _widgetOptions = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Info Tagihan'),
          ),
          //If you want to show body behind the navbar, it should be true
          bottomNavigationBar: FloatingNavbar(
            backgroundColor: Colors.white,
            selectedBackgroundColor: Colors.white,
            selectedItemColor: Colors.green,
            currentIndex: currentIndex,
            unselectedItemColor: Colors.grey[500],
            onTap: (val) {
              currentIndex = val;
              setState(() {});
            },
            items: [
              FloatingNavbarItem(icon: Icons.home, title: 'Home'),
              FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
              FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
            ],
          ),
          body: _widgetOptions.elementAt(currentIndex)),
    );
  }
}
