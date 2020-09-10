// To parse this JSON data, do
//
//     final kelompokRetribusiModel = kelompokRetribusiModelFromJson(jsonString);

import 'dart:convert';

KelompokRetribusiModel kelompokRetribusiModelFromJson(String str) =>
    KelompokRetribusiModel.fromJson(json.decode(str));

String kelompokRetribusiModelToJson(KelompokRetribusiModel data) =>
    json.encode(data.toJson());

class KelompokRetribusiModel {
  KelompokRetribusiModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory KelompokRetribusiModel.fromJson(Map<String, dynamic> json) =>
      KelompokRetribusiModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.nmKelompok,
    this.jenisBangunan,
  });

  int id;
  String nmKelompok;
  String jenisBangunan;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nmKelompok: json["nm_kelompok"],
        jenisBangunan: json["jenis_bangunan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nm_kelompok": nmKelompok,
        "jenis_bangunan": jenisBangunan,
      };
}
