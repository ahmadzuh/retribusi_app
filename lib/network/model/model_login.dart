// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.data,
    this.token,
  });

  String status;
  Data data;
  String token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "token": token,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.areaTagih,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  List<dynamic> areaTagih;
  dynamic createdAt;
  dynamic updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        areaTagih: List<dynamic>.from(json["area_tagih"].map((x) => x)),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "area_tagih": List<dynamic>.from(areaTagih.map((x) => x)),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
