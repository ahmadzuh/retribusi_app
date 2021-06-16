import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({Key key}) : super(key: key);

  @override
  _RiwayatScreenState createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            children: [
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
        ));
  }
}
