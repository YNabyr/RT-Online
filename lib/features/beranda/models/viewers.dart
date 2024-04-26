// To parse this JSON data, do
//
//     final viewers = viewersFromJson(jsonString);

import 'dart:convert';

Viewers viewersFromJson(String str) => Viewers.fromJson(json.decode(str));

String viewersToJson(Viewers data) => json.encode(data.toJson());

class Viewers {
  List<Datum>? data;
  String? message;
  List<dynamic>? settings;

  Viewers({
    this.data,
    this.message,
    this.settings,
  });

  factory Viewers.fromJson(Map<String, dynamic> json) => Viewers(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
        settings: json["settings"] == null
            ? []
            : List<dynamic>.from(json["settings"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "settings":
            settings == null ? [] : List<dynamic>.from(settings!.map((x) => x)),
      };
}

class Datum {
  String? id;
  String? announcementId;
  String? citizenId;
  dynamic citizenPhoto;
  String? createdAt;

  Datum({
    this.id,
    this.announcementId,
    this.citizenId,
    this.citizenPhoto,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        announcementId: json["announcement_id"],
        citizenId: json["citizen_id"],
        citizenPhoto: json["citizen_photo"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "announcement_id": announcementId,
        "citizen_id": citizenId,
        "citizen_photo": citizenPhoto,
        "created_at": createdAt,
      };
}
