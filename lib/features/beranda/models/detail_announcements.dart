// To parse this JSON data, do
//
//     final detailAnnouncements = detailAnnouncementsFromJson(jsonString);

import 'dart:convert';

DetailAnnouncements detailAnnouncementsFromJson(String str) =>
    DetailAnnouncements.fromJson(json.decode(str));

String detailAnnouncementsToJson(DetailAnnouncements data) =>
    json.encode(data.toJson());

class DetailAnnouncements {
  Data? data;
  String? message;
  List<dynamic>? settings;

  DetailAnnouncements({
    this.data,
    this.message,
    this.settings,
  });

  factory DetailAnnouncements.fromJson(Map<String, dynamic> json) =>
      DetailAnnouncements(
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
  String? id;
  String? title;
  String? description;
  String? photoUrl;
  String? createdAt;
  int? isPinned;
  List<Viewer>? viewers;

  Data({
    this.id,
    this.title,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.isPinned,
    this.viewers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        photoUrl: json["photo_url"],
        createdAt: json["created_at"],
        isPinned: json["is_pinned"],
        viewers: json["viewers"] == null
            ? []
            : List<Viewer>.from(
                json["viewers"]!.map((x) => Viewer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "photo_url": photoUrl,
        "created_at": createdAt,
        "is_pinned": isPinned,
        "viewers": viewers == null
            ? []
            : List<dynamic>.from(viewers!.map((x) => x.toJson())),
      };
}

class Viewer {
  String? id;
  String? announcementId;
  String? citizenId;
  dynamic citizenPhoto;
  String? createdAt;

  Viewer({
    this.id,
    this.announcementId,
    this.citizenId,
    this.citizenPhoto,
    this.createdAt,
  });

  factory Viewer.fromJson(Map<String, dynamic> json) => Viewer(
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
