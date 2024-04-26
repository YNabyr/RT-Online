// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Data? data;
  String? message;
  List<dynamic>? settings;

  Profile({
    this.data,
    this.message,
    this.settings,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        settings: json["settings"] == null
            ? []
            : List<dynamic>.from(json["settings"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "settings":
            settings == null ? [] : List<dynamic>.from(settings!.map((x) => x)),
      };
}

class Data {
  String? accessToken;
  String? tokenType;
  User? user;

  Data({
    this.accessToken,
    this.tokenType,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  String? name;
  String? nik;
  String? noKk;
  String? phoneNumber;
  String? email;
  dynamic houseId;
  String? duesId;
  String? gender;
  String? dateOfBirth;
  String? religion;
  String? rolesId;
  List<Access>? access;
  String? photoUrl;
  int? isInvited;
  int? isVerified;
  dynamic updatedSecurity;

  User({
    this.id,
    this.name,
    this.nik,
    this.noKk,
    this.phoneNumber,
    this.email,
    this.houseId,
    this.duesId,
    this.gender,
    this.dateOfBirth,
    this.religion,
    this.rolesId,
    this.access,
    this.photoUrl,
    this.isInvited,
    this.isVerified,
    this.updatedSecurity,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        nik: json["nik"],
        noKk: json["no_kk"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        houseId: json["house_id"],
        duesId: json["dues_id"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        religion: json["religion"],
        rolesId: json["roles_id"],
        access: json["access"] == null
            ? []
            : List<Access>.from(json["access"]!.map((x) => Access.fromJson(x))),
        photoUrl: json["photo_url"],
        isInvited: json["is_invited"],
        isVerified: json["is_verified"],
        updatedSecurity: json["updated_security"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nik": nik,
        "no_kk": noKk,
        "phone_number": phoneNumber,
        "email": email,
        "house_id": houseId,
        "dues_id": duesId,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "religion": religion,
        "roles_id": rolesId,
        "access": access == null
            ? []
            : List<dynamic>.from(access!.map((x) => x.toJson())),
        "photo_url": photoUrl,
        "is_invited": isInvited,
        "is_verified": isVerified,
        "updated_security": updatedSecurity,
      };
}

class Access {
  Admin? admin;

  Access({
    this.admin,
  });

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
      );

  Map<String, dynamic> toJson() => {
        "admin": admin?.toJson(),
      };
}

class Admin {
  bool? view;
  bool? create;
  bool? delete;
  bool? update;

  Admin({
    this.view,
    this.create,
    this.delete,
    this.update,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        view: json["view"],
        create: json["create"],
        delete: json["delete"],
        update: json["update"],
      );

  Map<String, dynamic> toJson() => {
        "view": view,
        "create": create,
        "delete": delete,
        "update": update,
      };
}
