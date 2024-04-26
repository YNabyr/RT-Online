// To parse this JSON data, do
//
//     final house = houseFromJson(jsonString);

import 'dart:convert';

House houseFromJson(String str) => House.fromJson(json.decode(str));

String houseToJson(House data) => json.encode(data.toJson());

class House {
  Data? data;
  String? message;
  List<dynamic>? settings;

  House({
    this.data,
    this.message,
    this.settings,
  });

  factory House.fromJson(Map<String, dynamic> json) => House(
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
  String? blockId;
  String? blockName;
  int? houseNumber;
  String? house;

  ListElement({
    this.id,
    this.blockId,
    this.blockName,
    this.houseNumber,
    this.house,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        blockId: json["block_id"],
        blockName: json["block_name"],
        houseNumber: json["house_number"],
        house: json["house"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "block_id": blockId,
        "block_name": blockName,
        "house_number": houseNumber,
        "house": house,
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
