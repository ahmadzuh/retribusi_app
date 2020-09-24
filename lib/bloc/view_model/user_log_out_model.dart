// To parse this JSON data, do
//
//     final userLogOutModel = userLogOutModelFromJson(jsonString);

import 'dart:convert';

UserLogOutModel userLogOutModelFromJson(String str) =>
    UserLogOutModel.fromJson(json.decode(str));

String userLogOutModelToJson(UserLogOutModel data) =>
    json.encode(data.toJson());

class UserLogOutModel {
  UserLogOutModel({
    this.status,
  });

  String status;

  factory UserLogOutModel.fromJson(Map<String, dynamic> json) =>
      UserLogOutModel(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
