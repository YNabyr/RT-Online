// To parse this JSON data, do
//
//     final pengumuman = pengumumanFromJson(jsonString);

import 'dart:convert';

Pengumuman pengumumanFromJson(String str) =>
    Pengumuman.fromJson(json.decode(str));

String pengumumanToJson(Pengumuman data) => json.encode(data.toJson());

class Pengumuman {
  Data? data;
  String? message;
  List<dynamic>? settings;

  Pengumuman({
    this.data,
    this.message,
    this.settings,
  });

  factory Pengumuman.fromJson(Map<String, dynamic> json) => Pengumuman(
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
  String? title;
  String? description;
  String? photoUrl;
  String? createdAt;
  int? isPinned;

  ListElement({
    this.id,
    this.title,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.isPinned,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        photoUrl: json["photo_url"],
        createdAt: json["created_at"],
        isPinned: json["is_pinned"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "photo_url": photoUrl,
        "created_at": createdAt,
        "is_pinned": isPinned,
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
