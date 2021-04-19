import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_item/multi_select_item.dart';
import '../../../common/const/color.dart';
import '../../../../bloc/view_model/kelompok_model/kelompok_retribusi_model.dart';
import '../../../../bloc/view_model/registrasi_tempat/regitrasi_tempat_model.dart';
import '../../../../network/services/api_services.dart';
import '../../../widget/custom_appbar.dart';

class RegistrasiTempatScreen extends StatefulWidget {
  final Retkel retkel;

  final bool isSelected;

  RegistrasiTempatScreen({this.retkel, this.isSelected});

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

  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }

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
        appBar: CustomAppBar.defaultAppBar(
          title: widget.retkel == null
              ? 'Registrasi Tempat'
              : widget.retkel.nmKelompok +
                  controller.selectedIndexes.length.toString(),
          actions: (controller.isSelecting)
              ? <Widget>[
                  IconButton(
                    icon: Icon(Icons.select_all),
                    onPressed: () {
                      selectAll();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                  )
                ]
              : <Widget>[],
        ),
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
                                'Rp.15.000,-',
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
                print(controller.isSelected(index));
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
                  subtitle: Text(registrasiTempat.totalRetribusi),
                  trailing: (controller.isSelected(index))
                      ? Icon(EvaIcons.checkmarkCircleOutline)
                      : null,
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
