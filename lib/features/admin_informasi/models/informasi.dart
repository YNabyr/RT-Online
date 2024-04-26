// To parse this JSON data, do
//
//     final informasi = informasiFromJson(jsonString);

import 'dart:convert';

Informasi informasiFromJson(String str) => Informasi.fromJson(json.decode(str));

String informasiToJson(Informasi data) => json.encode(data.toJson());

class Informasi {
  Data? data;
  String? message;
  List<dynamic>? settings;

  Informasi({
    this.data,
    this.message,
    this.settings,
  });

  factory Informasi.fromJson(Map<String, dynamic> json) => Informasi(
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
  String? description;
  String? photoUrl;
  String? categoriesId;
  String? categoriesName;

  ListElement({
    this.id,
    this.description,
    this.photoUrl,
    this.categoriesId,
    this.categoriesName,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        description: json["description"],
        photoUrl: json["photo_url"],
        categoriesId: json["categories_id"],
        categoriesName: json["categories_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "photo_url": photoUrl,
        "categories_id": categoriesId,
        "categories_name": categoriesName,
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
