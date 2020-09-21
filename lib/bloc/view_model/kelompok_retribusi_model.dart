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
    this.retkel,
  });

  bool status;
  String message;
  List<Retkel> retkel;

  factory KelompokRetribusiModel.fromJson(Map<String, dynamic> json) =>
      KelompokRetribusiModel(
        status: json["status"],
        message: json["message"],
        retkel:
            List<Retkel>.from(json["retkel"].map((x) => Retkel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "retkel": List<dynamic>.from(retkel.map((x) => x.toJson())),
      };
}

class Retkel {
  Retkel({
    this.id,
    this.nmKelompok,
    this.jenisBangunan,
  });

  int id;
  String nmKelompok;
  String jenisBangunan;

  factory Retkel.fromJson(Map<String, dynamic> json) => Retkel(
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
