import 'package:flutter/material.dart';
import 'package:retribusi_app/widgets/custom_list_tile.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CustomListTileHistory(
                icon: Icons.ac_unit,
                title: 'Pembayaran Kios 1',
                subtitle: 'Sudah Lunas',
              ),
              CustomListTileHistory(
                icon: Icons.ac_unit,
                title: 'Pembayaran Kios 2',
                subtitle: 'Sudah Lunas',
              ),
              CustomListTileHistory(
                icon: Icons.ac_unit,
                title: 'Pembayaran Kios 3',
                subtitle: 'Belum Lunas',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
