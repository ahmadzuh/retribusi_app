import 'package:flutter/material.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
import 'package:retribusi_app/ui/widget/custom_appbar.dart';

class Setoran extends StatefulWidget {
  @override
  _SetoranState createState() => _SetoranState();
}

class _SetoranState extends State<Setoran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(title: 'Setoran'),
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              color: ColorBase.bluebase,
              child: TabBar(
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.blueGrey,
                labelColor: Colors.white,
                tabs: [
                  Tab(text: 'Menu 1', icon: Icon(Icons.directions_car)),
                  Tab(text: 'Menu 2', icon: Icon(Icons.directions_car)),
                ],
              ),
            ),
            TabBarView(
              children: [
                Icon(
                  Icons.directions_car,
                  color: Colors.black,
                ),
                Icon(Icons.directions_transit),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
