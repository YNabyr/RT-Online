// To parse this JSON data, do
//
//     final general = generalFromJson(jsonString);

import 'dart:convert';

General generalFromJson(String str) => General.fromJson(json.decode(str));

String generalToJson(General data) => json.encode(data.toJson());

class General {
  Data? data;
  String? message;
  List<dynamic>? settings;

  General({
    this.data,
    this.message,
    this.settings,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
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
  int? rt;
  int? rw;
  String? address;
  String? province;
  String? city;
  String? district;
  String? postCode;
  String? responsiblePerson;
  String? phoneNumber;
  Bank? bank;
  List<Structure>? structure;

  ListElement({
    this.id,
    this.rt,
    this.rw,
    this.address,
    this.province,
    this.city,
    this.district,
    this.postCode,
    this.responsiblePerson,
    this.phoneNumber,
    this.bank,
    this.structure,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        rt: json["rt"],
        rw: json["rw"],
        address: json["address"],
        province: json["province"],
        city: json["city"],
        district: json["district"],
        postCode: json["post_code"],
        responsiblePerson: json["responsible_person"],
        phoneNumber: json["phone_number"],
        bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
        structure: json["structure"] == null
            ? []
            : List<Structure>.from(
                json["structure"]!.map((x) => Structure.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rt": rt,
        "rw": rw,
        "address": address,
        "province": province,
        "city": city,
        "district": district,
        "post_code": postCode,
        "responsible_person": responsiblePerson,
        "phone_number": phoneNumber,
        "bank": bank?.toJson(),
        "structure": structure == null
            ? []
            : List<dynamic>.from(structure!.map((x) => x.toJson())),
      };
}

class Bank {
  String? id;
  String? name;
  String? noRek;
  String? holderName;

  Bank({
    this.id,
    this.name,
    this.noRek,
    this.holderName,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"],
        name: json["name"],
        noRek: json["no_rek"],
        holderName: json["holder_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "no_rek": noRek,
        "holder_name": holderName,
      };
}

class Structure {
  String? id;
  String? position;
  String? citizenId;

  Structure({
    this.id,
    this.position,
    this.citizenId,
  });

  factory Structure.fromJson(Map<String, dynamic> json) => Structure(
        id: json["id"],
        position: json["position"],
        citizenId: json["citizen_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
        "citizen_id": citizenId,
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
