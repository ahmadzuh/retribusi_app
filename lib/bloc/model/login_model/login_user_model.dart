// To parse this JSON data, do
//
//     final loginUserModel = loginUserModelFromJson(jsonString);

import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  LoginUserModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  bool status;
  String message;
  Data data;
  String token;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "token": token,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  dynamic createdAt;
  dynamic updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
