class Struktur {
  final String residenceId;
  final String name;
  final String position;
  final String phoneNumber;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final String createdBy;
  final String updatedBy;
  final String deletedBy;
  final String id;

  Struktur({
    required this.residenceId,
    required this.name,
    required this.position,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.id,
  });

  factory Struktur.fromJson(Map<String, dynamic> json) {
    return Struktur(
      residenceId: json['residence_id'],
      name: json['name'],
      position: json['position'],
      phoneNumber: json['phone_number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      id: json['id'],
    );
  }

  // Tambahkan method untuk mengubah JSON menjadi List<Struktur>
  static List<Struktur> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Struktur.fromJson(json)).toList();
  }
}
