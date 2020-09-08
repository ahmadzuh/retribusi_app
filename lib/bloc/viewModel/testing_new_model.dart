// To parse this JSON data, do
//
//     final testingNewModel = testingNewModelFromJson(jsonString);

import 'dart:convert';

TestingNewModel testingNewModelFromJson(String str) =>
    TestingNewModel.fromJson(json.decode(str));

String testingNewModelToJson(TestingNewModel data) =>
    json.encode(data.toJson());

class TestingNewModel {
  TestingNewModel({
    this.status,
    this.message,
    this.areaTagih,
  });

  bool status;
  String message;
  List<AreaTagih> areaTagih;

  factory TestingNewModel.fromJson(Map<String, dynamic> json) =>
      TestingNewModel(
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
    this.kecamatan,
  });

  int id;
  String nmPasar;
  Kecamatan kecamatan;

  factory AreaTagih.fromJson(Map<String, dynamic> json) => AreaTagih(
        id: json["id"],
        nmPasar: json["nm_pasar"],
        kecamatan: Kecamatan.fromJson(json["kecamatan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nm_pasar": nmPasar,
        "kecamatan": kecamatan.toJson(),
      };
}

class Kecamatan {
  Kecamatan({
    this.id,
    this.nmKecamatan,
  });

  int id;
  String nmKecamatan;

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        id: json["id"],
        nmKecamatan: json["nm_kecamatan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nm_kecamatan": nmKecamatan,
      };
}
