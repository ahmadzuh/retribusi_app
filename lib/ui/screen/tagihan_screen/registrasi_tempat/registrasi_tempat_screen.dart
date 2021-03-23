import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
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

  @override
  void initState() {
    super.initState();
    webservice = Webservice();
    retkel = widget.retkel;
    registrasiTempat = RegistrasiTempat();
  }

  bool isSelected = false;
  int selectedIndex;
  bool isLoading = false;

  play() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

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
              'Registrasi Tempat',
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
                      child: ListTileShimmer(
                        isDisabledAvatar: true,
                        isDisabledButton: true,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
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
          return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: InkWell(
              onTap: () {
                print('ID = ' + ' ${registrasiTempat.id}');
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                  child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(registrasiTempat.nmPedagang),
                            Text(registrasiTempat.nmAsset),
                          ],
                        )),
                  ),
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? Colors.grey[300] : null,
                  )),
            ),
          );
        },
      ),
    ));
  }
}
