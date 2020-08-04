import 'dart:convert';

List<TagsResponseEntity> tagsResponseEntityFromJson(String str) =>
    List<TagsResponseEntity>.from(
        json.decode(str).map((x) => TagsResponseEntity.fromJson(x)));

String tagsResponseEntityToJson(List<TagsResponseEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TagsResponseEntity {
  TagsResponseEntity({
    this.tag,
  });

  String tag;

  factory TagsResponseEntity.fromJson(Map<String, dynamic> json) =>
      TagsResponseEntity(
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
      };
}

class TagRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;
  String newsID;

  TagRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
    this.newsID,
  });

  Map<String, dynamic> toJson() => {
        "categoryCode": categoryCode,
        "channelCode": channelCode,
        "tag": tag,
        "keyword": keyword,
        "newsID": newsID,
      };
}
