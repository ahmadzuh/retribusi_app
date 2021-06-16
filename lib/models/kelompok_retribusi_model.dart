class KelompokRetribusiModel {
  bool status;
  String message;
  List<RetkelModel> retkelModel;

  KelompokRetribusiModel({this.status, this.message, this.retkelModel});

  factory KelompokRetribusiModel.fromMap(Map<String, dynamic> json) {
    return KelompokRetribusiModel(
        message: json['message'],
        status: json['status'],
        retkelModel: List<RetkelModel>.from(
            json['users'].map((i) => RetkelModel.fromMap(i))));
  }
}

class RetkelModel {
  String id;
  String nmKelompok;
  String jenisBangunan;

  RetkelModel({this.id, this.nmKelompok, this.jenisBangunan});

  factory RetkelModel.fromMap(Map<String, dynamic> json) {
    return RetkelModel(
        id: json['id'],
        nmKelompok: json['nm_kelompok'],
        jenisBangunan: json['jenis_bangunan']);
  }
}
