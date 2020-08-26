import 'dart:convert';

class AreaTagihModel {
  bool status;
  String message;
  List<AreaTagih> areaTagih;

  AreaTagihModel({this.status, this.message, this.areaTagih});

  AreaTagihModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['area_tagih'] != null) {
      areaTagih = new List<AreaTagih>();
      json['area_tagih'].forEach((v) {
        areaTagih.add(new AreaTagih.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.areaTagih != null) {
      data['area_tagih'] = this.areaTagih.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaTagih {
  int id;
  String nmPasar;
  int kecamatanId;
  Null keterangan;

  AreaTagih({this.id, this.nmPasar, this.kecamatanId, this.keterangan});

  AreaTagih.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nmPasar = json['nm_pasar'];
    kecamatanId = json['kecamatan_id'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nm_pasar'] = this.nmPasar;
    data['kecamatan_id'] = this.kecamatanId;
    data['keterangan'] = this.keterangan;
    return data;
  }
}

List<AreaTagih> areatagihFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<AreaTagih>.from(data.map((item) => AreaTagih.fromJson(item)));
}
