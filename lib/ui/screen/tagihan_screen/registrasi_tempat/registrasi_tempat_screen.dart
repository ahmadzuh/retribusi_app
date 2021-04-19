import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_item/multi_select_item.dart';
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
    return Scaffold(
      appBar: CustomAppBar.defaultAppBar(
        title: widget.retkel == null
            ? 'Registrasi Tempat'
            : widget.retkel.nmKelompok +
                "(" +
                controller.selectedIndexes.length.toString() +
                ")",
        actions: (controller.isSelecting)
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.send_to_mobile),
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
          Stack(
            fit: StackFit.expand,
            children: [
              Row(
                children: [],
              )
            ],
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
          _bottomBar()
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
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
                  title: Text(registrasiTempat.nmAsset),
                  subtitle: Text(registrasiTempat.totalRetribusi),
                  trailing: (controller.isSelected(index))
                      ? Icon(EvaIcons.checkmarkCircleOutline)
                      : null,
                ),
              ),
              decoration: controller.isSelected(index)
                  ? BoxDecoration(color: Colors.grey[300])
                  : BoxDecoration(),
            ),
          );
        },
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
        child: controller.isSelecting ? Text('data') : Text('Hello'));
  }
}
