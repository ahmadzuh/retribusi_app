class RegistrasiTempatModel {
  bool status;
  String message;
  List<RegistrasiTempat> registrasiTempat;

  RegistrasiTempatModel({this.status, this.message, this.registrasiTempat});

  RegistrasiTempatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['registrasi_tempat'] != null) {
      // ignore: deprecated_member_use
      registrasiTempat = new List<RegistrasiTempat>();
      json['registrasi_tempat'].forEach((v) {
        registrasiTempat.add(new RegistrasiTempat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.registrasiTempat != null) {
      data['registrasi_tempat'] =
          this.registrasiTempat.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegistrasiTempat {
  int id;
  String nmPedagang;
  String nmAsset;
  String jenisTagihan;
  int tarifRetkel;
  double tarifRetkeb;
  int tarifRetpela;
  double totalRetribusi;

  RegistrasiTempat(
      {this.id,
      this.nmPedagang,
      this.nmAsset,
      this.jenisTagihan,
      this.tarifRetkel,
      this.tarifRetkeb,
      this.tarifRetpela,
      this.totalRetribusi});

  RegistrasiTempat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nmPedagang = json['nm_pedagang'];
    nmAsset = json['nm_asset'];
    jenisTagihan = json['jenis_tagihan'];
    tarifRetkel = json['tarif_retkel'];
    tarifRetkeb = json['tarif_retkeb'];
    tarifRetpela = json['tarif_retpela'];
    totalRetribusi = json['total_retribusi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nm_pedagang'] = this.nmPedagang;
    data['nm_asset'] = this.nmAsset;
    data['jenis_tagihan'] = this.jenisTagihan;
    data['tarif_retkel'] = this.tarifRetkel;
    data['tarif_retkeb'] = this.tarifRetkeb;
    data['tarif_retpela'] = this.tarifRetpela;
    data['total_retribusi'] = this.totalRetribusi;
    return data;
  }
}
