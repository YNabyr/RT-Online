// To parse this JSON data, do
//
//     final kategoriInformasi = kategoriInformasiFromJson(jsonString);

import 'dart:convert';

KategoriInformasi kategoriInformasiFromJson(String str) =>
    KategoriInformasi.fromJson(json.decode(str));

String kategoriInformasiToJson(KategoriInformasi data) =>
    json.encode(data.toJson());

class KategoriInformasi {
  Data? data;
  String? message;
  List<dynamic>? settings;

  KategoriInformasi({
    this.data,
    this.message,
    this.settings,
  });

  factory KategoriInformasi.fromJson(Map<String, dynamic> json) =>
      KategoriInformasi(
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

  ListElement({
    this.id,
    this.name,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
