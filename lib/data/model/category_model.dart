class CategoryModel {
  List<Category> category;

  CategoryModel({
    required this.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  String userId;
  String category;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.userId,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
