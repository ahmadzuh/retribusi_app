// import 'dart:convert';

// AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));
// String areaModelToJson(AreaModel data) => json.encode(data.toJson());

// class AreaModel {
//   AreaModel({
//     this.status,
//     this.message,
//     this.areaTagih,
//   });

//   bool status;
//   String message;
//   List<AreaTagih> areaTagih;

//   factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
//         status: json["status"],
//         message: json["message"],
//         areaTagih: List<AreaTagih>.from(
//             json["area_tagih"].map((x) => AreaTagih.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "area_tagih": List<dynamic>.from(areaTagih.map((x) => x.toJson())),
//       };
// }

// class AreaTagih {
//   AreaTagih({
//     this.id,
//     this.nmPasar,
//     this.kecamatanId,
//     this.keterangan,
//   });

//   int id;
//   String nmPasar;
//   int kecamatanId;
//   dynamic keterangan;

//   factory AreaTagih.fromJson(Map<String, dynamic> parsedJson) => AreaTagih(
//         id: parsedJson["id"],
//         nmPasar: parsedJson["nm_pasar"],
//         kecamatanId: parsedJson["kecamatan_id"],
//         keterangan: parsedJson["keterangan"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nm_pasar": nmPasar,
//         "kecamatan_id": kecamatanId,
//         "keterangan": keterangan,
//       };
// }

// class Kecamatan {
//   Kecamatan({
//     this.id,
//     this.nmKecamatan,
//   });

//   int id;
//   String nmKecamatan;

//   factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
//         id: json["id"],
//         nmKecamatan: json["nm_kecamatan"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nm_kecamatan": nmKecamatan,
//       };
// }
