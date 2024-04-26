// To parse this JSON data, do
//
//     final iuran = iuranFromJson(jsonString);

import 'dart:convert';

Iuran iuranFromJson(String str) => Iuran.fromJson(json.decode(str));

String iuranToJson(Iuran data) => json.encode(data.toJson());

class Iuran {
  Data? data;
  String? message;
  List<dynamic>? settings;

  Iuran({
    this.data,
    this.message,
    this.settings,
  });

  factory Iuran.fromJson(Map<String, dynamic> json) => Iuran(
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
  List<Detail>? detail;
  int? nominalDues;

  ListElement({
    this.id,
    this.name,
    this.detail,
    this.nominalDues,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        name: json["name"],
        detail: json["detail"] == null
            ? []
            : List<Detail>.from(json["detail"]!.map((x) => Detail.fromJson(x))),
        nominalDues: json["nominal_dues"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "detail": detail == null
            ? []
            : List<dynamic>.from(detail!.map((x) => x.toJson())),
        "nominal_dues": nominalDues,
      };
}

class Detail {
  String? id;
  String? duesId;
  String? name;
  int? nominal;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int? createdBy;
  int? updatedBy;
  int? deletedBy;

  Detail({
    this.id,
    this.duesId,
    this.name,
    this.nominal,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        duesId: json["dues_id"],
        name: json["name"],
        nominal: json["nominal"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dues_id": duesId,
        "name": name,
        "nominal": nominal,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
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
