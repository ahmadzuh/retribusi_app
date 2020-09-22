import 'package:flutter/material.dart';
import 'package:retribusi_app/ui/common/util/toast_util.dart';
import 'package:retribusi_app/ui/widget/custom_appbar.dart';

import '../../../bloc/view_model/area_tagih_model.dart';
import '../../../network/services/api_services.dart';

class TagihanDetail extends StatefulWidget {
  final AreaTagih areaTagih;
  final List<AreaTagih> areatagihs;

  TagihanDetail({this.areaTagih, this.areatagihs});

  @override
  _TagihanDetailState createState() => _TagihanDetailState();
}

class _TagihanDetailState extends State<TagihanDetail> {
  Webservice webservice;

  @override
  void initState() {
    super.initState();
    webservice = Webservice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar.defaultAppBar(
            title: widget.areaTagih == null
                ? 'Detail Tagihan'
                : widget.areaTagih.nmPasar),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Container(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.areaTagih.kecamatan.nmKecamatan,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(widget.areaTagih.id.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  ToastUtils.show(
                                      widget.areaTagih.id.toString());
                                },
                                child: Text(
                                  "Lihat",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}
