import 'dart:convert';

AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));
String areaModelToJson(AreaModel data) => json.encode(data.toJson());

class AreaModel {
  AreaModel({
    this.status,
    this.message,
    this.areaTagih,
  });

  bool status;
  String message;
  List<AreaTagih> areaTagih;

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        status: json["status"],
        message: json["message"],
        areaTagih: List<AreaTagih>.from(
            json["area_tagih"].map((x) => AreaTagih.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "area_tagih": List<dynamic>.from(areaTagih.map((x) => x.toJson())),
      };
}

class AreaTagih {
  AreaTagih({
    this.id,
    this.nmPasar,
    this.kecamatanId,
    this.keterangan,
  });

  int id;
  String nmPasar;
  int kecamatanId;
  dynamic keterangan;

  factory AreaTagih.fromJson(Map<String, dynamic> json) => AreaTagih(
        id: json["id"],
        nmPasar: json["nm_pasar"],
        kecamatanId: json["kecamatan_id"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nm_pasar": nmPasar,
        "kecamatan_id": kecamatanId,
        "keterangan": keterangan,
      };
}
