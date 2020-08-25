class ListAreaTagih {
  List<AreaTagih> areaTagih;

  ListAreaTagih({this.areaTagih});

  ListAreaTagih.fromJson(Map<String, dynamic> json) {
    if (json['area_tagih'] != null) {
      areaTagih = new List<AreaTagih>();
      json['area_tagih'].forEach((v) {
        areaTagih.add(new AreaTagih.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
