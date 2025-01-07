import 'dart:ffi';

class DetailWisataModel {
  Detail detail;

  DetailWisataModel({
    required this.detail,
  });

  factory DetailWisataModel.fromJson(Map<String, dynamic> json) =>
      DetailWisataModel(
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail.toJson(),
      };
}

class Detail {
  int id;
  int userId;
  int wisataCategoryId;
  String nama;
  String alamat;
  String deskripsi;
  double latitude;
  double longitude;
  String operatingHours;
  DateTime createdAt;
  DateTime updatedAt;
  Image image;
  Clicks clicks;
  Info info;
  Kategori kategori;

  Detail({
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
    required this.clicks,
    required this.info,
    required this.kategori,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
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
        clicks: Clicks.fromJson(json["clicks"]),
        info: Info.fromJson(json["info"]),
        kategori: Kategori.fromJson(json["kategori"]),
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
        "clicks": clicks.toJson(),
        "info": info.toJson(),
        "kategori": kategori.toJson(),
      };
}

class Clicks {
  int id;
  int wisataId;
  int userClick;
  DateTime createdAt;
  DateTime updatedAt;

  Clicks({
    required this.id,
    required this.wisataId,
    required this.userClick,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Clicks.fromJson(Map<String, dynamic> json) => Clicks(
        id: json["id"],
        wisataId: json["wisata_id"],
        userClick: json["user_click"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wisata_id": wisataId,
        "user_click": userClick,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Image {
  int id;
  int wisataId;
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

class Info {
  int id;
  int wisataId;
  String phone;
  String email;
  String website;
  DateTime createdAt;
  DateTime updatedAt;

  Info({
    required this.id,
    required this.wisataId,
    required this.phone,
    required this.email,
    required this.website,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        wisataId: json["wisata_id"],
        phone: json["phone"],
        email: json["email"],
        website: json["website"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wisata_id": wisataId,
        "phone": phone,
        "email": email,
        "website": website,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Kategori {
  int id;
  int userId;
  String category;
  DateTime createdAt;
  DateTime updatedAt;

  Kategori({
    required this.id,
    required this.userId,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
