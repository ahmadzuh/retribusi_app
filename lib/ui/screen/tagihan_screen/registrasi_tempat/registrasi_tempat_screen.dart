import 'package:flutter/material.dart';
import '../../../../bloc/view_model/kelompok_model/kelompok_retribusi_model.dart';
import '../../../../bloc/view_model/registrasi_tempat/regitrasi_tempat_model.dart';
import '../../../../network/services/api_services.dart';
import '../../../widget/custom_appbar.dart';

class RegistrasiTempatScreen extends StatefulWidget {
  final Retkel retkel;

  final String physicalStatus;
  final bool isSelected;

  RegistrasiTempatScreen({this.retkel, this.physicalStatus, this.isSelected});

  @override
  _RegistrasiTempatState createState() => _RegistrasiTempatState();
}

class _RegistrasiTempatState extends State<RegistrasiTempatScreen> {
  Webservice webservice;
  Retkel retkel;
  RegistrasiTempat registrasiTempat;

  // var isSelected = false;
  // var mycolor = Colors.white;

  // void toggleSelection() {
  //   if (isSelected) {
  //     mycolor = Colors.white;
  //     isSelected = false;
  //   } else {
  //     isSelected = true;
  //     mycolor = Colors.grey[300];
  //   }
  // }

  @override
  void initState() {
    super.initState();
    webservice = Webservice();
    retkel = widget.retkel;
    registrasiTempat = RegistrasiTempat();
  }

  bool isSelected = false;
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
          title: widget.retkel == null
              ? 'Registrasi Tempat'
              : widget.retkel.nmKelompok),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Detail Registrasi Tempat',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: webservice.registrasiTempat(retkel.id),
                builder: (BuildContext context,
                    AsyncSnapshot<List<RegistrasiTempat>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error.toString()}"),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    List<RegistrasiTempat> registrasiTempatElement =
                        snapshot.data;
                    return _buildListView(registrasiTempatElement);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: new Icon(Icons.send),
      // ),
    );
  }

  Widget _buildListView(List<RegistrasiTempat> registrasiTempatIndex) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemCount: registrasiTempatIndex.length,
        itemBuilder: (context, index) {
          RegistrasiTempat registrasiTempat = registrasiTempatIndex[index];
          return InkWell(
            onTap: () {
              print('ID = ' + ' ${registrasiTempat.id}');
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
                child: ListTile(
                  title: Text(registrasiTempat.nmPedagang),
                  subtitle: Text(registrasiTempat.nmAsset),
                ),
                decoration: BoxDecoration(
                  color: selectedIndex == index ? Colors.grey[300] : null,
                )),
          );
        },
      ),
    ));
  }
}
