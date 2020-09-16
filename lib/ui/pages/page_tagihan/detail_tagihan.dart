import 'package:flutter/material.dart';

import '../../../bloc/view_model/area_tagih_model.dart';
import '../../../bloc/view_model/kelompok_retribusi_model.dart';
import '../../../network/services/api_services.dart';

class TagihanDetail extends StatefulWidget {
  final AreaTagih areaTagih;
  final Datum datum;
  TagihanDetail({this.areaTagih, this.datum});

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
      appBar: AppBar(
          title: Text(
        widget.areaTagih == null ? 'Form Detail' : widget.areaTagih.nmPasar,
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Expanded(
            child: FutureBuilder(
              future: webservice.areaTagih(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AreaTagih>> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error.toString()}"),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  List<AreaTagih> profiles = snapshot.data;
                  return _buildListView(profiles);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<AreaTagih> areatagihs) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          AreaTagih areaTagih = areatagihs[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      areaTagih.nmPasar,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    // Text(areaTagih.kecamatan.nmKecamatan),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            var result = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TagihanDetail(areaTagih: areaTagih);
                            }));
                            if (result != null) {
                              setState(() {});
                            }
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
          );
        },
        itemCount: areatagihs.length,
      ),
    ));
  }
}
