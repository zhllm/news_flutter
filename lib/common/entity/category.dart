
import 'dart:convert';

List<CategoryResponseEntity> categoryResponseEntityFromJson(String str) => List<CategoryResponseEntity>.from(json.decode(str).map((x) => CategoryResponseEntity.fromJson(x)));

String categoryResponseEntityToJson(List<CategoryResponseEntity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponseEntity {
  CategoryResponseEntity({
    this.code,
    this.title,
  });

  String code;
  String title;

  factory CategoryResponseEntity.fromJson(Map<String, dynamic> json) => CategoryResponseEntity(
    code: json["code"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "title": title,
  };
}
