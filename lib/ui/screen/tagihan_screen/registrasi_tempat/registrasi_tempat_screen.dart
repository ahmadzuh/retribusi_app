import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:retribusi_app/bloc/model/kelompok_model/kelompok_retribusi_model.dart';
import 'package:retribusi_app/bloc/model/registrasi_tempat/regitrasi_tempat_model.dart';
import '../../../common/const/color.dart';
import '../../../../network/services/api_services.dart';
import '../../../widget/custom_appbar.dart';

class RegistrasiTempatScreen extends StatefulWidget {
  final Retkel retkel;
  final bool isSelected;
  final RegistrasiTempat registrasiTempat;

  RegistrasiTempatScreen({this.retkel, this.isSelected, this.registrasiTempat});

  @override
  _RegistrasiTempatState createState() => _RegistrasiTempatState();
}

class _RegistrasiTempatState extends State<RegistrasiTempatScreen> {
  Webservice webservice;
  Retkel retkel;
  RegistrasiTempat registrasiTempat;
  List<RegistrasiTempat> registrasiTempatList;
  MultiSelectController controller = new MultiSelectController();

  @override
  void initState() {
    super.initState();
    webservice = Webservice();
    retkel = widget.retkel;
    registrasiTempat = RegistrasiTempat();
    isLoading = true;
    webservice.registrasiTempat(retkel.id).then((value) {
      setState(() {
        isLoading = false;
        registrasiTempatList = value;
      });
    });
  }

  bool isSelected = false;
  int selectedIndex;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //block app from quitting when selecting
        var before = !controller.isSelecting;
        setState(() {
          controller.deselectAll();
        });
        return before;
      },
      child: Scaffold(
        appBar: CustomAppBar.defaultAppBar(title: 'Registrasi Tempat'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 24.0),
              child: Column(
                children: [
                  Text('Registrasi Tempat',
                      style: GoogleFonts.openSans(fontSize: 18.0)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: (isLoading)
                      ? Center(
                          child: Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircularProgressIndicator()],
                          )),
                        )
                      : _buildListView()),
            ),
          ],
        ),
        bottomNavigationBar: controller.isSelecting
            ? Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                    child: SizedBox(
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawMaterialButton(
                        elevation: 0.4,
                        hoverElevation: 0.7,
                        focusElevation: 0.6,
                        highlightElevation: 0.4,
                        fillColor: ColorBase.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                            ),
                            SizedBox(
                              width: 5.0,
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Total Bayar',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                controller.selectedIndexes.length.toString(),
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                      FloatingActionButton(
                          backgroundColor: ColorBase.bluebase,
                          child: Icon(EvaIcons.arrowCircleRightOutline),
                          onPressed: () {})
                    ],
                  ),
                )),
              )
            : null,
      ),
    );
  }

  Widget _buildListView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: registrasiTempatList.length,
        itemBuilder: (BuildContext context, int index) {
          RegistrasiTempat registrasiTempat = registrasiTempatList[index];
          return MultiSelectItem(
            isSelecting: controller.isSelecting,
            onSelected: () {
              setState(() {
                controller.toggle(index);
                print(selectedIndex = index);
              });
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListTile(
                  dense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  title: Text(registrasiTempat.nmAsset),
                  subtitle:
                      Text('Rp.' + registrasiTempat.totalRetribusi.toString()),
                  trailing: (controller.isSelected(index))
                      ? Icon(
                          EvaIcons.checkmarkCircleOutline,
                          color: ColorBase.bluebase,
                        )
                      : Icon(EvaIcons.plusCircle),
                ),
              ),
              decoration: controller.isSelected(index)
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300])
                  : BoxDecoration(),
            ),
          );
        },
      ),
    );
  }
}
