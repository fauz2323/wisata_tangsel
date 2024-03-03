class WisataModel {
  List<Wisata> wisata;

  WisataModel({
    required this.wisata,
  });

  factory WisataModel.fromJson(Map<String, dynamic> json) => WisataModel(
        wisata:
            List<Wisata>.from(json["wisata"].map((x) => Wisata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "wisata": List<dynamic>.from(wisata.map((x) => x.toJson())),
      };
}

class Wisata {
  int id;
  String userId;
  String wisataCategoryId;
  String nama;
  String alamat;
  String deskripsi;
  String latitude;
  String longitude;
  String operatingHours;
  DateTime createdAt;
  DateTime updatedAt;
  Image image;

  Wisata({
    required this.id,
    required this.userId,
    required this.wisataCategoryId,
    required this.nama,
    required this.alamat,
    required this.deskripsi,
    required this.latitude,
    required this.longitude,
    required this.operatingHours,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Wisata.fromJson(Map<String, dynamic> json) => Wisata(
        id: json["id"],
        userId: json["user_id"],
        wisataCategoryId: json["wisata_category_id"],
        nama: json["nama"],
        alamat: json["alamat"],
        deskripsi: json["deskripsi"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        operatingHours: json["operating_hours"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "wisata_category_id": wisataCategoryId,
        "nama": nama,
        "alamat": alamat,
        "deskripsi": deskripsi,
        "latitude": latitude,
        "longitude": longitude,
        "operating_hours": operatingHours,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image.toJson(),
      };
}

class Image {
  int id;
  String wisataId;
  String image;
  String uuid;
  DateTime createdAt;
  DateTime updatedAt;

  Image({
    required this.id,
    required this.wisataId,
    required this.image,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        wisataId: json["wisata_id"],
        image: json["image"],
        uuid: json["uuid"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wisata_id": wisataId,
        "image": image,
        "uuid": uuid,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
