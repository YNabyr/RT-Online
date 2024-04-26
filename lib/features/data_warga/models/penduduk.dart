// To parse this JSON data, do
//
//     final penduduk = pendudukFromJson(jsonString);

import 'dart:convert';

Penduduk pendudukFromJson(String str) => Penduduk.fromJson(json.decode(str));

String pendudukToJson(Penduduk data) => json.encode(data.toJson());

class Penduduk {
  Data? data;
  String? message;
  List<dynamic>? settings;

  Penduduk({
    this.data,
    this.message,
    this.settings,
  });

  factory Penduduk.fromJson(Map<String, dynamic> json) => Penduduk(
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
  List<ListElement>? list;
  Meta? meta;

  Data({
    this.list,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class ListElement {
  String? id;
  String? name;
  String? nik;
  String? noKk;
  String? phoneNumber;
  String? email;
  String? houseId;
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

  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
  bool? update;
  bool? delete;

  Admin({
    this.view,
    this.create,
    this.update,
    this.delete,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        view: json["view"],
        create: json["create"],
        update: json["update"],
        delete: json["delete"],
      );

  Map<String, dynamic> toJson() => {
        "view": view,
        "create": create,
        "update": update,
        "delete": delete,
      };
}

class Meta {
  List<String>? links;
  int? total;

  Meta({
    this.links,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        links: json["links"] == null
            ? []
            : List<String>.from(json["links"]!.map((x) => x)),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x)),
        "total": total,
      };
}
