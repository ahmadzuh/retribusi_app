import 'dart:convert';

RegistrasiTempatModel registrasiTempatModelFromJson(String str) =>
    RegistrasiTempatModel.fromJson(json.decode(str));

String registrasiTempatModelToJson(RegistrasiTempatModel data) =>
    json.encode(data.toJson());

class RegistrasiTempatModel {
  RegistrasiTempatModel({
    this.status,
    this.message,
    this.registrasiTempat,
  });

  bool status;
  String message;
  List<RegistrasiTempat> registrasiTempat;

  factory RegistrasiTempatModel.fromJson(Map<String, dynamic> json) =>
      RegistrasiTempatModel(
        status: json["status"],
        message: json["message"],
        registrasiTempat: List<RegistrasiTempat>.from(
            json["registrasi_tempat"].map((x) => RegistrasiTempat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "registrasi_tempat":
            List<dynamic>.from(registrasiTempat.map((x) => x.toJson())),
      };
}

class RegistrasiTempat {
  RegistrasiTempat({
    this.id,
    this.nmPedagang,
    this.nmAsset,
    this.jenisTagihan,
    this.tarifRetkel,
    this.tarifRetkeb,
    this.tarifRetpela,
    this.totalRetribusi,
  });

  int id;
  String nmPedagang;
  String nmAsset;
  String jenisTagihan;
  String tarifRetkel;
  String tarifRetkeb;
  dynamic tarifRetpela;
  String totalRetribusi;

  factory RegistrasiTempat.fromJson(Map<String, dynamic> json) =>
      RegistrasiTempat(
        id: json["id"],
        nmPedagang: json["nm_pedagang"],
        nmAsset: json["nm_asset"],
        jenisTagihan: json["jenis_tagihan"],
        tarifRetkel: json["tarif_retkel"],
        tarifRetkeb: json["tarif_retkeb"],
        tarifRetpela: json["tarif_retpela"],
        totalRetribusi: json["total_retribusi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nm_pedagang": nmPedagang,
        "nm_asset": nmAsset,
        "jenis_tagihan": jenisTagihan,
        "tarif_retkel": tarifRetkel,
        "tarif_retkeb": tarifRetkeb,
        "tarif_retpela": tarifRetpela,
        "total_retribusi": totalRetribusi,
      };
}
